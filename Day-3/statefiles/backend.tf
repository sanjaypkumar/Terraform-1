terraform {
  backend "s3" {
    bucket         = var.backend_bucketName
    key            = var.backend_key
    region         =  var.backend_region
    encrypt        = true
    
  }
}