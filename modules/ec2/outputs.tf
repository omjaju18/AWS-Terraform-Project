output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.main.id
}

output "instance_arn" {
  description = "ARN of the EC2 instance"
  value       = aws_instance.main.arn
}

output "public_ip" {
  description = "Public IP address of the instance"
  value       = aws_instance.main.public_ip
}

output "private_ip" {
  description = "Private IP address of the instance"
  value       = aws_instance.main.private_ip
}

output "instance_ami" {
  description = "AMI ID used for the instance"
  value       = aws_instance.main.ami
}

output "key_pair_name" {
  description = "Name of the key pair"
  value       = var.key_pair_name != "" ? var.key_pair_name : aws_key_pair.deployer[0].key_name
}

output "security_group_ids" {
  description = "Security group IDs attached to the instance"
  value       = aws_instance.main.vpc_security_group_ids
}