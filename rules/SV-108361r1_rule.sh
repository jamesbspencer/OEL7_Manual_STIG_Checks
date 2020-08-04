#!/bin/bash 

 # V-99257 - SV-108361r1_rule - The Oracle Linux operating system must be configured so that the file integrity tool is configured to verify Access Control Lists (ACLs). 
 # Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 
 result='Not_Reviewed' 

aide=$(sudo rpm -qa | grep "aide")
if [ -z "$aide" ]
then
	result='Not_Reviewed'
	finding="AIDE is not installed"
	
else
	aide_conf=$(sudo find / -name "aide.conf")
	if [ -z "$aide_conf" ]
	then
		result="Open"
		finding="aide config not found"
		
	else
		acl=$(sudo grep -i ^ALL[[:space:]=][[:space:]=]* $aide_conf | grep acl)
		if [ -z "$acl" ]
		then
			result="Open"
			finding="ACL not found in aide config file"
		else
			result="NotAFinding"
		fi
	fi

fi

 echo "V-99257 - SV-108361r1_rule - $result - $finding"  
