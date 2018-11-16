#!/bin/bash
#
# purpose: 开启代理
# 

# proxy to company
ssh -D 18180 root@localhost -p 18122 -Nf

# proxy to hongkong
ssh Terry@tkstorm_proxy -p 36000 -D localhost:10443 -4NfC
