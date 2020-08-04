#!/bin/bash 

 # V-99469 - SV-108573r1_rule - The operating system must request and perform data origin authentication verification and data integrity verification on the name/address resolution responses the system receives from authoritative sources. 
 # Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 
 result='Not_Reviewed' 

dnssec=$(sudo rpm -qa | grep -i unbound)
unbound_svc=$(sudo systemctl show unbound --property=SubState | awk -F= '{print $2}')
if test -z "$dnssec"
then
	result="Open"
	finding="unbound is not installed"
elif [ "$unbound_svc" != "running" ]
then
	result="Open"
	finding="unbound is not running"
else
	result="NotAFinding"
fi

 echo "V-99469 - SV-108573r1_rule - $result - $finding"  
