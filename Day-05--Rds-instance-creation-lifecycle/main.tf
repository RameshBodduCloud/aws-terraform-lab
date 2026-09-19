provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "Ramesh-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "Ramesh-vpc"
  }
}


resource "aws_subnet" "Ramesh-subnet-1" {
  vpc_id                  = aws_vpc.Ramesh-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Ramesh-subnet-1"
  }
}

resource "aws_subnet" "Ramesh-subnet-2" {
  vpc_id                  = aws_vpc.Ramesh-vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "Ramesh-subnet-2"
  }
}

resource "aws_security_group" "Ramesh-sg" {
  name   = "Ramesh-sg"
  vpc_id = aws_vpc.Ramesh-vpc.id

  ingress {
    description = "Allow MySQL access"
    from_port   = 3306
    to_port     = 3306
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

resource "aws_db_subnet_group" "ramesh-db-subnet-group" {
  name       = "ramesh-db-subnet-group"
  subnet_ids = [aws_subnet.Ramesh-subnet-1.id, aws_subnet.Ramesh-subnet-2.id]
  tags = {
    Name = "Ramesh-db-subnet-group"
  }
}

resource "aws_internet_gateway" "Ramesh-igw" {
  vpc_id = aws_vpc.Ramesh-vpc.id
  tags   = { Name = "Ramesh-igw" }
}

resource "aws_route_table" "Ramesh-rt" {
  vpc_id = aws_vpc.Ramesh-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Ramesh-igw.id
  }
  tags = { Name = "Ramesh-rt" }
}

resource "aws_route_table_association" "Ramesh-rt-assoc-1" {
  subnet_id      = aws_subnet.Ramesh-subnet-1.id
  route_table_id = aws_route_table.Ramesh-rt.id
}

resource "aws_route_table_association" "Ramesh-rt-assoc-2" {
  subnet_id      = aws_subnet.Ramesh-subnet-2.id
  route_table_id = aws_route_table.Ramesh-rt.id
}

resource "aws_db_instance" "ramesh-db-instance" {
  allocated_storage       = 20
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  identifier              = "rameshdb"
  db_name                 = "rameshdb"
  username                = "admin"
  password                = "Ramesh1234"
  parameter_group_name    = "default.mysql8.0"
  publicly_accessible     = true
  db_subnet_group_name    = aws_db_subnet_group.ramesh-db-subnet-group.name
  vpc_security_group_ids  = [aws_security_group.Ramesh-sg.id]
  skip_final_snapshot     = true
  backup_retention_period = 7
}

resource "aws_db_instance" "ramesh-db-replica" {
  identifier              = "rameshdb-read-replica"
  replicate_source_db     = aws_db_instance.ramesh-db-instance.arn
  instance_class          = "db.t3.micro"
  publicly_accessible     = true
  db_subnet_group_name    = aws_db_subnet_group.ramesh-db-subnet-group.name
  vpc_security_group_ids  = [aws_security_group.Ramesh-sg.id]
  skip_final_snapshot     = true
  backup_retention_period = 7
}

resource "aws_instance" "ramesh-ec2-instance" {
  ami                         = "ami-0fef201115eefe936" # Amazon Linux 2 AMI
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.Ramesh-subnet-2.id
  vpc_security_group_ids      = [aws_security_group.Ramesh-sg.id]
  associate_public_ip_address = true

lifecycle {
  prevent_destroy = true  
}

lifecycle {
  create_before_destroy = true
}

  lifecycle {
  ignore_changes = [tags]
             }

  tags = {
    Name = "Ramesh-ec2-instance-new"
  }
}

