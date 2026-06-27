terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.prod]   # ← DECLARES the slot
    }
  }
}

resource "aws_instance" "this" {
  ami                     = "ami-00adafae70b8029d8"
  instance_type           = "t3.micro"
  availability_zone       = "us-east-1a"
  vpc_security_group_ids = [var.private_sec]
  associate_public_ip_address = false
tags = {
    Name = "tf-private"
  }
}

resource "aws_instance" "this1" {
  ami                     = "ami-00adafae70b8029d8"
  provider = aws.prod
  instance_type           = "t3.micro"
  availability_zone       = "us-east-1b"
  vpc_security_group_ids  = [var.public_sec]
  associate_public_ip_address = true

 tags = {
    Name = "tf-public"
  }
}