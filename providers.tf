terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  cloud {
    organization = "Ommie"

    workspaces {
      name = terraform.workspace
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}