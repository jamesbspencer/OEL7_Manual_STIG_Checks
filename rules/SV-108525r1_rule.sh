#!/bin/bash 

 # V-99421 - SV-108525r1_rule - The Oracle Linux operating system must be configured so that all network connections associated with a communication session are terminated at the end of the session or after 10 minutes of inactivity from the user at a command prompt, except to fulfill documented and validated mission requirements. 
 # Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 
 result='Not_Reviewed' 

timeout=$(sudo grep -h -i '^tmout' /etc/profile.d/* | awk -F= '{print $2}')
if [ "$timeout" -gt "600" ]
then
	result="Open"
	finding="TMOUT is set to $timeout"
else
	result="NotAFinding"
fi

 echo "V-99421 - SV-108525r1_rule - $result - $finding"  
