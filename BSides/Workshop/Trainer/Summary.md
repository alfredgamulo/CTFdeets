BSides 2020 CTF Workshop
========================


Instructor
	Wesley Thurner 
	@NOPResearcher
	nopresearcher@gmail.com
	pwneip@gmail.com


Why CTFs?
	Fun
	Learn
	Competition
	Meet People
	
	Practice w/ "Hack the Box" 
	Many people do it to practice to get OSCP

	Forces you to learn, get out of comfort zone


CTF Styles
	Jeopardy
	Attack and Defense
	King of the Hills
	CTFd


Types of Challenges
	Crypto
	Forensic
	Computer Exploitation
	Reverse Engineering
	Trivia/Puzzle
	Web
	Programming
	Misc


Technical Skills
	Windows/Linux
	Networking
	Infrastructure
	Scripting


Technical Vignettes
	IOT CTF by Independent Security Evaluators
		Developed tools, cross compiled binaries, learned about IOT
		Use those skills on assessments to pivot into internal networks
	MalwareRE
		Rudimentary RE skills gained through various CTFs
		Used on assessments to examine unknown binaries


Non-Technical Skills
	Creativity
	Persistence & Resiliency
	Note Taking
	Preparation & Practice
	Attention to Detail


Non-Technical Vignettes
	Geocaching/Escape rooms
		Common techniques, recognizing patterns
		Scratch near a puzzle, timestamp of binaries
	Note taking is critical!
		Terminal screens
		Web requests
		Network traffic
		Proxy logs


Post CTF
	Writeups & walk-throughs
	Tooling
	Testing
	Analysis & self-improvement



Play:
	https://trainer-ctf.threatsims.com/challenges#Level%2001

Trainer
	Level 01

```
C:\home\slicer\Documents> ssh level0@trainer.threatsims.com
The authenticity of host 'trainer.threatsims.com (167.71.187.239)' can't be established.
ECDSA key fingerprint is SHA256:ZODPF0IyXK6JShqdwNxTiOZeuNfS2f7qh6N7cnMXKjA.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'trainer.threatsims.com,167.71.187.239' (ECDSA) to the list of known hosts.
level0@trainer.threatsims.com's password: 
Linux trainer 4.19.0-6-cloud-amd64 #1 SMP Debian 4.19.67-2+deb10u1 (2019-09-20) x86_64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Fri Mar  6 15:15:03 2020 from 196.52.2.82

    ====================================================================
    ||                                                                ||
    ||     .--.          Welcom to the Linux Trainer!                 ||
    ||    | o_o|                                                      ||
    ||    | ==>|          To view the level instructions again        ||
    ||   / /   \ \         type: cat welcome_message                  ||
    ||  ( |     | )                                                   ||
    || /' |_____/'\       Getting Stuck? Need help with a level?      ||
    || \___)--(___/         type:  cat helpme                         ||
    ||                                                                ||
    ||                    Use "su - level#"  to change levels         ||
    ||                                                                ||
    ||                    feedback: nopresearcher@gmail.com           ||
    ||                                                                ||
    ||                                                                ||
    ====================================================================
    
Welcome to Level 0

The password for the next level is in this user's home directory
level0@trainer:~$ 

```
## The password will be the login to level1
Actions:
```
level0@trainer:~$ cat welcome_message 
Welcome to Level 0

The password for the next level is in this user's home directory
level0@trainer:~$ ls
helpme  level1_password  su  welcome_message
level0@trainer:~$ cat level1_password 
4202c26842398c1d0772ed9eed195113

level0@trainer:~$ cat level1_password | su - level1
Password: 
    ====================================================================
    ||                                                                ||
    ||     .--.          Welcom to the Linux Trainer!                 ||
    ||    | o_o|                                                      ||
    ||    | ==>|          To view the level instructions again        ||
    ||   / /   \ \         type: cat welcome_message                  ||
    ||  ( |     | )                                                   ||
    || /' |_____/'\       Getting Stuck? Need help with a level?      ||
    || \___)--(___/         type:  cat helpme                         ||
    ||                                                                ||
    ||                    Use "su - level#"  to change levels         ||
    ||                                                                ||
    ||                    feedback: nopresearcher@gmail.com           ||
    ||                                                                ||
    ||                                                                ||
    ====================================================================
    
Welcome to Level 1

The password for the next level is in this user's home directory, but you may have to dig a bit.

```


