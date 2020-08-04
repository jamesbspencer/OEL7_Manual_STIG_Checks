#!/bin/bash 

 # V-99245 - SV-108349r1_rule - The Oracle Linux operating system must disable Kernel core dumps unless needed. 
 # Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 
 result='Not_Reviewed' 

state=$(sudo systemctl show kdump.service --property=UnitFileState | awk -F= '{print $2}')
if [ "$state" = "enabled" ]; then
	result="Open"
	finding="$state"
else
	result="NotAFinding"
fi

 echo "V-99245 - SV-108349r1_rule - $result - $finding"  
