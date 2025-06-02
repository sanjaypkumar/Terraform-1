terraform {
  backend "s3" {
    bucket         = "aws-s3-bucket-reg1"
    key            = "terraform.tfstate"
    region = "ap-south-1"
    encrypt        = true
    
  }
}