Level 2
```
C:\home\slicer> ssh level1@trainer.threatsims.com
level1@trainer.threatsims.com's password: 
Linux trainer 4.19.0-6-cloud-amd64 #1 SMP Debian 4.19.67-2+deb10u1 (2019-09-20) x86_64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Fri Mar  6 15:28:24 2020 from 192.5.215.209

    ====================================================================
    ||                                                                ||
    ||     .--.          Welcom to the Linux Trainer!                 ||
    ||    | o_o|                                                      ||
    ||    | ==>|          To view the level instructions again        ||                                           
    ||   / /   \ \         type: cat welcome_message                  ||                                           
    ||  ( |     | )                                                   ||                                           
    || /' |_____/'\       Getting Stuck? Need help with a level?      ||                                           
    || \___)--(___/         type:  cat helpme                         ||                                           
    ||                                                                ||                                           
    ||                    Use "su - level#"  to change levels         ||                                           
    ||                                                                ||                                           
    ||                    feedback: nopresearcher@gmail.com           ||                                           
    ||                                                                ||                                           
    ||                                                                ||                                           
    ====================================================================                                           
                                                                                                                   
Welcome to Level 1                                                                                                 
                                                                                                                   
The password for the next level is in this user's home directory, but you may have to dig a bit.                   
level1@trainer:~$ cat some_directory/level2_password                                                               
943430e07fd566bc96aa05fca3c96e48 

level1@trainer:~$ su - level2
Password: 

    ====================================================================
    ||                                                                ||
    ||     .--.          Welcom to the Linux Trainer!                 ||
    ||    | o_o|                                                      ||
    ||    | ==>|          To view the level instructions again        ||
    ||   / /   \ \         type: cat welcome_message                  ||
    ||  ( |     | )                                                   ||
    || /' |_____/'\       Getting Stuck? Need help with a level?      ||
    || \___)--(___/         type:  cat helpme                         ||
    ||                                                                ||
    ||                    Use "su - level#"  to change levels         ||
    ||                                                                ||
    ||                    feedback: nopresearcher@gmail.com           ||
    ||                                                                ||
    ||                                                                ||
    ====================================================================
    
Welcome to Level 2

The password for the next level is in this user's home directory, but you have to dig even deeper.
level2@trainer:~$ ls -alh dir/                                                                                     
total 12K                                                                                                          
drwx------ 3 level2 level2 4.0K Nov 29 18:07 .                                                                     
drwxr-x--- 4 level2 level2 4.0K Mar  6 15:15 ..                                                                    
drwx------ 3 level2 level2 4.0K Nov 29 18:07 another_dir                                                           
level2@trainer:~$ cat dir/another_dir/another_another_dir/some_directory/level3_password                           
2cadca6148093c403d82396252b8c4db  
```

```
level2@trainer:~$ su - level3                                                                                      
Password:                                                                                                          
                                                                                                                   
    ====================================================================
    ||                                                                ||
    ||     .--.          Welcom to the Linux Trainer!                 ||
    ||    | o_o|                                                      ||
    ||    | ==>|          To view the level instructions again        ||
    ||   / /   \ \         type: cat welcome_message                  ||
    ||  ( |     | )                                                   ||
    || /' |_____/'\       Getting Stuck? Need help with a level?      ||
    || \___)--(___/         type:  cat helpme                         ||
    ||                                                                ||
    ||                    Use "su - level#"  to change levels         ||
    ||                                                                ||
    ||                    feedback: nopresearcher@gmail.com           ||
    ||                                                                ||
    ||                                                                ||
    ====================================================================
    
Welcome to Level 3

The password for the next level is in this user's home directory, but you might not see it at first.

type: man ls    read about files that start with a dot (.)
level3@trainer:~$ ls -alh
total 36K
drwxr-x---  3 level3 level3 4.0K Mar  6 15:16 .
drwxr-xr-x 26 root   root   4.0K Mar  5 10:06 ..
-rw-r--r--  1 level3 level3  220 Apr 18  2019 .bash_logout
-rw-r--r--  1 level3 level3 3.5K Apr 18  2019 .bashrc
drwx------  3 level3 level3 4.0K Mar  6 15:16 .gnupg
-r--r-----  1 level3 level3  353 Jan 11 11:18 helpme
-rw-r-----  1 level4 level3   34 Nov 29 18:07 .level4_password
-rw-r--r--  1 level3 level3  807 Apr 18  2019 .profile
-r--r-----  1 level3 level3  181 Mar  2 10:18 welcome_message
level3@trainer:~$ cat .level4_password 
72f6af6b0005adb15fbc91e1b140115f

```

```
level3@trainer:~$ su - level4
Password: 

    ====================================================================
    ||                                                                ||
    ||     .--.          Welcom to the Linux Trainer!                 ||
    ||    | o_o|                                                      ||
    ||    | ==>|          To view the level instructions again        ||
    ||   / /   \ \         type: cat welcome_message                  ||
    ||  ( |     | )                                                   ||
    || /' |_____/'\       Getting Stuck? Need help with a level?      ||
    || \___)--(___/         type:  cat helpme                         ||
    ||                                                                ||
    ||                    Use "su - level#"  to change levels         ||
    ||                                                                ||
    ||                    feedback: nopresearcher@gmail.com           ||
    ||                                                                ||
    ||                                                                ||
    ====================================================================
    
Welcome to Level 4

The password for the next level is in this user's home directory, just like the last levels you might have to dig.

type: man ls    read about files and folders that start with a dot (.)
level4@trainer:~$ 
level4@trainer:~$ ls -alh
total 36K
drwxr-x---  4 level4 level4 4.0K Mar  6 15:17 .
drwxr-xr-x 26 root   root   4.0K Mar  5 10:06 ..
-rw-r--r--  1 level4 level4  220 Apr 18  2019 .bash_logout
-rw-r--r--  1 level4 level4 3.5K Apr 18  2019 .bashrc
drwx------  3 level4 level4 4.0K Mar  6 15:17 .gnupg
-r--r-----  1 level4 level4  436 Jan 11 11:18 helpme
drwx------  2 level4 level4 4.0K Nov 29 18:07 .hidden_dir
-rw-r--r--  1 level4 level4  807 Apr 18  2019 .profile
-r--r-----  1 level4 level4  207 Mar  2 10:19 welcome_message
level4@trainer:~$ cat .hidden_dir/.level5_password 
7b6c2552940f47a27fbd729ae0e2893c
```

