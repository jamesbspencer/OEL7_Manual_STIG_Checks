#!/bin/bash 

 # V-99251 - SV-108355r1_rule - The Oracle Linux operating system must use a separate file system for the system audit data path large enough to hold at least one week of audit data. 
 # Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 
 result='Not_Reviewed' 

audit_partition=$(sudo grep /var/log/audit /etc/fstab)
audit_mounted=$(sudo mount | grep "/var/log/audit")
audit_usage=$(sudo df -h /var/log/audit | tail -n +2 | awk '{print $5}' | sed s/%//)
if test -z "$audit_partition" || test -z "$audit_mounted" || [ "$audit_usage" -gt "90" ]
then
	result="Open"
	finding="Check audit log parition"
else
	result="NotAFinding"
fi


 echo "V-99251 - SV-108355r1_rule - $result - $finding"  
