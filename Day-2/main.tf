resource "aws_instance" "web" {
  ami           = "ami-0f340b1771dc25029
"
  instance_type = "t3.micro"

  tags = {
    Name = "Terraform-1"
  }
}

resource "aws_s3_bucket" "example" {
  bucket = ""

  
}