```
C:\home\slicer> ssh level5@trainer.threatsims.com
level5@trainer.threatsims.com's password: 
Linux trainer 4.19.0-6-cloud-amd64 #1 SMP Debian 4.19.67-2+deb10u1 (2019-09-20) x86_64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Fri Mar  6 15:35:00 2020 from 192.5.215.212

    ====================================================================
    ||                                                                ||
    ||     .--.          Welcom to the Linux Trainer!                 ||
    ||    | o_o|                                                      ||
    ||    | ==>|          To view the level instructions again        ||
    ||   / /   \ \         type: cat welcome_message                  ||
    ||  ( |     | )                                                   ||                                           
    || /' |_____/'\       Getting Stuck? Need help with a level?      ||                                           
    || \___)--(___/         type:  cat helpme                         ||                                           
    ||                                                                ||                                           
    ||                    Use "su - level#"  to change levels         ||                                           
    ||                                                                ||                                           
    ||                    feedback: nopresearcher@gmail.com           ||                                           
    ||                                                                ||                                           
    ||                                                                ||                                           
    ====================================================================                                           
                                                                                                                   
Welcome to Level 5                                                                                                 
                                                                                                                   
For this level the password is in level6's home directory.  Due to a persmissions error, the level5 user can access it.  Think about the directories you have already seen and what file name patterns.                               
level5@trainer:~$ ls -alh /home
total 104K                                                                                                         
drwxr-xr-x 26 root    root    4.0K Mar  5 10:06 .                                                                  
drwxr-xr-x 18 root    root    4.0K Feb 29 13:13 ..                                                                 
drwxr-x---  3 level0  level0  4.0K Mar  6 15:30 level0
drwxr-x---  4 level1  level1  4.0K Mar  6 15:26 level1
drwxr-x---  2 level10 level10 4.0K Mar  2 10:20 level10
drwxr-x---  2 level11 level11 4.0K Mar  2 10:20 level11
drwxr-x---  2 level12 level12 4.0K Mar  2 10:20 level12
drwxr-x---  2 level13 level13 4.0K Mar  2 10:20 level13
drwxr-x---  2 level14 level14 4.0K Mar  2 10:20 level14
drwxr-x---  2 level15 level15 4.0K Mar  2 10:21 level15
drwxr-x---  2 level16 level16 4.0K Mar  2 10:25 level16
drwxr-x---  2 level17 level17 4.0K Mar  3 10:21 level17
drwxr-x---  2 level18 level18 4.0K Mar  5 10:09 level18
drwxr-x---  3 level19 level19 4.0K Mar  4 01:09 level19
drwxr-x---  4 level2  level2  4.0K Mar  6 15:15 level2
drwxr-x---  3 level20 level20 4.0K Mar  4 22:39 level20
drwxr-x---  2 level21 level21 4.0K Mar  5 10:10 level21
drwxr-xr-x  2 level22 level22 4.0K Mar  5 10:06 level22
drwxr-x---  3 level3  level3  4.0K Mar  6 15:16 level3
drwxr-x---  4 level4  level4  4.0K Mar  6 15:17 level4
drwxr-x---  5 level5  level5  4.0K Mar  6 15:29 level5
drwxrw-rw- 53 level6  level5  4.0K Mar  2 10:19 level6
drwxr-x---  3 level7  level7  4.0K Mar  2 10:19 level7
drwxr-x--- 54 level8  level8  4.0K Mar  6 15:35 level8
drwxr-x---  2 level9  level9  4.0K Mar  2 10:20 level9
drwxr-x---  2 trainer trainer 4.0K Nov 29 18:07 trainer

ls -la /home/level6
level5@trainer:/home$ cat /home/level6/level6_password
7cb1963d316b9a302cf6c204d35b7302

```

```
C:\home\slicer> ssh level6@trainer.threatsims.com
level6@trainer.threatsims.com's password: 

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Fri Mar  6 15:55:41 2020 from 129.174.182.91

    ====================================================================
    ||                                                                ||
    ||     .--.          Welcom to the Linux Trainer!                 ||
    ||    | o_o|                                                      ||
    ||    | ==>|          To view the level instructions again        ||
    ||   / /   \ \         type: cat welcome_message                  ||
    ||  ( |     | )                                                   ||
    || /' |_____/'\       Getting Stuck? Need help with a level?      ||
    || \___)--(___/         type:  cat helpme                         ||
    ||                                                                ||
    ||                    Use "su - level#"  to change levels         ||
    ||                                                                ||
    ||                    feedback: nopresearcher@gmail.com           ||
    ||                                                                ||
    ||                                                                ||
    ====================================================================
    
Welcome to Level 6

The password for the next level is in this user's home directory, however this time there are too many directories to manually dig through.  For this level you will need the find command and search for a file that has pass in the title.

type: man find    read searching for filenames

level6@trainer:~$ find . -name level7_password                                                                     
./dir13/subdir40/level7_password                                                                                   
level6@trainer:~$ cat ./dir13/subdir40/level7_password                                                             
The password for level7 is:                                                                                        
                                                                                                                   
RG8geW91IGV2ZW4gbGlmdCBicm8g  


```

