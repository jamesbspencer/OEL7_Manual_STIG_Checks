#!/bin/bash 

 # V-99539 - SV-108643r2_rule - The Oracle Linux operating system must enable SELinux. 
 # Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 
 result='Not_Reviewed' 

se_linux=$(sudo getenforce)
if [ "$se_linux" != "Enforcing" ]
then
	result='Open'
	finding="$se_linux"
else
	result="NotAFinding"
fi

 echo "V-99539 - SV-108643r2_rule - $result - $finding"  
