The Last Great Zip File

```
Help! I've created a zip archive that contains my favorite flag, but I forgot the password to it. Can you help me recover my flag back?

You may need to use another program such as wget to download the file if your browser is blocking the download. Now to get the password hash from the zip file...
```

1. `wget https://metaproblems.com/4c8353df44a1dc0c5535ec84fa8da70e/flag.zip`

1. Download [John the Ripper](https://www.openwall.com/john/)
    *   ```
        $ git clone https://github.com/openwall/john
        $ cd john/src
        $ ./configure && make
        ```

1. `./john/run/zip2john flag.zip > zip.hashes`

1. `./john/run/john --wordlist=/usr/share/wordlists/rockyou.txt zip.hashes `

1. `./john/run/john zip.hashes --show`