#!/bin/bash 

 # V-99207 - SV-108311r1_rule - The Oracle Linux operating system must be configured so that all files and directories contained in local interactive user home directories have a mode of 0750 or less permissive. 
 # Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 
 result='Not_Reviewed' 

min=$(sudo awk '$1 == "UID_MIN"{print $2}' /etc/login.defs | tr -d '[:space:]')
max=$(sudo awk '$1 == "UID_MAX"{print $2}' /etc/login.defs | tr -d '[:space:]')
for user in $(sudo awk -F: '($3 <= $max)&&($7 !~ "nologin"){print $1":"$3":"$4":"$6}' /etc/passwd)
do
	id=$(echo $user | awk -F: '{print $1}')
	uid=$(echo $user | awk -F: '{print $2}')
	gid=$(echo $user | awk -F: '{print $3}')
	home=$(echo $user | awk -F: '{print $4}')
	if [ $uid -gt $min ]; then
		for i in $(sudo find $home -not -path '*/\.*' -type f \( ! -iname ".*" \) -o -type d -not -path '*/\.*')
		do
			rights=$(sudo stat -c %a $i)
			if ! [[ "$rights" =~ ^(750|740|700|650|640|600|450|440|400)$ ]]; then
				result='Open'
				finding="$id"
				break
			else
				result="NotAFinding"
			fi
		done
	fi
done

 echo "V-99207 - SV-108311r1_rule - $result - $finding"  
