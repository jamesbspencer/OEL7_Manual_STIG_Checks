#!/bin/bash 

 # V-99119 - SV-108223r1_rule - Accounts on the Oracle Linux operating system subjected to three unsuccessful logon attempts within 15 minutes must be locked for the maximum configurable period. 
 # Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 
 result='Not_Reviewed' 

OIFS=$IFS
IFS=$'\n'
for i in $(sudo grep -h pam_faillock.so /etc/pam.d/password-auth /etc/pam.d/system-auth | grep '^#*auth')
do
	echo "$i"
	commented=$(echo "$i" | grep '^#')
	deny=$(echo "$i" | grep -o 'deny=[0-9]*' | awk -F= '{print $2}') 
	deny_root=$(echo "$i" | grep "even_deny_root")
	interval=$(echo "$i" | grep -o 'fail_interval=[0-9]*' | awk -F= '{print $2}')
	unlock=$(echo "$i" | grep -o 'unlock_time=[0-9]*' | awk -F= '{print $2}')
if test -z "$commented" && [[ "$deny" -ge "3" && "$deny" -ne "0" ]] && test -n "$deny_root" && [ "$interval" -ge "900" ] && [[ "$unlock" != "never" || "$unlock" -ge "900" ]]
then
	result="NotAFinding"
	
else
	result="Open"
	finding="pam_faillock.so is not configured properly"	
	break
fi
done
IFS=$OIFS

 echo "V-99119 - SV-108223r1_rule - $result - $finding"  
