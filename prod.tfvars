aws_region   = "ap-south-1"
environment  = "prod"
project_name = "terraform-aws-project"
vpc_cidr     = "10.1.0.0/16"  # Different CIDR for prod
instance_type = "t2.micro"     # Keep micro for cost control

tags = {
  Project     = "Terraform AWS Project"
  ManagedBy   = "Terraform"
  CreatedDate = "2026-04-14"
  Owner       = "Ommie"
  Environment = "Production"
}