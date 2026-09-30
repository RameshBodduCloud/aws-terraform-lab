resource "aws_vpc" "Ramesh-vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_tag
  }
}

resource "aws_subnet" "Ramesh-subnet-1" {
  vpc_id                  = aws_vpc.Ramesh-vpc.id
  cidr_block              = var.subnet_cidr_1
  tags = {
    Name = var.subnet_tag_1
  }
}
