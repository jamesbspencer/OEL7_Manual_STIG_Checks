#!/bin/bash 

 # V-99535 - SV-108639r1_rule - The Oracle Linux operating system must be configured so that all wireless network adapters are disabled. 
 # Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 
 result='Not_Reviewed' 

adapters=$(sudo lspci | grep -i 'ethernet\|network' | grep -i wi)
ints=$(sudo ip link | grep -i wl)
if [ -z "$adapters" ] && [ -z "$ints" ]; then
	result='Not_Applicable'
	finding="No Wireless Adapters"
else
	conns=$(sudo nmcli device | grep -i wl | grep -i connected)
	if [ -z "$conns" ]; then
		result='NotAFinding'
	else
		result='Open'
		finding="There are wireless adapters"
	fi
fi

 echo "V-99535 - SV-108639r1_rule - $result - $finding"  
