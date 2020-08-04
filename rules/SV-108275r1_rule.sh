#!/bin/bash 

 # V-99171 - SV-108275r1_rule - The Oracle Linux operating system must be configured so that the x86 Ctrl-Alt-Delete key sequence is disabled. 
 # Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 
 result='Not_Reviewed' 

mask=$(sudo systemctl status ctrl-alt-del.target | grep Loaded | awk -F: '{print $2}' | awk -F\( '{print $1}')
activ=$(sudo systemctl status ctrl-alt-del.target | grep Active | awk -F: '{print $2}' | awk -F\( '{print $1}')
if [[ ! "$mask" =~ masked ]] && [[ ! "$activ" =~ inactive ]]; then
	result='Open'
	finding="ctrl-alt-del.target is active"
else
	result="NotAFinding"
fi

 echo "V-99171 - SV-108275r1_rule - $result - $finding"  
