terraform {
  backend "s3" {
    bucket         = "terraform-state-ommie-portfolio"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
