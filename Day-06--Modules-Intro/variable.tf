variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = ""
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = ""
}

variable "subnet_cidr_1" {
  description = "CIDR block for the first subnet"
  type        = string
  default     = ""
}

variable "vpc_tag" {
  description = "Tag for the VPC"
  type        = string
  default     = ""
}

variable "subnet_tag_1" {
  description = "Tag for the first subnet"
  type        = string
  default     = ""
}