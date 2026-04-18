aws_region   = "ap-south-1"
environment  = "dev"
project_name = "terraform-aws-project"
vpc_cidr     = "10.0.0.0/16"
instance_type = "t2.micro"

tags = {
  Project     = "Terraform AWS Project"
  ManagedBy   = "Terraform"
  CreatedDate = "2026-04-14"
  Owner       = "Ommie"
  Environment = "Development"
}
