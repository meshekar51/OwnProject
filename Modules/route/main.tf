resource "aws_route_table" "Public_RT" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igwid
  }


  tags = {
    Name = "${local.name_prefix}-Public_Route"
  }
}

resource "aws_route_table" "Private_RT" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.natgw
  }


  tags = {
    Name = "${local.name_prefix}Private_Route"
  }
}

resource "aws_route_table_association" "Public_association" {
  subnet_id      = var.Public
  route_table_id = aws_route_table.Public_RT.id
}

resource "aws_route_table_association" "Private_association" {
  subnet_id      = var.Private
  route_table_id = aws_route_table.Private_RT.id
}