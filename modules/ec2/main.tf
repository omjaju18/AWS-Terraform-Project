# Get the latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Create EC2 Instance
resource "aws_instance" "main" {
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  key_name               = var.key_pair_name

  # Root volume configuration
  root_block_device {
    volume_type           = "gp2"
    volume_size           = var.root_volume_size
    delete_on_termination = true
    encrypted             = true

    tags = {
      Name = "${var.project_name}-${var.environment}-root-volume"
    }
  }

  # Enable detailed monitoring
  monitoring = true

  # User data script - runs on instance startup
  user_data = base64encode(var.user_data_script)

  # Associate public IP on launch
  associate_public_ip_address = var.enable_public_ip

  tags = merge(
    var.tags,
    {
      Name        = "${var.project_name}-${var.environment}-instance"
      Environment = var.environment
      Type        = "WebServer"
    }
  )

  lifecycle {
    ignore_changes = [ami]
  }
}


# Create or use existing key pair
resource "tls_private_key" "main" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "deployer" {
  count              = var.key_pair_name == "" ? 1 : 0
  key_name           = "${var.project_name}-${var.environment}-key"
  public_key         = tls_private_key.main.public_key_openssh

  tags = merge(
    var.tags,
    {
      Name        = "${var.project_name}-${var.environment}-key"
      Environment = var.environment
    }
  )
}