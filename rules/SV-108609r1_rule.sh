#!/bin/bash 

 # V-99505 - SV-108609r1_rule - The Oracle Linux operating system must be configured to prevent unrestricted mail relaying. 
 # Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 
 result='Not_Reviewed' 

post_fix=$(sudo rpm -qa | grep postfix)
if [ -z "$post_fix" ]; then
	result='Not_Applicable'
	finding="Postfix is not installed"
else
	restrict=$(sudo postconf -n smtpd_client_restrictions | awk -F= '{print $2}')
	for i in ${restrict//,/ }; do
		if  [[ "$i" != "permit_mynetworks" ]] && [[ "$i"  != "reject" ]] ; then
			result='Open'
			finding="$i"
		else
			result="NotAFinding"
		fi
	done
fi

 echo "V-99505 - SV-108609r1_rule - $result - $finding"  
