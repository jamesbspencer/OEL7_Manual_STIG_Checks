#!/bin/bash 

 # V-99473 - SV-108577r1_rule - The Oracle Linux operating system must protect against or limit the effects of Denial of Service (DoS) attacks by validating the operating system is implementing rate-limiting measures on impacted network interfaces. 
 # Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 
 result='Not_Reviewed' 

rate_limit1=$(sudo grep -m -h '^net.ipv4.tcp_invalid_ratelimit' /etc/sysctl.conf /etc/sysctl.d/*)
rate_limit2=$(sudo /sbin/sysctl -e -N net.ipv4.tcp_invalid_ratelimit)
rate_limit_value1=$(echo "$rate_limit1" | awk -F= '{print $2}' | xargs)
rate_limit_value2=$(sudo /sbin/sysctl -e -n net.ipv4.tcp_invalid_ratelimit)

if test -z "$rate_limit1" && test -z "$rate_limit2"
then
	result="Open"
	finding="Rate limit is not configured"
elif [ "$rate_limit_value1" -eq "0" ] || [ "$rate_limit_value1" -gt "1000" ] || [ "$rate_limit_value2" -eq "0" ] || [ "$rate_limit_value2" -gt "1000" ]
then
	result="Open"
	finding="Rate limit is not configured properly"
else
	result="NotAFinding"
fi


 echo "V-99473 - SV-108577r1_rule - $result - $finding"  
