Cracker.py

To Use
0. Install aircrack (On Ubuntu, #sudo apt install aircrack-ng)

1. Capture some handshakes (#sudo ./startCapture.sh)

2. Drop pcaps with handshakes in same directory as cracker.py and the cyberpunk.words dictionary

3. Modify cracker.py to include the list of APs to search for

4. If you wish to stop the search for an AP's password once the first valid handshake is encountered, set the ContinueIfFound flag to False.

5. Run cracker in directory with all the pcaps (#python2 cracker.py)


Note the sample data includes valid handshakes for WCTF_01, WCTF_05, WCTF_06, and WCTF_10

