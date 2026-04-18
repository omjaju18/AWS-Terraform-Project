# 🚀 Terraform AWS Multi-Environment Infrastructure Project

**A production-ready Infrastructure-as-Code (IaC) project demonstrating AWS cloud architecture, Terraform best practices, and DevOps expertise.**

---

## 📌 Project Overview

This project demonstrates a **complete, production-grade AWS infrastructure** built entirely with **Terraform**. It showcases:

- ✅ **Modular Architecture** - Reusable components for different environments
- ✅ **Remote State Management** - S3 backend with DynamoDB locking
- ✅ **Multi-Environment Support** - Dev and Production configurations
- ✅ **Security Best Practices** - Encryption, VPC isolation, security groups
- ✅ **Infrastructure Automation** - Provisioning and configuration management
- ✅ **Professional DevOps Skills** - Production-ready code and documentation

### Project Metrics
- **23 Files** - Organized in 5 directories
- **4 Reusable Modules** - VPC, Security Groups, EC2, S3
- **27 AWS Resources** - Fully functional infrastructure
- **2 Environments** - Dev and Prod configurations
- **100% Free Tier** - Uses only AWS free tier resources

---

## 🏗️ What Was Built

This Terraform project creates a **complete VPC-based infrastructure** with:

### 1. **Network Layer**
- 1 VPC (Virtual Private Cloud) - 10.0.0.0/16
- 2 Public Subnets - For web servers, accessible from internet
- 2 Private Subnets - For databases, not directly accessible
- 1 Internet Gateway - Connects VPC to the internet
- 2 Route Tables - Control traffic flow (public & private)

### 2. **Security Layer**
- 2 Security Groups - Act as virtual firewalls
  - **Web Security Group** - Allows SSH (22), HTTP (80), HTTPS (443)
  - **Database Security Group** - Allows MySQL (3306) only from web servers
- Multiple ingress/egress rules - Control inbound/outbound traffic

### 3. **Compute Layer**
- 1 EC2 Instance (t2.micro) - Running Amazon Linux 2
- 1 Elastic IP - Static public IP address
- 1 Key Pair - For SSH authentication
- User Data Script - Auto-installs and configures Nginx

### 4. **Storage Layer**
- 1 S3 Bucket - For data storage
- Versioning Enabled - Track file changes over time
- Encryption Enabled - Secure data at rest (AES256)
- Public Access Blocked - Security best practice

---

