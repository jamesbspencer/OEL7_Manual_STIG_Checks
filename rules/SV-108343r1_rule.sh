#!/bin/bash 

 # V-99239 - SV-108343r1_rule - The Oracle Linux operating system must have cron logging implemented. 
 # Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 
 result='Not_Reviewed' 

cron=$(sudo grep cron /etc/rsyslog.conf /etc/rsyslog.d/*.conf)
msgs=$(sudo grep -v ^# /etc/rsyslog.conf /etc/rsyslog.d/* | grep /var/log/messages)
if [ -z "$cron" ] || [ -z "$msgs" ]
then
	result='Open'
	finding="Cron not being logged"
else
	result="NotAFinding"
fi


 echo "V-99239 - SV-108343r1_rule - $result - $finding"  
