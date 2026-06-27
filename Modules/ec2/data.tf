# Modules/ec2/main.tf — a second lookup, on the prod (Mumbai) provider
data "aws_ami" "rhel9_mumbai" {
  provider    = aws.prod
  most_recent = true
  owners      = ["309956199498"]
  filter {
    name   = "name"
    values = ["RHEL-9*-x86_64-*"]
  }
}