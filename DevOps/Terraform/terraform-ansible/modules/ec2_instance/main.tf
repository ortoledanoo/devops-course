resource "aws_instance" "example_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name              = var.key_name
  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name = "Ansible-Terraform-Instance"
  }
}