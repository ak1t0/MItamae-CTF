# MItamae-CTF

## Description
This is provisioning file for CTF player based on [MItamae](https://github.com/k0kubun/mitamae).

> MItamae  
> Itamae implementation that is runnable without Ruby, which is a lightweight configuration management tool inspired by Chef. 
> With mitamae's standalone binary, you can write a configuration recipe in Ruby and apply it without Ruby.  
> https://github.com/k0kubun/mitamae

## Development
- Ubuntu 17.04

## Config
node.json
```json
{
    "user": "",
    "dir": ""
}

```
sample
```json
{
    "user": "ak1t0",
    "dir": "Works"
}
```

If this json is specified, tools will be installed to `/home/ak1t0/Works/ctf`.  
dir should be `""` when you don't need dir.


## Install
`./mitamae local -j node.json recipe.rb`

### Tools
git, curl, binutils, lib32z1, lib32ncurses5, gdb-peda, enjarify, volatility, wireshark, sleuthkit, binwalk, radare2, jd-gui, stegsolve, rp++, pwntools  


This is based on [Mitamae-Debian](https://github.com/taroooyan/mitamae-debian) and [mitamae-osx](https://github.com/upamune/mitamae-osx).  


Copyright © 2017 ak1t0
Distributed under [LICENSE](https://github.com/ak1t0/MItamae-CTF/blob/master/LICENSE)
