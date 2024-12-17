terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.81.0" # Latest From Doc
    }
  }
}

provider "aws" {
  region  = "il-central-1"
  profile = "default"
}

resource "aws_instance" "example_server" {
  ami           = "ami-01c587e7bcf6ff91f" # Ubuntu
  instance_type = "t3.micro"

  tags = {
    Name = "EX3_Instance"
  }
}
