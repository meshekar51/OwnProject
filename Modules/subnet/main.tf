resource "aws_subnet" "Private" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Private"
  }
}

resource "aws_subnet" "Public" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "Public"
  }
}


resource "aws_subnet" "Database" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "Database"
  }
}