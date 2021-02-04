terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "NGINX" {
  ami           = "ami-0b34567fc2d4a7e3a"
  instance_type = "t2.nano"
}

resource "aws_eip" "ip" {
  vpc      = true
  instance = aws_instance.NGINX.id
}
