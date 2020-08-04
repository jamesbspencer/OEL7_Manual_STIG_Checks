#!/bin/bash 

 # V-99051 - SV-108155r1_rule - The Oracle Linux operating system must display the approved Standard Mandatory DoD Notice and Consent Banner before granting local or remote access to the system via a graphical user logon. 
 # Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 
 result='Not_Reviewed' 

gnome=$(sudo rpm -qa | grep -i "gnome")
banner=$(sudo grep -s -h banner-message-text /etc/dconf/db/local.d/* | awk -F= '{print $2}' | grep -i "you are accessing a u.s. government")
if test -z "$gnome"
then
	result="NotApplicable"
elif test -z "$banner"
then
	result="Open"
	finding="No the correct banner"
else
	result="NotAFinding"
	finding="GNOME is not installed"
fi

 echo "V-99051 - SV-108155r1_rule - $result - $finding"  
