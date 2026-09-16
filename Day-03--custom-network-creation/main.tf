resource "aws_vpc" "Ramesh-Vpc-1" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "Ramesh-Public-Subnet-1" {
  vpc_id                  = aws_vpc.Ramesh-Vpc-1.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_subnet_tags["Name"]
  }
}


resource "aws_internet_gateway" "Ramesh-Igw" {
  vpc_id = aws_vpc.Ramesh-Vpc-1.id
  tags = {
    Name = var.internet_gateway_name
  }
}

resource "aws_route_table" "Ramesh-PS-RT" {
  vpc_id = aws_vpc.Ramesh-Vpc-1.id
  route {
    cidr_block = var.route_table_cidr
    gateway_id = aws_internet_gateway.Ramesh-Igw.id
  }
}

resource "aws_route_table_association" "Ramesh-PS-RT-Association" {
  subnet_id      = aws_subnet.Ramesh-Public-Subnet-1.id
  route_table_id = aws_route_table.Ramesh-PS-RT.id
}

resource "aws_security_group" "Ramesh-SG" {
  name        = var.security_group_name
  description = "Allow SSH and HTTP inbound traffic"
  vpc_id      = aws_vpc.Ramesh-Vpc-1.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
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

resource "aws_key_pair" "Ramesh-Key-Pair" {
  key_name   = var.key_pair_name
  public_key = file("${path.module}/${var.public_key_path}")
}

resource "aws_instance" "Bastion-Host" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.Ramesh-Public-Subnet-1.id
  key_name               = aws_key_pair.Ramesh-Key-Pair.key_name
  vpc_security_group_ids = [aws_security_group.Ramesh-SG.id]

  tags = {
    Name = var.bastion_host_name
  }
}


####Private custom network creation
resource "aws_subnet" "Ramesh-private-Subnet-1" {
  vpc_id     = aws_vpc.Ramesh-Vpc-1.id
  cidr_block = var.private_subnet_cidr

  tags = {
    Name = var.private_subnet_name
  }
}

resource "aws_eip" "Ramesh-Nat-EIP" {
  domain = "vpc"
}


resource "aws_nat_gateway" "Ramesh-Nat-Gateway" {
  allocation_id = aws_eip.Ramesh-Nat-EIP.id
  subnet_id     = aws_subnet.Ramesh-Public-Subnet-1.id
  tags = {
    Name = var.nat_gateway_name
  }
}

resource "aws_route_table" "Ramesh-Private-RT" {
  vpc_id = aws_vpc.Ramesh-Vpc-1.id

  route {
    cidr_block     = var.route_table_cidr
    nat_gateway_id = aws_nat_gateway.Ramesh-Nat-Gateway.id
  }
}

resource "aws_route_table_association" "Ramesh-Private-RT-Association" {
  subnet_id      = aws_subnet.Ramesh-private-Subnet-1.id
  route_table_id = aws_route_table.Ramesh-Private-RT.id
}

resource "aws_instance" "Ramesh-Private-Instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.Ramesh-private-Subnet-1.id
  key_name               = aws_key_pair.Ramesh-Key-Pair.key_name
  vpc_security_group_ids = [aws_security_group.Ramesh-SG.id]

  tags = {
    Name = var.private_instance_name
  }
}


output "Bastion-Host-Public-IP" {
  value = aws_instance.Bastion-Host.public_ip
}

output "Private-Instance-Private-IP" {
  value = aws_instance.Ramesh-Private-Instance.private_ip
}