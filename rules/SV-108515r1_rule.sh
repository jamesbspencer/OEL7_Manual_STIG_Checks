#!/bin/bash 

 # V-99411 - SV-108515r1_rule - The Oracle Linux operating system must be configured so that the rsyslog daemon does not accept log messages from other servers unless the server is being used for log aggregation. 
 # Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 
 result='Not_Reviewed' 

accept=$(sudo grep 'imtcp\|imudp\|imrelp' /etc/rsyslog.conf | grep -v ^#)
if [ -n "$accept" ]; then
	result='Open'
	finding="syslog is accepting messages"
else
	result="NotAFinding"
fi

 echo "V-99411 - SV-108515r1_rule - $result - $finding"  
