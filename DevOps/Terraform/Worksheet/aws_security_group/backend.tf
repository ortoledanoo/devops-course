# Set Remote State
terraform {
  backend "s3" {
    bucket         = "ex4-or-toledano-bucket-tf"
    region         = "il-central-1"
    dynamodb_table = "terraform_state_lock"
    key            = "ex4.tfstate" # Path Inside Bucket
    encrypt        = true
  }
}

# Flow
# When running 'terraform apply / terraform plan', we download state from S3
# Checking lock in DynamoDB to make sure nobody works on state
# If it's not locked - Terraform creates new lock on DynamoDB
# After changes are made, uploads new state file to S3
# Release Lock in DynamoDB

# Lock
# Created By LockID as Unic Key!
# Deleted after mission complete to allow other users to work