```
Linux trainer 4.19.0-6-cloud-amd64 #1 SMP Debian 4.19.67-2+deb10u1 (2019-09-20) x86_64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Fri Mar  6 16:05:44 2020 from 192.5.215.213

    ====================================================================
    ||                                                                ||
    ||     .--.          Welcom to the Linux Trainer!                 ||
    ||    | o_o|                                                      ||
    ||    | ==>|          To view the level instructions again        ||
    ||   / /   \ \         type: cat welcome_message                  ||
    ||  ( |     | )                                                   ||
    || /' |_____/'\       Getting Stuck? Need help with a level?      ||
    || \___)--(___/         type:  cat helpme                         ||
    ||                                                                ||
    ||                    Use "su - level#"  to change levels         ||
    ||                                                                ||
    ||                    feedback: nopresearcher@gmail.com           ||
    ||                                                                ||
    ||                                                                ||
    ====================================================================
    
Welcome to Level 7


The password for the next level is in the password_directory.  For this level though, all files are exactly the same size.  You should look through each file to find the one that contains the password.

Hint: look for password

type: man find
      man grep
      man xargs

The password for level8 is:

bGV0J3MgZmluZCBzb21ldGhpbmcg


```

```
level7@trainer:~$ su - level8
Password: 



    ====================================================================
    ||                                                                ||
    ||     .--.          Welcom to the Linux Trainer!                 ||
    ||    | o_o|                                                      ||
    ||    | ==>|          To view the level instructions again        ||
    ||   / /   \ \         type: cat welcome_message                  ||
    ||  ( |     | )                                                   ||
    || /' |_____/'\       Getting Stuck? Need help with a level?      ||
    || \___)--(___/         type:  cat helpme                         ||
    ||                                                                ||
    ||                    Use "su - level#"  to change levels         ||
    ||                                                                ||
    ||                    feedback: nopresearcher@gmail.com           ||
    ||                                                                ||
    ||                                                                ||
    ====================================================================
    
Welcome to Level 8

For this level the password is in an executable hidden in one of these sub-directories.  When you run the executable it will print out the flag.  To run the executable type: ./executable

type: man find

After finding and executing the binary, you should try to run the command strings on the it and review the output.  type: strings <executable>

level8@trainer:~$ find . -type f
./helpme
./.bash_logout
./.viminfo
./welcome_message
./.bashrc
./?P?@h9@8
./.profile
./dir24/subdir13/level9_password
./.lesshst

level8@trainer:~$ strings ./dir24/subdir13/level9_password 
/lib64/ld-linux-x86-64.so.2
libc.so.6
puts
__cxa_finalize
__libc_start_main
GLIBC_2.2.5
_ITM_deregisterTMCloneTable
__gmon_start__
_ITM_registerTMCloneTable
u/UH
[]A\A]A^A_
The password is: 96ab15e954f1267ea04c35de2d771c2b
;*3$"
GCC: (Debian 9.2.1-19) 9.2.1 20191109
crtstuff.c
deregister_tm_clones
__do_global_dtors_aux
completed.7447
__do_global_dtors_aux_fini_array_entry
frame_dummy
__frame_dummy_init_array_entry
cat_flag.c
__FRAME_END__
__init_array_end
_DYNAMIC
__init_array_start
__GNU_EH_FRAME_HDR
_GLOBAL_OFFSET_TABLE_
__libc_csu_fini
_ITM_deregisterTMCloneTable
puts@@GLIBC_2.2.5
_edata
__libc_start_main@@GLIBC_2.2.5
__data_start
__gmon_start__
__dso_handle
_IO_stdin_used
__libc_csu_init
__bss_start
main
__TMC_END__
_ITM_registerTMCloneTable
__cxa_finalize@@GLIBC_2.2.5
.symtab
.strtab
.shstrtab
.interp
.note.gnu.build-id
.note.ABI-tag
.gnu.hash
.dynsym
.dynstr
.gnu.version
.gnu.version_r
.rela.dyn
.rela.plt
.init
.plt.got
.text
.fini
.rodata
.eh_frame_hdr
.eh_frame
.init_array
.fini_array
.dynamic
.got.plt
.data
.bss
.comment
level8@trainer:~$ 

```

