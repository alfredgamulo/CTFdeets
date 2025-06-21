PRE
===
Install Docker⁠
Run `docker pull bkimminich/juice-shop`
Run `docker run --rm -p 3000:3000 bkimminich/juice-shop`
Browse to http://localhost:3000⁠ (on macOS and Windows browse to http://192.168.99.100:3000⁠ if you are using docker-machine instead of the native docker installation)

Tools
=====

`dirb http://localhost:3000`
`ffuf -u http://localhost:3000/FUZZ -w /usr/share/seclists/Discovery/Web-Content/common.txt -fs 80117,0`