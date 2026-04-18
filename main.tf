module "vpc" {
  source = "./modules/vpc"
  
  vpc_cidr     = var.vpc_cidr
  environment  = var.environment
  project_name = var.project_name
  tags         = var.tags
}


# Call the Security Groups module
module "security_groups" {
  source = "./modules/security_groups"

  vpc_id       = module.vpc.vpc_id
  environment  = var.environment
  project_name = var.project_name
  tags         = var.tags
  
  allowed_ssh_cidr   = ["0.0.0.0/0"]   # Warning: Open to world - change in production
  allowed_http_cidr  = ["0.0.0.0/0"]
  allowed_https_cidr = ["0.0.0.0/0"]
}

module "ec2" {
  source = "./modules/ec2"

  instance_type = var.instance_type
  environment   = var.environment
  project_name  = var.project_name

  subnet_id = module.vpc.public_subnet_ids[0]
  # Attach security group from SG module
  security_group_ids = [
    module.security_groups.web_security_group_id
  ]

  key_pair_name = ""

  # User data (simple nginx setup)
  user_data_script = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y nginx
    systemctl start nginx
    systemctl enable nginx
  EOF

  tags = var.tags
}


module "s3" {
  source = "./modules/s3"
  environment   = var.environment
  project_name  = var.project_name
  bucket_name   = "${var.project_name}-${var.environment}-bucket"
  tags = var.tags

}