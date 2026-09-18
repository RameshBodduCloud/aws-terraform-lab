variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "vpc cidr block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "subnet cidr block"
  type        = string
  default     = "10.0.1.0/24"
}

variable "instance_ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0bd3fbcdc633a1b1a"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t3.micro"
}

variable "vpc_tags" {
  description = "Tags for the VPC"
  type        = map(string)
  default = {
    Name = "Ramesh-Vpc"
  }
}

variable "subnet_tags" {
  description = "Tags for the Subnet"
  type        = map(string)
  default = {
    Name = "Ramesh-Subnet"
  }
}

variable "security_group_tags" {
  description = "Tags for the Security Group"
  type        = map(string)
  default = {
    Name = "Ramesh-SG"
  }
}

variable "instance_tags_1" {
  description = "Tags for the first EC2 instance"
  type        = map(string)
  default = {
    Name = "Ramesh-Instance-1"
  }
}

variable "instance_tags_2" {
  description = "Tags for the second EC2 instance"
  type        = map(string)
  default = {
    Name = "Ramesh-Instance-2"
  }
}