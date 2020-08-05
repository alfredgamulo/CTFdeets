# Pivoting

## If you've owned a box, how can you pivot to other machines in private subnets?
SOCKS Proxy
```
ssh weytechuser@files.wey-tech.com -D 9050 -f -N
```
Use proxychains to force any command we run locally to route all traffic through our SOCKS tunnel so that we can hit targets

Configure Firefox to run through the proxy.
