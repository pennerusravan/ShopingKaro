variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project prefix for resources"
  type        = string
  default     = "shopingkaro"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "ecs_desired_count" {
  type    = number
  default = 1
}

variable "vpc_id" {
  description = "ID of an existing VPC to use for resources"
  type        = string
  default     = ""
}

variable "public_subnet_ids" {
  description = "List of subnet IDs to use for public resources (ALB)"
  type        = list(string)
  default     = []
}

variable "private_subnet_ids" {
  description = "List of subnet IDs to use for private resources (ECS, DB)"
  type        = list(string)
  default     = []
}

variable "acm_certificate_arn" {
  description = "ARN of an existing ACM certificate for the ALB HTTPS listener (must be in the same region)"
  type        = string
  default     = ""
}

variable "docdb_username" {
  description = "Username for DocumentDB admin user"
  type        = string
  sensitive   = true
}

variable "docdb_password" {
  description = "Password for DocumentDB admin user"
  type        = string
  sensitive   = true
}