## 🏛️ Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                        AWS Cloud                             │
│                                                              │
│  ┌────────────────────────────────────────────────────┐    │
│  │              VPC: 10.0.0.0/16                      │    │
│  │                                                    │    │
│  │  ┌──────────────────┐  ┌──────────────────────┐  │    │
│  │  │ PUBLIC SUBNET 1  │  │ PUBLIC SUBNET 2      │  │    │
│  │  │ 10.0.1.0/24      │  │ 10.0.2.0/24         │  │    │
│  │  │                  │  │                      │  │    │
│  │  │ ┌──────────────┐ │  │ ┌──────────────────┐ │  │    │
│  │  │ │  EC2 Instance  │ │  │ (available for      │  │    │
│  │  │ │ (t2.micro)   │ │  │  future instances)  │  │    │
│  │  │ │ + Nginx      │ │  │                      │  │    │
│  │  │ └──────────────┘ │  └──────────────────────┘ │  │    │
│  │  └──────────────────┘  └──────────────────────────┘  │    │
│  │           ↑                                           │    │
│  │      [IGW] ←→ Internet (0.0.0.0/0)                   │    │
│  │                                                      │    │
│  │  ┌──────────────────┐  ┌──────────────────────┐    │    │
│  │  │ PRIVATE SUBNET 1 │  │ PRIVATE SUBNET 2     │    │    │
│  │  │ 10.0.10.0/24     │  │ 10.0.11.0/24         │    │    │
│  │  │                  │  │                      │    │    │
│  │  │ (available for   │  │ (available for       │    │    │
│  │  │  databases)      │  │  databases)          │    │    │
│  │  └──────────────────┘  └──────────────────────┘    │    │
│  │                                                     │    │
│  └────────────────────────────────────────────────────┘    │
│                                                              │
│  ┌────────────────────────────────────────────────────┐    │
│  │              S3 Bucket (Storage)                   │    │
│  │  - Versioning: Enabled                            │    │
│  │  - Encryption: AES256                             │    │
│  │  - Public Access: Blocked                         │    │
│  └────────────────────────────────────────────────────┘    │
│                                                              │
└─────────────────────────────────────────────────────────────┘
```

---

## 📊 Resources Created

### Complete Resource List (27 Resources)

#### Network Resources (12)
- [x] 1 VPC
- [x] 2 Public Subnets
- [x] 2 Private Subnets
- [x] 1 Internet Gateway
- [x] 2 Route Tables (public & private)
- [x] 4 Route Table Associations

#### Security Resources (8)
- [x] 2 Security Groups (web & database)
- [x] 3 Ingress Rules (SSH, HTTP, HTTPS)
- [x] 2 Egress Rules (allow all outbound)
- [x] 1 Cross-SG rule (MySQL from web to database)

#### Compute Resources (4)
- [x] 1 EC2 Instance (t2.micro)
- [x] 1 Elastic IP
- [x] 1 Key Pair
- [x] 1 TLS Private Key (RSA 4096)

#### Storage Resources (3)
- [x] 1 S3 Bucket
- [x] S3 Versioning Configuration
- [x] S3 Encryption Configuration
- [x] S3 Public Access Block

---

## 🎯 Key Features Demonstrated

### 1. **Modular Terraform Design**
```
modules/
├── vpc/              → Reusable VPC module
├── security_groups/  → Reusable security module
├── ec2/              → Reusable compute module
└── s3/               → Reusable storage module
```
**Why it matters:** Each module is self-contained, tested independently, and reusable across projects.

### 2. **Remote State Management**
- **Backend:** S3 bucket + DynamoDB
- **Purpose:** Safely store infrastructure state
- **Benefits:**
  - Team collaboration
  - State versioning
  - State locking (prevents conflicts)
  - Disaster recovery

### 3. **Multi-Environment Support**
```
environments/
├── dev.tfvars   → Development (VPC: 10.0.0.0/16)
└── prod.tfvars  → Production (VPC: 10.1.0.0/16)
```
**Same code, different configurations** - shows professional DevOps practices.


### 4. **Infrastructure Provisioning**
```bash
#!/bin/bash
yum update -y
yum install -y nginx
systemctl start nginx
systemctl enable nginx
```
**User Data Script** automatically installs and configures Nginx on EC2 startup.

---

## 📸 Deployment Results

### Screenshot 1: Terraform Plan Output
**What it shows:** All 27 resources that will be created

<img width="806" height="109" alt="ec2" src="https://github.com/user-attachments/assets/70348aa9-a89b-41f8-bc66-728a305e6694" />


```
Terraform will perform the following actions:

Plan: 27 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + aws_region                   = "ap-south-1"
  + environment                  = "dev"
  + instance_ami                 = "ami-09d623d7034669ca5"
  + instance_id                  = (known after apply)
  + public_ip                    = (known after apply)
  + vpc_id                       = (known after apply)
  + s3_bucket_id                 = (known after apply)
  ...and more
```

---

### Screenshot 2: EC2 Instance Running
**AWS Console shows:**
- Instance Name: `terraform-aws-project-dev-instance`
- Instance ID: `i-0814498fcf9e645da`
- **Status: ✅ Running**
- Instance Type: `t2.micro`
- Health Checks: `2/2 checks passed`
- Region: `ap-south-1a`

<img width="806" height="109" alt="ec2" src="https://github.com/user-attachments/assets/4b92bf9c-3f4d-4498-881e-299a24be53b8" />

---

### Screenshot 3: S3 Bucket Created
**AWS Console shows:**
- Bucket Name: `terraform-aws-project-dev-bucket`
- Region: `Asia Pacific (Mumbai) ap-south-1`
- **Status: ✅ Available**
- Creation Date: `April 14, 2026, 19:51:09`

<img width="809" height="167" alt="VPC" src="https://github.com/user-attachments/assets/838c8c0e-59ea-4ad2-a4dc-bb707531b6c3" />


---

### Screenshot 4: VPC Created
**AWS Console shows:**
- VPC Name: `terraform-aws-project-dev-vpc`
- VPC ID: `vpc-0f9ef89e234730ccf`
- **Status: ✅ Available**
- IPv4 CIDR: `10.0.0.0/16`

<img width="809" height="167" alt="VPC" src="https://github.com/user-attachments/assets/359d36b4-5c65-4d1a-b436-d8bf6f351b25" />


---

### Screenshot 5: Terraform Outputs
**Console output shows:**

```
Outputs:

