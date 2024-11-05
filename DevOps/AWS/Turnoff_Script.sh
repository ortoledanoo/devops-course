#!/bin/bash

# Find All Running Instances and Save Id's To List
instance_ids=$(aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[*].Instances[*].InstanceId" --output text)

# -n - if Have Content in $instances_ids
if [ -n "$instance_ids" ]; then
    aws ec2 stop-instances --instance-ids $instance_ids
    echo "Stopping Instances - $instance_ids"
else
    echo "No running instances found."
fi

