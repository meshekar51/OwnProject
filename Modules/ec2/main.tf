terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.prod]   # ← DECLARES the slot
    }
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_instance" "this" {
  ami =  "ami-0c7217cdde317cfec"
  subnet_id     = var.Private
  instance_type           = "t3.micro"
  vpc_security_group_ids = [var.private_sec]
  associate_public_ip_address = false
  tags = merge(local.common_tags, {
  Name = "${local.name_prefix}-hdl"
  })
}

resource "aws_instance" "this1" {
  ami =  data.aws_ami.rhel9_mumbai.id
  provider = aws.prod
  subnet_id     = var.Public
  instance_type = var.instance_type
  vpc_security_group_ids  = [var.public_sec]
  associate_public_ip_address = true

  tags = merge(local.common_tags, {
  Name = "${local.name_prefix}-bsv"
  })
}