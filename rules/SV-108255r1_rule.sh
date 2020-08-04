#!/bin/bash 

 # V-99151 - SV-108255r1_rule - The Oracle Linux operating system must have a host-based intrusion detection tool installed. 
 # Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 
 result='Not_Reviewed' 

hips=$(sudo rpm -qa | grep MFEhiplsm)
if [ -z "$hips" ]; then
	#HIPS not found. Maybe something else is used?
	result='Not_Reviewed'
else
	running=$(sudo ps -ef | grep -i "hipclient" | grep -v grep)
	if [ -z "$running" ]; then
		result='Open'
		finding="HIPS isn't running"
	else
		result="NotAFinding"
	fi
fi

 echo "V-99151 - SV-108255r1_rule - $result - $finding"  