```
level8@trainer:~$ su - level9
Password: 

    ====================================================================
    ||                                                                ||
    ||     .--.          Welcom to the Linux Trainer!                 ||
    ||    | o_o|                                                      ||
    ||    | ==>|          To view the level instructions again        ||
    ||   / /   \ \         type: cat welcome_message                  ||
    ||  ( |     | )                                                   ||
    || /' |_____/'\       Getting Stuck? Need help with a level?      ||
    || \___)--(___/         type:  cat helpme                         ||
    ||                                                                ||
    ||                    Use "su - level#"  to change levels         ||
    ||                                                                ||
    ||                    feedback: nopresearcher@gmail.com           ||
    ||                                                                ||
    ||                                                                ||
    ====================================================================
    
Welcome to Level 9

First a bit of history.  RockYou was a social media site that suffered a security breach in 2009, losing 32 million passwords.  They were storing all the user credentials in plain text in their database.  At the time this was the largest breach of passwords and allowed for academic research and password analysis with real data.  These passwords were eventually organized into a password list that is commonly used for cracking passwords.  

For this level we want to find the line number in the rock you wordlist where the password "evilhacker" is found.  That line number is the password for level 10.  The wordlist can be found at /usr/share/wordlists/rockyou.txt (it's in the same place on kali too) Grep uses a 1-based numbering system meaning the first line is 1 and not 0.

type: man grep

level9@ubuntu-s-1vcpu-1gb-nyc1-01:~$ grep -Rsni evilhacker /usr/share/wordlists/rockyou.txt 
955830:evilhacker


```


```
level9@ubuntu-s-1vcpu-1gb-nyc1-01:~$ su - level10
Password: 

    ====================================================================
    ||                                                                ||
    ||     .--.          Welcom to the Linux Trainer!                 ||
    ||    | o_o|                                                      ||
    ||    | ==>|          To view the level instructions again        ||
    ||   / /   \ \         type: cat welcome_message                  ||
    ||  ( |     | )                                                   ||
    || /' |_____/'\       Getting Stuck? Need help with a level?      ||
    || \___)--(___/         type:  cat helpme                         ||
    ||                                                                ||
    ||                    Use "su - level#"  to change levels         ||
    ||                                                                ||
    ||                    feedback: nopresearcher@gmail.com           ||
    ||                                                                ||
    ||                                                                ||
    ====================================================================
    
Welcome to Level 10

For this level you are given a log file from the program fail2ban.  Fail2ban is used monitor log files for suspicious activity like too many failed logins.  It is commonly deployed for use with Apache or SSH.  After a configured number of attempts it will create an iptables (linux firewall) rule to block the ip from communicating with the device for a period of time.

The log file is located in your home directory and is called fail2ban.log.  The password to level 11 is the number of times 112.85.42.94 was banned.

type: man grep
      man wc
      level10@ubuntu-s-1vcpu-1gb-nyc1-01:~$ 
level10@ubuntu-s-1vcpu-1gb-nyc1-01:~$ grep -Rsni "] Ban 112.85.42.94" fail2ban.log | wc -l
192

```

```
level10@ubuntu-s-1vcpu-1gb-nyc1-01:~$ su - level11
Password: 

    ====================================================================
    ||                                                                ||
    ||     .--.          Welcom to the Linux Trainer!                 ||
    ||    | o_o|                                                      ||
    ||    | ==>|          To view the level instructions again        ||
    ||   / /   \ \         type: cat welcome_message                  ||
    ||  ( |     | )                                                   ||
    || /' |_____/'\       Getting Stuck? Need help with a level?      ||
    || \___)--(___/         type:  cat helpme                         ||
    ||                                                                ||
    ||                    Use "su - level#"  to change levels         ||
    ||                                                                ||
    ||                    feedback: nopresearcher@gmail.com           ||
    ||                                                                ||
    ||                                                                ||
    ====================================================================
    
Welcome to Level 11

For this level you are given a file that contains the password to the next level.  The password is a md5 hash.  Research md5 hashes and find it in the file.

type: man grep
      man md5sum
      google md5 hash

For this level we are going to use grep to search through the file md5find.   This file is 1983 lines long (wc -l md5find).  You can use less (less md5find) to look through file and that there are too many lines to visually pick out a md5hash.  An md5 hash is typically expressed as a 32 digit hexadecimal number.  So we are trying to something that is 32 digits long and hexadecimal.  Hexadecimal is 0-9 and a-f.  For grep we need to build a regular expression that will match this.

[0-9a-f] ensures the character will only match hexadecimal (values of 0-9 and a-f)
{32} will use the above match 32 times, the length of a md5 hash.  The \ are used to escape the { and }

Commands:
grep -e "[0-9a-f]\{32\}" md5find

level11@ubuntu-s-1vcpu-1gb-nyc1-01:~$ grep -e "[0-9a-f]\{32\}" md5find
0982e2a869857644074d06b1a4fd1bea


```

