#!/bin/bash

set -e

usage() {
  echo -e "\nUsage: $0 --target <mac address> [--sleep 1]"
  echo -e "\t-h, --help      Show this help menu"
  echo -e "\t-t, --target    REQUIRED: MAC address of target device"
  echo -e "\t-s, --sleep     Time between RSSI checks (default: 1)"
  echo -e "\t-a, --audio     Enable audio feedback"
  echo -e "\t-v, --verbose   Enable debug output"
  echo
}

readonly PROGRESS='#####################################################################'
readonly red=$'\e[0;31m'
readonly end=$'\e[0m'
readonly ISNUMBER='^[0-9.]+$'
readonly ISMAC='^([a-fA-F0-9]{2}:){5}[a-fA-F0-9]{2}$'

target=""
sleep=1
audio=0
quiet=0
sim=0
minrssi=128
maxrssi=-128

cleanup() {
  echo -e "\nStopping scan..."
  # Kill tmux session if it exists
  if tmux has-session -t bluetoothctl 2>/dev/null; then
    tmux kill-session -t bluetoothctl
  fi
  bluetoothctl scan off >/dev/null
}
trap cleanup EXIT
trap cleanup INT TERM

# --- Get RSSI from bluetoothctl ---
get_rssi_btctl() {
  local target_mac="$1"
  output=$(bluetoothctl info "$target_mac" 2>/dev/null)
  echo "$output" | grep -i "RSSI" | awk -F'[()]' '{print $2}'
}

control_c() {
  echo
  [[ "$minrssi" != "128" ]] && echo "MIN RSSI: $minrssi"
  [[ "$maxrssi" != "-128" ]] && echo "MAX RSSI: $maxrssi"
  echo "Thanks for tracking with majestic_sonar."
  exit 0
}

# --- Parse Args ---
while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help) usage; exit 0 ;;
    -t|--target)
      [[ "$2" =~ $ISMAC ]] || { echo "Invalid MAC: $2"; exit 1; }
      target="$2"; shift ;;
    -s|--sleep)
      [[ "$2" =~ $ISNUMBER ]] || { echo "Sleep must be a number"; exit 1; }
      sleep="$2"; shift ;;
    -a|--audio) audio=1 ;;
    -v|--verbose) quiet=1 ;;
    --sim) sim=1; rssi=-70 ;;
    *) echo "Unknown option: $1"; usage; exit 1 ;;
  esac
  shift
done

[[ -z "$target" && "$sim" -ne 1 ]] && { echo "Error: --target is required"; usage; exit 1; }

# --- Ensure Bluetooth is ready ---
echo "Ensuring Bluetooth is powered on..."
bluetoothctl power on >/dev/null

# --- Start bluetoothctl scan in tmux ---
start_bluetoothctl_scan() {
  # Start bluetoothctl in a tmux session
  tmux new-session -d -s bluetoothctl "bluetoothctl"
  sleep 1
  tmux send-keys -t bluetoothctl "scan on" Enter
}

# Start the Bluetooth scan
start_bluetoothctl_scan

# Allow time for the scan to run
sleep 3

# --- Optional: wait until device appears ---
if [[ "$sim" -ne 1 ]]; then
  echo "Waiting for device $target to appear in scan..."
  found=""
  for i in {1..10}; do
    if bluetoothctl devices | grep -iq "$target"; then
      found=1
      break
    fi
    sleep 1
  done

  if [[ -z "$found" ]]; then
    echo "⚠️  Warning: Device $target not seen during scan. Continuing anyway..."
  fi
fi

# --- Main Loop ---
while true; do
  if [[ "$sim" -eq 1 ]]; then
    rssi=$((rssi + 1))
    [[ "$rssi" -ge 21 ]] && control_c
  else
    rssi=$(get_rssi_btctl "$target")
    if [[ -z "$rssi" ]]; then
      echo "Out of range or no signal from $target"
      sleep "$sleep"
      continue
    fi
  fi

  # --- Display Bar ---
  bars=$((rssi + 65))
  if (( bars <= 0 )); then
    echo -e "RSSI: ${rssi}  ${PROGRESS:0:1}${red}${PROGRESS:1}${end}"
  elif (( bars > ${#PROGRESS} )); then
    echo -e "RSSI: ${rssi}  ${PROGRESS}"
  else
    echo -e "RSSI: ${rssi}  ${PROGRESS:0:$bars}${red}${PROGRESS:$bars}${end}"
  fi

  (( rssi < minrssi )) && minrssi=$rssi
  (( rssi > maxrssi )) && maxrssi=$rssi

  # --- Optional Audio ---
  if [[ "$audio" -eq 1 ]]; then
    RSSIN=$((rssi*-1))
    freq=$(((65+rssi)/5*300))
    dur=.3
    spd=$((RSSIN+10))
    dur=.$spd
    PULSE_SERVER=unix:/run/user/1000/pulse/native play -n -c1 synth "$dur" sine "$freq" 2>/dev/null
  fi

  sleep "$sleep"
done
