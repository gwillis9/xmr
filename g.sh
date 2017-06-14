#!/bin/bash
sudo apt-get remove sendmail -y
sudo apt-get install git build-essential libjansson-dev libgmp-dev libcurl4-openssl-dev libssl-dev pthreads zlib openssl-devel gcc-c++ curl-devel libmpc-devel gmp  gmp-devel  mpfr  mpfr-devel  libmpc  libmpc-devel -y
sudo apt-get install openssl-devel -y
sudo apt-get install libmpc-dev make -y
sudo apt-get install libmpc-devel gmp  gmp-devel  mpfr  mpfr-devel  libmpc  libmpc-devel -y
sudo apt-get install autotools-dev -y
sudo apt-get install automake -y
sudo apt-get install build-essential libcurl4-openssl-dev git automake libtool libjansson* libncurses5-dev libssl-dev -y
sudo apt-get install openssl-devel -y
sudo apt-get install gcc-c++ -y
sudo apt-get install curl-devel -y
sudo apt-get install libmpc-devel gmp  gmp-devel  mpfr  mpfr-devel  libmpc  libmpc-devel -y
cd /m
git clone --recursive https://github.com/JayDDee/cpuminer-opt.git
cd cpuminer-opt
ln -s /usr/include/curl curl
git checkout linux
make
if [ ! -f ./cpuminer ];
	then sudo ./build.sh
fi
if [ ! -f ./cpuminer ];
	then sudo ./autogen.sh
fi
sudo CFLAGS="-O3 -march=native -Wall" CXXFLAGS="$CFLAGS -std=gnu++11" ./configure --with-curl
#sudo sysctl -w vm.nr_hugepages=6
#sudo ./build.sh
while true; do
#	./cpuminer -a cryptonight -o stratum+tcp://cryptonight.usa.nicehash.com:3355 -u $VAR_ADDRESS -p x -x $VAR_PROXY -R 1 -r 10 --api-bind 0
#	./cpuminer -a cryptonight -o stratum+tcp://cryptonight.eu.nicehash.com:3355 -u $VAR_ADDRESS -p x -x $VAR_PROXY -R 1 -r 10 --api-bind 0
	./cpuminer -a cryptonight -o stratum+tcp://mine.moneropool.com:3333 -u $VAR_ADDRESS -p x -x $VAR_PROXY -R 1 -r 10 --api-bind 0
	./cpuminer -a cryptonight -o stratum+tcp://mine.moneropool.com:3333 -u $VAR_ADDRESS -p x -x $VAR_PROXY -R 1 -r 10 --api-bind 0
done
