resource "aws_instance" "web" {
  ami           = "ami-0f340b1771dc25029"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-1"
  }
}

resource "aws_s3_bucket" "test1" {
  bucket = "aws_s3_bucket_reg1"

  
}

resource "aws_s3_bucket" "test2" {
    bucket = "aws_s3_bucket_reg2"
  provider = aws.N.Virginia
}