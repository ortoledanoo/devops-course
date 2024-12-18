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
  default     = "docker-weather-app-playbook.yml" # If Not Set in terraform.tfvars
}

variable "ssh_user" {
  description = "SSH user for Ansible connection"
  type        = string
  default     = "ubuntu" # If Not Set in terraform.tfvars
}