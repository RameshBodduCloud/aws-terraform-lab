resource "aws_subnet" "Ramesh-subnet-1" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr
  availability_zone       = var.availability_zone
}

output "subnet_id" {
  value = aws_subnet.Ramesh-subnet-1.id
}