variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "environment" {
  description = "Environment name (dev, prod, staging)"
  type        = string
}

variable "project_name" {
  description = "Project name for resource naming"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where EC2 instance will be launched"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs to attach to the instance"
  type        = list(string)
}

variable "key_pair_name" {
  description = "Name of the key pair for SSH access"
  type        = string
}

variable "enable_public_ip" {
  description = "Enable public IP assignment"
  type        = bool
  default     = true
}

variable "root_volume_size" {
  description = "Root volume size in GB"
  type        = number
  default     = 20
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "user_data_script" {
  description = "User data script to run on instance startup"
  type        = string
  default     = ""
}