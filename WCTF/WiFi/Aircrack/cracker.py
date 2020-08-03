import os
import subprocess
import fnmatch
import time

ContinueIfFound = False


files = os.listdir(".")
SsidList = ['WCTF_WPA', 'WCTF_WEP', 'WCTF_00', 'WCTF_01', 'WCTF_02', 'WCTF_03', 'WCTF_04', 'WCTF_05', 'WCTF_06', 'WCTF_07', 'WCTF_08', 'WCTF_09', 'WCTF_10', 'WCTF_11', 'WCTF_12', 'WCTF_13', 'WCTF_14', 'WCTF_15', 'WCTF_16', 'WCTF_17', 'WCTF_18', 'WCTF_19', 'WCTF_20']


#SsidList = ['WCTF_09']

SsidFoundList = ['']*len(SsidList)

pattern1 = "*.pcap"
pattern2 = "*.cap"

SsidListIndex = 0

StartTime = time.time()

for SSID in SsidList:
  print SSID
  for CheckFile in files:
    LoopTime = time.time()
    if ((fnmatch.fnmatch(CheckFile, pattern1) or fnmatch.fnmatch(CheckFile, pattern2)) and ((SsidFoundList[SsidListIndex] == '') or ContinueIfFound)):
      print((SSID + '---' + CheckFile).ljust(40) + ' ' + str(os.path.getsize(CheckFile)/1e6) + 'M').ljust(60)    
      result = subprocess.check_output(['aircrack-ng', '-w', 'cyberpunk.words', '-e', SSID, CheckFile])
      if 'KEY FOUND' in result:
        Key = result.split('KEY FOUND')[1].split('[')[1].split(']')[0]
        if 'ASCII' in result:
          Key = Key + ' ASCII: ' + result.split('ASCII: ')[1].split(')')[0]
        print '**************************************************' + Key
        SsidFoundList[SsidListIndex] = SsidFoundList[SsidListIndex] + SSID + '---' + Key + '---' + CheckFile + ','
	f = open("keys.txt","a+")
        f.write(SsidFoundList[SsidListIndex]+'\n')
        f.clos11111e()
      elif (('(got ' in result) and (' IVs)' in result)):
        print ('Checking for 64 bit keys')
        result = subprocess.check_output(['aircrack-ng', '-w', 'cyberpunk.words', '-e', SSID, '-n', '64', CheckFile])
        if 'KEY FOUND' in result:
          Key = result.split('KEY FOUND')[1].split('[')[1].split(']')[0]
          if 'ASCII' in result:
            Key = Key + ' ASCII: ' + result.split('(ASCII: ')[1].split(')')[0]
          print '**************************************************' + Key
          SsidFoundList[SsidListIndex] = SsidFoundList[SsidListIndex] + SSID + '---' + Key + '---' + CheckFile + ','
	  f = open("keys.txt","a+")
          f.write(SsidFoundList[SsidListIndex]+'\n')
          f.close()
      print str(time.time() - LoopTime) + ' sec'
        
  SsidListIndex = SsidListIndex + 1

print '\n'.join(map(str,SsidFoundList))
        
print 'Total Time - ' + str(time.time() - StartTime) + ' seconds'

