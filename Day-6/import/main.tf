# let suppose we have created resource ex ec2 by manually by using import
# we can create script in desired state
# import is used to migrate the code
# exammple: manually we created ec2 instacne later we want to migrate manual process to infrastructure as a code (Iac) Terraform

resource "aws_instance" "import" {

  ami = "ami-0f535a71b34f2d44a"
  instance_type = "t3.micro"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "ec2_import"
  }
}
