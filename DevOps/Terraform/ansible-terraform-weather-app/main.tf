# Security Group Definition
resource "aws_security_group" "ansible-tf-sg" {
  name        = "Ansible-Terraform-SG"
  description = "Allow inbound SSH, HTTP/HTTPS and all outbound traffic"

  # Dynamic Inbound Rules
  dynamic "ingress" {
    for_each = [
      { port = 22, cidr = "213.57.121.34/32", description = "Allow SSH" },
      { port = 80, cidr = "0.0.0.0/0", description = "Allow HTTP" },
      { port = 443, cidr = "0.0.0.0/0", description = "Allow HTTPS" },
      { port = 5000, cidr = "0.0.0.0/0", description = "Allow Python-WeatherApp" }
    ]

    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = [ingress.value.cidr]
    }
  }

  # Outbound Rule: Allow all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" ##
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
}

# Attach Security Group to Instance
resource "aws_instance" "example_server" {
  ami           = "ami-01c587e7bcf6ff91f"
  instance_type = "t3.micro"
  key_name      = "infinity_key_pair"

  vpc_security_group_ids = [aws_security_group.ansible-tf-sg.id]

  tags = {
    Name = "Ansible-Terraform-Instance"
  }

  provisioner "local-exec" {
    command = <<EOT
      {
        echo "[weather-app]"
        echo "${self.public_ip}" 
      } > inventory
      sleep 90
      ansible-playbook -i inventory -u ubuntu docker-weather-app-playbook.yml
    EOT
  }
}