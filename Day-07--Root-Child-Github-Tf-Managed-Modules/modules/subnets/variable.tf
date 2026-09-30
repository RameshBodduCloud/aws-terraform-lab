variable "subnet_cidr" {
  description = "The CIDR block for the subnet"
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "The VPC ID where subnets will be created"
  type        = string
}

variable "availability_zone" {
  description = "The availability zone for the subnet"
  type        = string
  default     = ""
}