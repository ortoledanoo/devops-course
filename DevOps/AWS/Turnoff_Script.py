import boto3
# ~/.aws/credentials
# [default]
# aws_access_key_id = YOUR_KEY
# aws_secret_access_key = YOUR_SECRET

# ~/.aws/config
# [default]
# region=il-central-1

# Create EC2 Client To Connect EC2 Service
ec2_client = boto3.client('ec2')

# Find All Running Instances
response = ec2_client.describe_instances(
    Filters=[{'Name': 'instance-state-name', 'Values': ['running']}]
)

# Extract Instance IDs
instance_ids = []
for reservation in response['Reservations']:
    for instance in reservation['Instances']:
        instance_ids.append(instance['InstanceId'])

if instance_ids:
    # Stop All Running Instances
    ec2_client.stop_instances(InstanceIds=instance_ids)
    print(f"Stopping Instances - {instance_ids}")
else:
    print("No Running Instances!")
