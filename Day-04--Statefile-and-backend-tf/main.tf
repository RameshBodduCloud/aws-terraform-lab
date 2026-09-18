resource "aws_vpc" "Ramesh-Vpc" {
  cidr_block = var.vpc_cidr_block
  tags       = var.vpc_tags
}

resource "aws_subnet" "Ramesh-Subnet" {
  vpc_id     = aws_vpc.Ramesh-Vpc.id
  cidr_block = var.subnet_cidr_block
  tags       = var.subnet_tags
}


resource "aws_security_group" "sg" {
  name   = "Ramesh-SG"
  vpc_id = aws_vpc.Ramesh-Vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "Ramesh-Instance-1" {
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.Ramesh-Subnet.id
  vpc_security_group_ids      = [aws_security_group.sg.id]
  associate_public_ip_address = true
  tags                        = var.instance_tags_1
}

resource "aws_instance" "Ramesh-Instance-2" {
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.Ramesh-Subnet.id
  vpc_security_group_ids      = [aws_security_group.sg.id]
  associate_public_ip_address = true
  tags                        = var.instance_tags_2
}


resource "aws_s3_bucket" "my_bucket" {
  bucket = "ramesh-terraform-state-bucket1"
  region = var.aws_region
}
