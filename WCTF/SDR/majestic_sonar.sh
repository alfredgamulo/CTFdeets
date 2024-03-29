#!/bin/bash

if [ x"$(command -v id 2> /dev/null)" != "x" ]
then
  USERID="$(id -u 2> /dev/null)"
fi

if [ "x${USERID}" = "x" ] && [ "x${UID}" != "x" ]
then
  USERID=${UID}
fi

if [ x${USERID} != "x" ] && [ x${USERID} != "x0" ]
then
  printf "Run it as root\n"
  exit 1
fi

usage() {
  printf "\nUsage: ${0} --target <mac address> [--sleep 1]\n"
  printf "\t-h,\t--help,     \tShow this help menu\n"
  printf "\t-t,\t--target,   \tRequired: specify target mac address, ex: 00:11:22:33:44:55\n"
  printf "\t-i,\t--interface,\tSpecify which bluetooth device to use, defaults to hci0\n"
  printf "\t-s,\t--sleep,    \tSpecify how long to sleep between pings, defaults to 1\n"
  printf "\t-a,\t--audio,    \tEnable audio\n"
  printf "\t-v,\t--verbose,  \tShow l2ping output, mostly for debugging\n"
  printf "\n"
}

readonly PROGRESS='#####################################################################'
readonly red=$'\e[0;31m'
readonly end=$'\e[0m'
readonly ISNUMBER='^[0-9.]+$'
readonly ISMAC='^([a-fA-F0-9]{2}:){5}[a-fA-F0-9]{2}$'
radio="hci0"
target=""
sleep="1"
quiet="0"
audio="0"
freq="-1"
dur="1"
minrssi=128
maxrssi=-128
sim="0"

control_c() {
  kill ${l2pid} 2> /dev/null
  printf "\n"
  if [ "${minrssi}" != "-128" ]; then
    printf "MIN RSSI: ${minrssi}\n"
  fi
  if [ "${maxrssi}" != "128" ]; then
    printf "MAX RSSI: ${maxrssi}\n"
  fi
  printf "Thanks for tracking with blue_sonar.\n"
  exit 0
}

#parse args
while true; do
  case $1 in
    -h|--help)
      usage
      exit 0
      ;;
    -i|--interface)
      if [ -n "${2}" ]; then
        if hciconfig "${2}" > /dev/zero 2>&1; then
          radio="${2}"
          shift
        else
          printf "Error: unable to find interface ${2}\n"
        fi
      else
        printf "Error: ${1} requires a non-empty option argument\n"
        usage
        exit 1
      fi
      ;;
    -a|--audio)
      audio="1"
      ;;
    -v|--verbose)
      quiet="1"
      ;;
    -s|--sleep)
      if [ -n "${2}" ]; then
        if [[ ${2} =~ ${ISNUMBER} ]]; then
          sleep="${2}"
          shift
        else
          printf "Error: sleep argument expects a number, not ${2}\n"
          usage
          exit 1
        fi
      fi
      ;;
    -t|--target)
      if [ -n "${2}" ]; then
        if [[ ${2} =~ ${ISMAC} ]]; then
          target="${2}"
          shift
        else
          printf "Error: target argument expects a valid mac address, not ${2}\n"
          usage
          exit 1
        fi
      else
        printf "Error: ${1} requires a non-empty option argument\n"
      fi
      ;;
    --sim)
      sim="1"
      rssi="-70"
      ;;
    --)
      shift
      break
      ;;
    *)
      break
      ;;
  esac
  shift
done
if [ -z "${target}" ] && [ "${sim}" != "1" ]; then
  printf "target must be specified, please use -t or --target to specify one\n"
  usage
  exit 1
fi


trap control_c INT
trap control_c TERM

rc-service bluetooth status > /dev/null 2>&1 || rc-service bluetooth start > /dev/null 2>&1

while true; do
  if [ "${sim}" = "1" ]; then
    true
  elif [ -n "${l2pid}" ] && ps -p "${l2pid}" > /dev/null 2>&1; then
    true
  else
    if [ "${quiet}" = "1" ]; then
      l2ping -i "${radio}" -t 1 -d "${sleep}" "${target}" 2> /dev/null &
      l2pid=$!
    else
      l2ping -i "${radio}" -t 1 -d "${sleep}" "${target}" >/dev/null 2> /dev/null &
      l2pid=$!
    fi

    sleep 1
  fi
  if [ "${sim}" = "0" ] && ! rssi="$(hcitool -i "${radio}" rssi "${target}" 2> /dev/null | awk '{print $4}')"; then
    printf "Out of range or not connected\n"
    freq=100
    dur=1
    sleep ${sleep}
    continue
  elif [ -z "${rssi}" ]; then
    printf "Out of range or not connected\n"
    freq=100
    dur=1
    sleep ${sleep}
    continue
  else
    if [ "${sim}" = "1" ]; then
      rssi=$((rssi + 1))
      if [ "${rssi}" = "21" ]; then
        control_c
      fi
    fi
    #max seen rssi was 20, expected numbers are negative
    #color progress bar red for areas not seen
    bars=$((rssi + 65))
    if [ ${bars} -lt 0 ] || [ ${bars} = 0 ]; then
      printf -- "RSSI: ${rssi}  ${PROGRESS:0:1}${red}${PROGRESS:1}${end}\n"
    elif [ ${bars} -gt 69 ]; then
      if [ "${rssi}" -lt 10 ] && [ ${rssi} -gt -1 ]; then
        printf -- "RSSI:   ${rssi}  ${PROGRESS}\n"
      else
        printf -- "RSSI:  ${rssi}  ${PROGRESS}\n"
      fi
    else
      if [ ${rssi} -ge 10 ]; then
        printf -- "RSSI:  ${rssi}  ${PROGRESS:0:${bars}}${red}${PROGRESS:${bars}}${end}\n"
      elif [ ${rssi} -lt 10 ] && [ ${rssi} -gt -1 ]; then
        printf -- "RSSI:   ${rssi}  ${PROGRESS:0:${bars}}${red}${PROGRESS:${bars}}${end}\n"
      elif [ ${rssi} -lt 1 ] && [ ${rssi} -gt -10 ]; then
        printf -- "RSSI:  ${rssi}  ${PROGRESS:0:${bars}}${red}${PROGRESS:${bars}}${end}\n"
      else
        printf -- "RSSI: ${rssi}  ${PROGRESS:0:${bars}}${red}${PROGRESS:${bars}}${end}\n"
      fi
    fi
  fi
  if [ ${rssi} -lt ${minrssi} ]; then
    minrssi="${rssi}"
  fi
  if [ ${rssi} -gt ${maxrssi} ]; then
    maxrssi="${rssi}"
  fi
  if [ "${audio}" = "1" ]; then
    RSSIN=$((rssi*-1))
    freq=$(((65+rssi)/5*300))
    dur=.3
    spd=$((RSSIN+10))
    dur=.$spd
    play -n -c1 synth $dur sine $freq 2> /dev/null
    continue
  fi
  sleep "${sleep}"
done
