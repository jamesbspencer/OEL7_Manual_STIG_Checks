#!/bin/bash 

 # V-99525 - SV-108629r1_rule - The Oracle Linux operating system must not have unauthorized IP tunnels configured. 
 # Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 
 result='Not_Reviewed' 

swan=$(sudo rpm -qa | grep libreswan)
if [ -n "$swan" ]; then
	active=$(sudo systemctl show ipsec --property=ActiveState | awk -F= '{print $2}')
	if [ "$active" = "active" ]; then
		tuns=$(sudo grep -h -v ^# /etc/ipsec.conf /etc/ipsec.d/*.conf | grep -iw conn)
		if [ -n "$tuns" ]; then
			result='Open'
			finding="Tunnel is active"
		fi
	else
		result="NotAFinding"
	fi
else
	result="NotAFinding"
fi

 echo "V-99525 - SV-108629r1_rule - $result - $finding"  
