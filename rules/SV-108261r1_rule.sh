#!/bin/bash 

 # V-99157 - SV-108261r1_rule - The Oracle Linux operating system must be configured so that designated personnel are notified if baseline configurations are changed in an unauthorized manner. 
 # Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 
 result='Not_Reviewed' 

aide_pkg=`rpm -qa | grep aide`
if [ -z "$aide_pkg" ]
then
	result='NotReviewed'
	finding="Is another file integrity monitor being used"
else
	aide_cron=$(sudo grep aide /etc/cron.daily/* /etc/crontab /var/spool/cron/root | grep -v :# | grep -v ^#)
	if [ -z "$aide_cron" ]
	then
		result='Open'
		finding="No AIDE CRON"
	elif [[ ! "$aide_cron" =~ daily ]] && [[ ! "$aide_cron" =~ [:][0-9\*,]*[[:space:]]*[0-9\*,]*[[:space:]]*[\*][[:space:]]*[\*][[:space:]]*[\*] ]]
	then
		result='Open'
		finding="AIDE CRON not running daily"
	else
		result="NotAFinding"
	fi
fi

 echo "V-99157 - SV-108261r1_rule - $result - $finding"  