```
level11@ubuntu-s-1vcpu-1gb-nyc1-01:~$ su - level12
Password: 

    ====================================================================
    ||                                                                ||
    ||     .--.          Welcom to the Linux Trainer!                 ||
    ||    | o_o|                                                      ||
    ||    | ==>|          To view the level instructions again        ||
    ||   / /   \ \         type: cat welcome_message                  ||
    ||  ( |     | )                                                   ||
    || /' |_____/'\       Getting Stuck? Need help with a level?      ||
    || \___)--(___/         type:  cat helpme                         ||
    ||                                                                ||
    ||                    Use "su - level#"  to change levels         ||
    ||                                                                ||
    ||                    feedback: nopresearcher@gmail.com           ||
    ||                                                                ||
    ||                                                                ||
    ====================================================================
    
Welcome to Level 12

For this level you are going to find SUID and SGID binaries in common locations.  This is a common privilege escalation technique seen in CTFs and real world.  Remember the user you are looking to escalate privileges to is level13. 

type: man find
      google SUID
      google SGID

      level12@ubuntu-s-1vcpu-1gb-nyc1-01:~$ 

level12@ubuntu-s-1vcpu-1gb-nyc1-01:~$ find / -perm -u=s -type f 2>/dev/null
/bin/fusermount
/bin/mount
/bin/umount
/bin/ping
/bin/su
/usr/lib/policykit-1/polkit-agent-helper-1
/usr/lib/x86_64-linux-gnu/lxc/lxc-user-nic
/usr/lib/snapd/snap-confine
/usr/lib/eject/dmcrypt-get-device
/usr/lib/dbus-1.0/dbus-daemon-launch-helper
/usr/lib/openssh/ssh-keysign
/usr/bin/gpasswd
/usr/bin/newgrp
/usr/bin/chfn
/usr/bin/at
/usr/bin/newgidmap
/usr/bin/newuidmap
/usr/bin/traceroute6.iputils
/usr/bin/sudo
/usr/bin/chsh
/usr/bin/pkexec
/usr/sbin/mysecret
level12@ubuntu-s-1vcpu-1gb-nyc1-01:~$ find / -perm -g=s -type f 2>/dev/null
/sbin/unix_chkpwd
/sbin/pam_extrausers_chkpwd
/usr/lib/x86_64-linux-gnu/utempter/utempter
/usr/lib/snapd/snap-confine
/usr/bin/bsd-write
/usr/bin/ssh-agent
/usr/bin/at
/usr/bin/mlocate
/usr/bin/crontab
/usr/bin/wall
/usr/bin/chage
/usr/bin/expiry
/usr/sbin/mysecret

```

```
mysecret                                   mysecret-f4736e1eb28b1d9055c5f5d58a49b5a6
level12@ubuntu-s-1vcpu-1gb-nyc1-01:~$ ls /usr/sbin/mysecret^C
level12@ubuntu-s-1vcpu-1gb-nyc1-01:~$ su - level13
Password: 

    ====================================================================
    ||                                                                ||
    ||     .--.          Welcom to the Linux Trainer!                 ||
    ||    | o_o|                                                      ||
    ||    | ==>|          To view the level instructions again        ||
    ||   / /   \ \         type: cat welcome_message                  ||
    ||  ( |     | )                                                   ||
    || /' |_____/'\       Getting Stuck? Need help with a level?      ||
    || \___)--(___/         type:  cat helpme                         ||
    ||                                                                ||
    ||                    Use "su - level#"  to change levels         ||
    ||                                                                ||
    ||                    feedback: nopresearcher@gmail.com           ||
    ||                                                                ||
    ||                                                                ||
    ====================================================================
    
Welcome to Level 13

For this level you are going to familiarize yourself with environment variables.  They are used for a wide variety of applications.  Specifically, they can be used for docker and cloud providers to store credentials.  They password to level 14 is is the one that ends with ID.

type: man environ
      google environment variables

level13@ubuntu-s-1vcpu-1gb-nyc1-01:~$ env | grep ID
AWS_ACCESS_KEY_ID=0ea027e3835aa87a4a47465321c5fe75

```

```
level13@ubuntu-s-1vcpu-1gb-nyc1-01:~$ su - level14
Password: 

    ====================================================================
    ||                                                                ||
    ||     .--.          Welcom to the Linux Trainer!                 ||
    ||    | o_o|                                                      ||
    ||    | ==>|          To view the level instructions again        ||
    ||   / /   \ \         type: cat welcome_message                  ||
    ||  ( |     | )                                                   ||
    || /' |_____/'\       Getting Stuck? Need help with a level?      ||
    || \___)--(___/         type:  cat helpme                         ||
    ||                                                                ||
    ||                    Use "su - level#"  to change levels         ||
    ||                                                                ||
    ||                    feedback: nopresearcher@gmail.com           ||
    ||                                                                ||
    ||                                                                ||
    ====================================================================
    
Welcome to Level 14

For this level you are going to familiarize yourself with the kernel version.  We are just looking for the Kernel and Major version (the first two sets of numbers) example: if the version is 2.62.26.1 the password will be 2.62

Understanding Kernel versions can help when search for exploits with tools like searchsploit or exploitdb (Sorry, there isn't any kernel exploits for this box, I hope)

type: man uname
      google linux kernel


      level14@ubuntu-s-1vcpu-1gb-nyc1-01:~$ 
      level14@trainer:~$ uname -a
Linux trainer 4.19.0-6-cloud-amd64 #1 SMP Debian 4.19.67-2+deb10u1 (2019-09-20) x86_64 GNU/Linux


```


```
Welcome to Level 15

For this level you are going to familiarize yourself with the distro version.  We are just looking for the distro name.  example: Fedora 31, then the password would be Fedora

Understanding distro versions can help when searching for exploits with tools like searchsploit or exploitdb (Sorry, there isn't any exploits for this distro, I hope)

type: man hostnamectl
      man lsb_release
      google linux distro

###i kind of just knew it was DEBIAN
```


