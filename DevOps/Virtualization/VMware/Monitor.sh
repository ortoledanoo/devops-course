#!/bin/bash

machine_name="Ubuntu Server #1"
ssh_call="sshpass -p "Student2021!" ssh devops@10.1.3.3"
vmid=$($ssh_call vim-cmd vmsvc/getallvms | awk "/$machine_name/{print $1}") 

if [ -z "$vmid" ];
then
	echo "VM Not Existed"
	exit 1
fi

status=$($ssh_call vim-cmd vmsvc/power.getstate $vmid | tail -n1)

if [[ $status != "Powered on" ]]; 
then
	echo "Machine Powered Off, Power On..."
	$ssh_call vim-cmd vmsvc/power.on $vmid
else
	echo "Machine Powered On"
fi