instance_id = "i-09977a00510c3fe6f"
instance_arn = "arn:aws:ec2:ap-south-1:872515274000:instance/i-09977a00510c3fe6f"
public_ip = "65.0.204.158"
private_ip = "10.0.1.50"
vpc_cidr = "10.0.0.0/16"
vpc_id = "vpc-05c6b7aae840b4992"

public_subnet_ids = [
  "subnet-03fd164fea26ea581",
  "subnet-05540233f6a434a0"
]

private_subnet_ids = [
  "subnet-0d04d7badb8962578",
  "subnet-0c58366a96ce1fded"
]

s3_bucket_arn = "arn:aws:s3:::terraform-aws-project-dev-bucket"
s3_bucket_region = "ap-south-1"
```

<img width="599" height="422" alt="output" src="https://github.com/user-attachments/assets/dd18078f-8d75-436d-a762-ca13bca10b04" />


---


## 💻 Technologies Used

| Technology | Version | Purpose |
|-----------|---------|---------|
| **Terraform** | >= 1.0 | Infrastructure-as-Code |
| **AWS** | Latest | Cloud provider |
| **Amazon Linux 2** | Latest | EC2 OS |
| **Nginx** | Latest | Web server |
| **DynamoDB** | On-demand | State locking |
| **S3** | Latest | State storage & data |

---

## 🚀 Quick Start

### 1. Clone or Extract Project
```bash
unzip terraform-aws-project.zip
cd terraform-aws-project
```

### 2. Configure AWS Credentials
```bash
aws configure
# Enter your AWS Access Key ID
# Enter your AWS Secret Access Key
# Default region: ap-south-1
# Default output: json
```

### 3. Create S3 Backend (One-time)
```bash
# Create S3 bucket for state
aws s3api create-bucket \
  --bucket terraform-state-ommie-portfolio \
  --region ap-south-1 \
  --create-bucket-configuration LocationConstraint=ap-south-1

# Enable versioning
aws s3api put-bucket-versioning \
  --bucket terraform-state-ommie-portfolio \
  --versioning-configuration Status=Enabled

# Create DynamoDB table for locking
aws dynamodb create-table \
  --table-name terraform-locks \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST \
  --region ap-south-1
```

### 4. Initialize Terraform
```bash
terraform init
```

### 5. Validate & Plan
```bash
terraform validate
terraform plan -var-file="terraform.tfvars"
```

### 6. Deploy Infrastructure
```bash
terraform apply -var-file="terraform.tfvars"
```

### 7. View Outputs
```bash
terraform output
```

### 8. Destroy Infrastructure (to stop charges)
```bash
terraform destroy -var-file="terraform.tfvars"
```

---

## 📂 Project Structure

```
terraform-aws-project/
│
├── 📄 Core Configuration
│   ├── backend.tf              # Remote state (S3 + DynamoDB)
│   ├── providers.tf            # AWS provider setup
│   ├── variables.tf            # Root-level variables
│   ├── main.tf                 # Module calls
│   └── outputs.tf              # Output definitions
│
├── 📁 Modules (Reusable Components)
│   ├── vpc/
│   │   ├── main.tf             # VPC, Subnets, IGW, Routes
│   │   ├── variables.tf        # VPC variables
│   │   └── outputs.tf          # VPC outputs
│   │
│   ├── security_groups/
│   │   ├── main.tf             # Security groups & rules
│   │   ├── variables.tf        # SG variables
│   │   └── outputs.tf          # SG outputs
│   │
│   ├── ec2/
│   │   ├── main.tf             # EC2, Key Pair, EIP
│   │   ├── variables.tf        # EC2 variables
│   │   └── outputs.tf          # EC2 outputs
│   │
│   └── s3/
│       ├── main.tf             # S3, Versioning, Encryption
│       ├── variables.tf        # S3 variables
│       └── outputs.tf          # S3 outputs
│
├── 📁 Environments
│   ├── dev.tfvars              # Development config
│   └── prod.tfvars             # Production config
│
└── 📄 Documentation
    ├── README.md               # This file
    ├── QUICKSTART.md           # Quick reference
    └── .gitignore              # Git ignore rules
```

## 📚 Learning Resources

- [Terraform Documentation](https://www.terraform.io/docs)
- [AWS Provider Reference](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS VPC Guide](https://docs.aws.amazon.com/vpc/)
- [Terraform Best Practices](https://www.terraform.io/cloud-docs/recommended-practices)

---