```
level15@ubuntu-s-1vcpu-1gb-nyc1-01:~$ su - level16
Password: 

    ====================================================================
    ||                                                                ||
    ||     .--.          Welcom to the Linux Trainer!                 ||
    ||    | o_o|                                                      ||
    ||    | ==>|          To view the level instructions again        ||
    ||   / /   \ \         type: cat welcome_message                  ||
    ||  ( |     | )                                                   ||
    || /' |_____/'\       Getting Stuck? Need help with a level?      ||
    || \___)--(___/         type:  cat helpme                         ||
    ||                                                                ||
    ||                    Use "su - level#"  to change levels         ||
    ||                                                                ||
    ||                    feedback: nopresearcher@gmail.com           ||
    ||                                                                ||
    ||                                                                ||
    ====================================================================
    
Welcome to Level 16

For this level you are going to familiarize yourself with the aliases.  They can be very useful and can be used for a variety of actions to speed up your workflow.  They can also be very dangerous.

type: google alias



      level16@ubuntu-s-1vcpu-1gb-nyc1-01:~$ 
alias devbox='sshpass -p 6b39034a8045ed996a436f8d09031522 ssh level17@trainer.threatsims.com'

```


```
level16@ubuntu-s-1vcpu-1gb-nyc1-01:~$ su - level17
Password: 

    ====================================================================
    ||                                                                ||
    ||     .--.          Welcom to the Linux Trainer!                 ||
    ||    | o_o|                                                      ||
    ||    | ==>|          To view the level instructions again        ||
    ||   / /   \ \         type: cat welcome_message                  ||
    ||  ( |     | )                                                   ||
    || /' |_____/'\       Getting Stuck? Need help with a level?      ||
    || \___)--(___/         type:  cat helpme                         ||
    ||                                                                ||
    ||                    Use "su - level#"  to change levels         ||
    ||                                                                ||
    ||                    feedback: nopresearcher@gmail.com           ||
    ||                                                                ||
    ||                                                                ||
    ====================================================================
    
Welcome to Level 17

For this level you are going to familiarize yourself with user artifacts.  Look in this user's home directory to see if there are any files left behind that may contain useful information.

type: man vim


evel17@ubuntu-s-1vcpu-1gb-nyc1-01:~$ cat .viminfo 
# This viminfo file was generated by Vim 8.1.
# You may edit it if you're careful!

# Viminfo version
|1,4

# Value of 'encoding' when this file was written
*encoding=utf-8


# hlsearch on (H) or off (h):
~h
# Command Line History (newest to oldest):
:wq
|2,0,1583196421,,"wq"

# Search String History (newest to oldest):

# Expression History (newest to oldest):

# Input Line History (newest to oldest):

# Debug Line History (newest to oldest):

# Registers:
"a      LINE    0
        ssh level18@localhost
|3,0,10,1,1,0,1583196413,"ssh level18@localhost"
""b     LINE    0
        9a42b1822710d790a393800f2896a8f7
|3,1,11,1,1,0,1583196418,"9a42b1822710d790a393800f2896a8f7"

# File marks:
'0  11  0  ~/password
|4,48,11,0,1583196421,"~/password"
'1  12  0  ~/password
|4,49,12,0,1583196243,"~/password"
'2  11  0  ~/password
|4,50,11,0,1583196243,"~/password"

# Jumplist (newest first):
-'  11  0  ~/password
|4,39,11,0,1583196421,"~/password"
-'  12  0  ~/password
|4,39,12,0,1583196368,"~/password"
-'  11  0  ~/password
|4,39,11,0,1583196243,"~/password"
-'  8  0  ~/password
|4,39,8,0,1583196224,"~/password"


# History of marks within files (newest to oldest):

> ~/password
        *       1583196420      0
        "       11      0
        ^       6       1
        .       6       1
        +       6       0
        +       3       7
        +       1       3
        +       11      0
        +       10      0
        +       9       0
        +       8       0
        +       12      0
        +       6       1
        a       1       0
        b       2       0
        c       3       0
        d       4       0

```



```
level17@ubuntu-s-1vcpu-1gb-nyc1-01:~$ su - level18
Password: 

    ====================================================================
    ||                                                                ||
    ||     .--.          Welcom to the Linux Trainer!                 ||
    ||    | o_o|                                                      ||
    ||    | ==>|          To view the level instructions again        ||
    ||   / /   \ \         type: cat welcome_message                  ||
    ||  ( |     | )                                                   ||
    || /' |_____/'\       Getting Stuck? Need help with a level?      ||
    || \___)--(___/         type:  cat helpme                         ||
    ||                                                                ||
    ||                    Use "su - level#"  to change levels         ||
    ||                                                                ||
    ||                    feedback: nopresearcher@gmail.com           ||
    ||                                                                ||
    ||                                                                ||
    ====================================================================
    
Welcome to Level 18

For this level you are going to continue familiarizing yourself with user artifacts.  Look in this user's home directory to see if there are any files left behind that may contain useful information.

type: man bash

level18@ubuntu-s-1vcpu-1gb-nyc1-01:~$ cat .bash_history

whoami
uanme -a
w
id
ps -ef
netstat -an
cat /proc/version
cat /etc/*-release
pwd
ls -la
cat /etc/profile
cat ~/.bashrc
awk -F ":" '!/nologin/{print $1}' /etc/passwd
find / -perm -g=s -type f 2>/dev/null 
ssh level19@localhost
b06a246b0646b337f319316b9232151c
whoami
ssh level19@127.0.0.1
pwd

```

