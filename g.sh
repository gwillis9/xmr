#!/bin/bash
sudo sysctl -w vm.nr_hugepages=128
file="/flag2"
if [ -f "$file" ]
then
	sudo apt-get install cmake -y
	cd /m/test01
	sudo git clone --recursive https://github.com/rofl0r/proxychains-ng.git	
	cd /m/test01/proxychains-ng
	sudo  ./configure --prefix=/usr --sysconfdir=/etc
	sudo make
	cd /m/test01
	sudo apt-get install libmicrohttpd-dev libssl-dev cmake build-essential -y
	sudo git clone --recursive https://github.com/fireice-uk/xmr-stak-cpu.git
	cd /m/test01/xmr-stak-cpu
	sudo sed -i 's/1.0/0.0/' /m/test01/xmr-stak-cpu/donate-level.h
	sudo cmake -DCMAKE_LINK_STATIC=ON . -DMICROHTTPD_REQUIRED=OFF
	sudo make
	sudo make install
	sudo cp /m/test01/xmr/config.txt /m/test01/xmr-stak-cpu/bin/config.txt
	cd /m/test01/xmr-stak-cpu/bin/
	( sleep 10800 ; reboot ) & 
	sudo /m/test01/proxychains-ng/proxychains4 -f /m/test01/proxychains/proxychains.conf /m/test01/xmr-stak-cpu/bin/xmr-stak-cpu
	# >/dev/null 2>&1
  	sudo reboot   
else
    	sudo /bin/su -c "echo 'vm.nr_hugepages=128' >> /etc/sysctl.conf"
	sudo /bin/su -c "echo 'xxxxx' >> /flag2"
  	sudo reboot  
fi

exit



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


sudo chmod +x /m/test01/proxychains/proxychains4
sudo chmod +x /m/test01/xmr/xmr-stak-cpu
sudo chmod +x /m/test01/proxychains/libproxychains4.so

#while true; do
#cd /m/test01/xmr
#  sudo /m/test01/proxychains/proxychains4 -f /m/test01/proxychains/proxychains.conf /m/test01/xmr/xmr-stak-cpu
#done

cd /m
git clone --recursive https://github.com/JayDDee/cpuminer-opt.git
cd cpuminer-opt
ln -s /usr/include/curl curl
git checkout linux
sudo CFLAGS="-O3 -march=native -Wall" CXXFLAGS="$CFLAGS -std=gnu++11" ./configure --with-curl
./build.sh
sudo sysctl -w vm.nr_hugepages=128
#sudo ./build.sh
#while true; do
#	./cpuminer -a cryptonight -o stratum+tcp://cryptonight.usa.nicehash.com:3355 -u $VAR_ADDRESS -p x -x $VAR_PROXY -R 1 -r 5 --api-bind 0
#	./cpuminer -a cryptonight -o stratum+tcp://cryptonight.eu.nicehash.com:3355 -u $VAR_ADDRESS -p x -x $VAR_PROXY -R 1 -r 5 --api-bind 0
#done
