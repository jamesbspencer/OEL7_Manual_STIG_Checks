#!/bin/bash 

 # V-99261 - SV-108365r1_rule - The Oracle Linux operating system must use a file integrity tool that is configured to use FIPS 140-2 approved cryptographic hashes for validating file contents and directories. 
 # Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 
 result='Not_Reviewed' 

aide=$(sudo rpm -qa | grep "aide")
aide_conf=$(sudo find / -name "aide.conf")
acl=$(sudo grep -i ^ALL[[:space:]=][[:space:]=]* $aide_conf | grep sha512)
if test -z "$aide"
then
	result="NotReviewed"
elif test -z "$aide_conf"
then
	result="Open"
	finding="aide config not found"	
elif test -z "$acl"
then
	result="Open"
	finding="ACL not found in aide config file"
else
	result="NotAFinding"
fi

 echo "V-99261 - SV-108365r1_rule - $result - $finding"  
