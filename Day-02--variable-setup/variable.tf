variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/24"
}

variable "vpc_tags" {
  description = "Tags for the VPC"
  default = {
    Name = "ops-vpc-1"
  }
}

variable "public_subnet_cidr_block" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = "10.0.0.0/26"

}
variable "public_subnet_tags" {
  description = "Tags for the public subnet"
  default = {
    Name = "ops-public_subnet-1"
  }
}

variable "private_subnet_cidr_block" {
  description = "The CIDR block for the private subnet"
  type        = string
  default     = "10.0.0.64/26"
}

variable "private_subnet_tags" {
  description = "Tags for the private subnet"
  default = {
    Name = "ops-private_subnet-2"
  }
}