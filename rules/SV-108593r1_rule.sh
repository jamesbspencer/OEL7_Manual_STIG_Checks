#!/bin/bash 

 # V-99489 - SV-108593r1_rule - The Oracle Linux operating system must use a reverse-path filter for IPv4 network traffic when possible by default. 
 # Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 
 result='Not_Reviewed' 

rp_filter=$(sudo grep -h -v ^# /etc/sysctl.conf /etc/sysctl.d/* | grep net.ipv4.conf.default.rp_filter | uniq | awk -F= '{print $2}')
if [ -z "$rp_filter" ]; then
	result='Open'
	finding="Reverse path filter not found"
elif [ "$rp_filter" -ne "1" ]
then
	result="Open"
	finding="Reverse path filter not enabled"
else
	result="NotAFinding"
fi

 echo "V-99489 - SV-108593r1_rule - $result - $finding"  
