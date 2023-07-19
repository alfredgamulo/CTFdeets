A Naive Hash

```
Hashing is a method of reducing some input to a fixed-length signature. There is no way to decrypt the original messages without guessing some possibilities. Can you crack this MD5 hash?

5c2981b42e5bc96ad70cf064290b70b4
```

1. `brew install hashcat`

1. `curl -OL https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt`

1. `hashcat -m 0 -a 0 hash.txt rockyou.txt`

1. `hashcat -m 0 -a 0 hash.txt rockyou.txt --show`