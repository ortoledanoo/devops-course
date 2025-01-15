variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "playbook_path" {
  description = "Path to the Ansible playbook"
  type        = string
}

variable "ssh_user" {
  description = "SSH user for Ansible connection"
  type        = string
  default     = "ubuntu" # Use if not set in terraform.tfvars
}