variable "backend_region" {
    type = string
    default = "ap-south-1"
  
}

variable "backend_bucketName" {
    type = string
    default = "aws-s3-bucket-reg1"
  
}

variable "backend_key" {
    type = string
    default = "terraform.tfstate"
  
}