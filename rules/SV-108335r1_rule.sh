#!/bin/bash 

 # V-99231 - SV-108335r1_rule - The Oracle Linux operating system must mount /dev/shm with the nosuid option. 
 # Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 
 result='Not_Reviewed' 

temp_dir=$(sudo grep -v '^#' /etc/fstab | grep /dev/shm | grep nosuid)
if test -z "$temp_dir"
then
	result="Open"
	finding="temp partition not configured correctly"
else
	result="NotAFinding"
fi

 echo "V-99231 - SV-108335r1_rule - $result - $finding"  
