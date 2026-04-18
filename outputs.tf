output "aws_region" {
  description = "AWS region being used"
  value       = var.aws_region
}

output "environment" {
  description = "Environment name"
  value       = var.environment
}

output "project_name" {
  description = "Project name"
  value       = var.project_name
}

# VPC Outputs
output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr" {
  description = "CIDR block of the VPC"
  value       = module.vpc.vpc_cidr
}

output "public_subnet_ids" {
  description = "IDs of public subnets"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of private subnets"
  value       = module.vpc.private_subnet_ids
}

output "internet_gateway_id" {
  description = "ID of Internet Gateway"
  value       = module.vpc.internet_gateway_id
}

# Security Groups Outputs
output "web_security_group_id" {
  description = "ID of the web security group"
  value       = module.security_groups.web_security_group_id
}

output "web_security_group_name" {
  description = "Name of the web security group"
  value       = module.security_groups.web_security_group_name
}

output "database_security_group_id" {
  description = "ID of the database security group"
  value       = module.security_groups.database_security_group_id
}

output "database_security_group_name" {
  description = "Name of the database security group"
  value       = module.security_groups.database_security_group_name
}

# EC2 Instance Outputs
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.ec2.instance_id
}

output "instance_arn" {
  description = "ARN of the EC2 instance"
  value       = module.ec2.instance_arn
}

output "public_ip" {
  description = "Public IP address of the instance"
  value       = module.ec2.public_ip
}

output "private_ip" {
  description = "Private IP address of the instance"
  value       = module.ec2.private_ip
}

output "instance_ami" {
  description = "AMI ID used for the instance"
  value       = module.ec2.instance_ami
}

output "security_group_ids" {
  description = "Security group IDs attached to the instance"
  value       = module.ec2.security_group_ids
}

# S3 Bucket Outputs
output "s3_bucket_id" {
  description = "Name of the S3 bucket"
  value       = module.s3.bucket_id
}

output "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = module.s3.bucket_arn
}

output "s3_bucket_region" {
  description = "Region of the S3 bucket"
  value       = module.s3.bucket_region
}