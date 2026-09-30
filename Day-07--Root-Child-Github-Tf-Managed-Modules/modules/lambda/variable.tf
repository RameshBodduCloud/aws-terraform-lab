variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "handler" {
  description = "Lambda handler (e.g. index.handler)"
  type        = string
}

variable "runtime" {
  description = "Runtime environment (e.g. python3.9, nodejs18.x)"
  type        = string
}

variable "filename" {
  description = "Path to the deployment package zip"
  type        = string
}

variable "source_code_hash" {
  description = "SHA-256 hash of the deployment package"
  type        = string
}


