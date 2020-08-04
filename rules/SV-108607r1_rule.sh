#!/bin/bash 

 # V-99503 - SV-108607r1_rule - Network interfaces configured on The Oracle Linux operating system must not be in promiscuous mode. 
 # Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 
 result='Not_Reviewed' 

promisc=$(sudo ip link | grep promisc)
if [ -n "$promisc" ]; then
	result='Open'
	finding="$promisc"
else
	result="NotAFinding"
fi

 echo "V-99503 - SV-108607r1_rule - $result - $finding"  
