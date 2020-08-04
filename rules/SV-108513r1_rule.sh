#!/bin/bash 

 # V-99409 - SV-108513r1_rule - The Oracle Linux operating system must send rsyslog output to a log aggregation server. 
 # Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 
 result='Not_Reviewed' 

send=`sudo grep -h -v ^# /etc/rsyslog.conf /etc/rsyslog.d/*.conf | grep @  | grep '^\*\.\*'`
if [ -z "$send" ]; then
	result='Open'
	finding="rsyslog not forwarding"
else
	result="NotAFinding"
fi

 echo "V-99409 - SV-108513r1_rule - $result - $finding"  
