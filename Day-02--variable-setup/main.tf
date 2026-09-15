resource "aws_vpc" "ops-vpc-1" {
  cidr_block = var.vpc_cidr_block

  tags = var.vpc_tags
}

resource "aws_subnet" "ops-public_subnet-1" {
  vpc_id     = aws_vpc.ops-vpc-1.id
  cidr_block = var.public_subnet_cidr_block

  tags = var.public_subnet_tags
}

resource "aws_subnet" "ops-private_subnet-2" {
  vpc_id     = aws_vpc.ops-vpc-1.id
  cidr_block = var.private_subnet_cidr_block

  tags = var.private_subnet_tags
}
