#!/bin/bash 

 # V-99475 - SV-108579r1_rule - The Oracle Linux operating system must enable an application firewall, if available. 
 # Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 
 result='Not_Reviewed' 

enabled=$(sudo systemctl show firewalld --property=UnitFileState | awk -F= '{print $2}')
active=$(sudo systemctl show firewalld --property=ActiveState | awk -F= '{print $2}')
if [ "$enabled" = "enabled" ] && [ "$active" = "active" ]; then
	state=$(sudo firewall-cmd --state)
	if [[ "$state" != "running" ]]; then
		result="Open"
		finding="Firewalld isn't running"
	else
		result="NotAFinding"
	fi
else
	result='Open'
	finding="Firewalld isn't running"
fi

 echo "V-99475 - SV-108579r1_rule - $result - $finding"  
