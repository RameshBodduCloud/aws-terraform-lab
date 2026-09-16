variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "Ramesh-Vpc-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_name" {
  description = "Name of the public subnet"
  type        = string
  default     = "Ramesh-Public-Subnet-1"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.0.0/24"
}

variable "private_subnet_name" {
  description = "Name of the private subnet"
  type        = string
  default     = "Ramesh-private-Subnet-1"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "internet_gateway_name" {
  description = "Name of the internet gateway"
  type        = string
  default     = "Ramesh-Igw"
}

variable "public_route_table_name" {
  description = "Name of the public route table"
  type        = string
  default     = "Ramesh-PS-RT"
}

variable "private_route_table_name" {
  description = "Name of the private route table"
  type        = string
  default     = "Ramesh-Private-RT"
}

variable "route_table_cidr" {
  description = "CIDR block for default route"
  type        = string
  default     = "0.0.0.0/0"
}

variable "security_group_name" {
  description = "Name of the security group"
  type        = string
  default     = "Ramesh-SG"
}

variable "security_group_description" {
  description = "Description for the security group"
  type        = string
  default     = "Allow SSH and HTTP inbound traffic"
}

variable "sg_cidr" {
  description = "CIDR block for security group ingress and egress"
  type        = string
  default     = "0.0.0.0/0"
}

variable "key_pair_name" {
  description = "Name of the key pair"
  type        = string
  default     = "Ramesh-Key-Pair"
}

variable "public_key_path" {
  description = "Path to the public key file inside the module"
  type        = string
  default     = "id_rsa.pub"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
  default     = "ami-0413c9aa513b49c44"
}

variable "instance_type" {
  description = "Type of the EC2 instances"
  type        = string
  default     = "t3.micro"
}

variable "bastion_host_name" {
  description = "Name for the bastion host"
  type        = string
  default     = "Bastion-Host"
}

variable "private_instance_name" {
  description = "Name for the private instance"
  type        = string
  default     = "Ramesh-Private-Instance"
}

variable "nat_gateway_name" {
  description = "Name for the NAT gateway"
  type        = string
  default     = "Ramesh-Nat-Gateway"
}

variable "vpc_tags" {
  description = "Tags for the VPC"
  type        = map(string)
  default = {
    Name = "Ramesh-Vpc-1"
  }
}

variable "public_subnet_tags" {
  description = "Tags for the public subnet"
  type        = map(string)
  default = {
    Name = "Ramesh-Public-Subnet-1"
  }
}

variable "private_subnet_tags" {
  description = "Tags for the private subnet"
  type        = map(string)
  default = {
    Name = "Ramesh-private-Subnet-1"
  }
}

variable "nat_gateway_tags" {
  description = "Tags for the NAT gateway"
  type        = map(string)
  default = {
    Name = "Ramesh-Nat-Gateway"
  }
}

variable "route_table_tags" {
  description = "Tags for the private route table"
  type        = map(string)
  default = {
    Name = "Ramesh-Private-RT"
  }
}

variable "bastion_host_tags" {
  description = "Tags for the bastion host"
  type        = map(string)
  default = {
    Name = "Bastion-Host"
  }
}

variable "private_instance_tags" {
  description = "Tags for the private instance"
  type        = map(string)
  default = {
    Name = "Ramesh-Private-Instance"
  }
}

variable "security_group_tags" {
  description = "Tags for the security group"
  type        = map(string)
  default = {
    Name = "Ramesh-SG"
  }
}

variable "key_pair_tags" {
  description = "Tags for the key pair"
  type        = map(string)
  default = {
    Name = "Ramesh-Key-Pair"
  }
}