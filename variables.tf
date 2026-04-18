variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "ap-south-1"
}

variable "environment" {
  description = "Environment name (dev, prod, staging, etc.)"
  type        = string
  default     = "dev"
  
  validation {
    condition     = contains(["dev", "prod", "staging"], var.environment)
    error_message = "Environment must be 'dev', 'prod', or 'staging'."
  }
}

variable "project_name" {
  description = "Project name to be used as a prefix for resource names"
  type        = string
  default     = "terraform-aws-project"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_type" {
  description = "EC2 instance type (free tier: t2.micro)"
  type        = string
  default     = "t3.micro"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default = {
    Project     = "Terraform AWS Project"
    ManagedBy   = "Terraform"
    CreatedDate = "2026-04-14"
  }
}