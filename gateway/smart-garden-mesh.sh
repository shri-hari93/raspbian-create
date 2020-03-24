sudo batctl if add wlan0

sudo batctl gw_mode server

sudo sysctl -w net.ipv4.ip_forward=1
ETH=`ip link | awk -F: '$0 !~ "lo|vir|wl|^[^0-9]"{print $2a;getline}' | head -n 1`
sudo iptables -t nat -A POSTROUTING -o $ETH -j MASQUERADE
sudo iptables -A FORWARD -i $ETH -o bat0 -j ACCEPT
sudo iptables -A FORWARD -i bat0 -o $ETH -j ACCEPT

sudo ifconfig wlan0 up
sudo ifconfig bat0 up

sudo service isc-dhcp-server start
sudo systemctl enable isc-dhcp-server