variable "instance_ip" {
  description = "Public IP of the EC2 instance"
  type        = string
}

variable "playbook_path" {
  description = "Path to the Ansible playbook"
  type        = string
}

variable "ssh_user" {
  description = "SSH user for Ansible connection"
  type        = string
}