resource "aws_nat_gateway" "NAT-GATEWAY" {
  allocation_id = var.eip
  subnet_id     = var.Public

  tags = {
    Name = "${local.name_prefix}gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [var.igwid]
}