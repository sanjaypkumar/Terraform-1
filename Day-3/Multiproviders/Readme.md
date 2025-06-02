There are multiple use cases where provider alias can be used:
==============================================================

Creating resources in multiple AWS accounts in the same terraform module
Creating resources in different regions of the same AWS account. 
Creating resources in different regions of the different AWS accounts.

What is a provider? 
Providers are Terraform plugins that are used to interact with remote systems such as Docker, AWS, Azure…

provider.tf
Provider-1 for ap-south-1 (Default Provider)
provider "aws" { region = "ap-south-1" } provider "aws" { region = "ap-south-2" alias = "Hyderabad" }

main.tf
resource "aws_s3_bucket" "test" { bucket = "del-hyd-mum" } 
resource "aws_s3_bucket" "test2" { bucket = "del-hyd-mum2" provider = aws.Hyderabad }
