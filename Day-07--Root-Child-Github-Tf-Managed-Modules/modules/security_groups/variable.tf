variable "sg_name" {
  description = "Name of the security group"
  type        = string
}

variable "sg_description" {
  description = "Description of the security group"
  type        = string
  default     = "Managed by Terraform"
}

variable "vpc_id" {
  description = "VPC ID where SG will be created"
  type        = string
}


output "sg_id" {
  description = "The ID of the security group"
  value       = aws_security_group.app_sg.id
}
