variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_1" {
  description = "CIDR block for the first subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "vpc_tag" {
  description = "Tag for the VPC"
  type        = string
  default     = "Ramesh-vpc"
}

variable "subnet_tag_1" {
  description = "Tag for the first subnet"
  type        = string
  default     = "Ramesh-subnet-1"
}