```
Password: 

    ====================================================================
    ||                                                                ||
    ||     .--.          Welcom to the Linux Trainer!                 ||
    ||    | o_o|                                                      ||
    ||    | ==>|          To view the level instructions again        ||
    ||   / /   \ \         type: cat welcome_message                  ||
    ||  ( |     | )                                                   ||
    || /' |_____/'\       Getting Stuck? Need help with a level?      ||
    || \___)--(___/         type:  cat helpme                         ||
    ||                                                                ||
    ||                    Use "su - level#"  to change levels         ||
    ||                                                                ||
    ||                    feedback: nopresearcher@gmail.com           ||
    ||                                                                ||
    ||                                                                ||
    ====================================================================
    
Welcome to Level 19

For this level you are going to continue familiarizing yourself with user artifacts.  Look in this user's home directory to see if there are any files left behind that may contain useful information.

type: man ssh

```

cat level20_passwordlevel19@ubuntu-s-1vcpu-1gb-nyc1-01:~$ ^C
level19@ubuntu-s-1vcpu-1gb-nyc1-01:~$ logout
Connection to 165.227.195.68 closed.
C:\home\slicer\Downloads> scp level19@167.71.187.239:~/.ssh/level20_id_rsa .
^CC:\home\slicer\Downloads>sh -i key level20@165.227.195.68^C
C:\home\slicer\Downloads> scp level19@165.227.195.68:~/.ssh/level20_id_rsa .
level19@165.227.195.68's password: 
level20_id_rsa                                                                   100% 1811   175.9KB/s   00:00    
C:\home\slicer\Downloads> ls
capture.pcap  dumppic  dumpzip_hash  key             NotADragon.png  pdfhash          ps.txt
challenge     dumpzip  fail2ban.log  level20_id_rsa  pcap1.pcapng    pdfpassword.pdf  rabbithole.gz
C:\home\slicer\Downloads> ssh -i level20_id_rsa level20@165.227.195.68
Welcome to Ubuntu 18.04.4 LTS (GNU/Linux 4.15.0-88-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Fri Mar  6 20:40:20 UTC 2020

  System load:  0.21               Processes:           172
  Usage of /:   12.4% of 24.06GB   Users logged in:     6
  Memory usage: 48%                IP address for eth0: 165.227.195.68
  Swap usage:   0%

0 packages can be updated.
0 updates are security updates.



The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.


    ====================================================================
    ||                                                                ||
    ||     .--.          Welcom to the Linux Trainer!                 ||
    ||    | o_o|                                                      ||
    ||    | ==>|          To view the level instructions again        ||
    ||   / /   \ \         type: cat welcome_message                  ||
    ||  ( |     | )                                                   ||
    || /' |_____/'\       Getting Stuck? Need help with a level?      ||
    || \___)--(___/         type:  cat helpme                         ||
    ||                                                                ||
    ||                    Use "su - level#"  to change levels         ||
    ||                                                                ||
    ||                    feedback: nopresearcher@gmail.com           ||
    ||                                                                ||
    ||                                                                ||
    ====================================================================
    
Welcome to Level 20

For this level you are going to continue familiarizing yourself with user artifacts.  Look in this user's home directory to see if there are any files left behind that may contain useful information.

type: man file
      man tar



      level20@ubuntu-s-1vcpu-1gb-nyc1-01:~$ cat level20_password 
The password for level20 is:

5cf82d972614f73422f899f90cfce80f



      level20@ubuntu-s-1vcpu-1gb-nyc1-01:~$ cat level20_password 
The password for level20 is:

5cf82d972614f73422f899f90cfce80f

level20@ubuntu-s-1vcpu-1gb-nyc1-01:~$ ls
backup.tgz  helpme  level20_password  welcome_message
level20@ubuntu-s-1vcpu-1gb-nyc1-01:~$ ls /tmp/
090909             systemd-private-0436b1c016c041eaa42fba435746ad55-systemd-resolved.service-WP1NUS
filename           systemd-private-0436b1c016c041eaa42fba435746ad55-systemd-timesyncd.service-sNjKZ5
sqlmapISBuao17413
level20@ubuntu-s-1vcpu-1gb-nyc1-01:~$ tar
tar     tarcat  
level20@ubuntu-s-1vcpu-1gb-nyc1-01:~$ tarcat backup.tgz 
level21_password000644 000765 000024 00000000040 13630024666 016260 0ustar00wesleythurnerstaff000000 000000 65230da2ead4ba2ed76ee2605cadcd4d

''''
    ====================================================================
    
Welcome to Level 21

For this level you are going to continue familiarizing yourself with user artifacts.  Look in this user's home directory to see if there are any files left behind that may contain useful information.

type: man file

