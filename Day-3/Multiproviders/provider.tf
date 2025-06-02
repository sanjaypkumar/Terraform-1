terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.26.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "ap-south-1"
}

provider "aws" {
  region = "ap-south-2"
  alias  = "Hyderabad"
}
