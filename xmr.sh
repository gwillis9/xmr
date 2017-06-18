#!/bin/bash
cd /m/test01/xmr/
sudo /m/test01/proxychains/proxychains4 -f /m/test01/proxychains/proxychains.conf /m/test01/xmr/xmr-stak-cpu >/dev/null 2>&1
sudo reboot
