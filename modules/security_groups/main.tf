# Security Group for Web Servers
resource "aws_security_group" "web" {
  name        = "${var.project_name}-${var.environment}-web-sg"
  description = "Security group for web servers"
  vpc_id      = var.vpc_id

  tags = merge(
    var.tags,
    {
      Name        = "${var.project_name}-${var.environment}-web-sg"
      Environment = var.environment
      Type        = "Web"
    }
  )
}

# Inbound Rule: SSH (Port 22)
resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.web.id
  description       = "SSH access from allowed CIDRs"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  cidr_ipv4         = var.allowed_ssh_cidr[0]

  tags = {
    Name = "ssh-inbound"
  }
}

# Inbound Rule: HTTP (Port 80)
resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.web.id
  description       = "HTTP access from internet"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  cidr_ipv4         = var.allowed_http_cidr[0]

  tags = {
    Name = "http-inbound"
  }
}

# Inbound Rule: HTTPS (Port 443)
resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.web.id
  description       = "HTTPS access from internet"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  cidr_ipv4         = var.allowed_https_cidr[0]

  tags = {
    Name = "https-inbound"
  }
}

# Outbound Rule: Allow ALL (Default behavior, but explicit)
resource "aws_vpc_security_group_egress_rule" "allow_all" {
  security_group_id = aws_security_group.web.id
  description       = "Allow all outbound traffic"
  from_port         = 0
  to_port           = 65535
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"

  tags = {
    Name = "allow-all-outbound"
  }
}

# Security Group for Databases (Internal only)
resource "aws_security_group" "database" {
  name        = "${var.project_name}-${var.environment}-db-sg"
  description = "Security group for databases (private)"
  vpc_id      = var.vpc_id

  tags = merge(
    var.tags,
    {
      Name        = "${var.project_name}-${var.environment}-db-sg"
      Environment = var.environment
      Type        = "Database"
    }
  )
}

# Inbound Rule: MySQL (Port 3306) from Web SG only
resource "aws_vpc_security_group_ingress_rule" "mysql_from_web" {
  security_group_id            = aws_security_group.database.id
  description                  = "MySQL access from web servers only"
  from_port                    = 3306
  to_port                      = 3306
  ip_protocol                  = "tcp"
  referenced_security_group_id = aws_security_group.web.id

  tags = {
    Name = "mysql-from-web"
  }
}

# Outbound Rule for Database: Allow ALL
resource "aws_vpc_security_group_egress_rule" "db_allow_all" {
  security_group_id = aws_security_group.database.id
  description       = "Allow all outbound traffic"
  from_port         = 0
  to_port           = 65535
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"

  tags = {
    Name = "allow-all-outbound"
  }
}