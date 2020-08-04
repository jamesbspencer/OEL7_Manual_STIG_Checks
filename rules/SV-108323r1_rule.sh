#!/bin/bash 

 # V-99219 - SV-108323r1_rule - The Oracle Linux operating system must be configured so that all system device files are correctly labeled to prevent unauthorized modification. 
 # Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 
 result='Not_Reviewed' 

lbla=$(sudo find /dev -context *:device_t:* \( -type c -o -type b \) -printf "%p %Z\n")
lblb=$(sudo find /dev -context *:unlabeled_t:* \( -type c -o -type b \) -printf "%p %Z\n")
if [ ! -z "$lbla" ] && [ ! -z "$lblb" ]; then
	result='Open'
	finding="$lbla $lblb"
else
	result="NotAFinding"
fi

 echo "V-99219 - SV-108323r1_rule - $result - $finding"  
