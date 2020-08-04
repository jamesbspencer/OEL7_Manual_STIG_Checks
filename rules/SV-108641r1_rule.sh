#!/bin/bash 

 # V-99537 - SV-108641r1_rule - The Oracle Linux operating system must protect audit information from unauthorized read, modification, or deletion. 
 # Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 
 result='Not_Reviewed' 

for log in $(sudo ls /var/log/audit/)
do
	perms=$(sudo stat -c %a "/var/log/audit/$log")
	ownr=$(sudo stat -c %U "/var/log/audit/$log")
	grp=$(sudo stat -c %G "/var/log/audit/$log")
	
	if [[ ( "$perms" -eq "600" || "$perms" -eq "400" ) && "$ownr" = "root" && "$grp" = "root" ]]
	then
		result="NotAFinding"
	else
		result="Open"
		finding="Audit log permission on $log are not right"
		break
	fi
done

 echo "V-99537 - SV-108641r1_rule - $result - $finding"  
