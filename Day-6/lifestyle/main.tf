
resource "aws_instance" "test" {
  ami               = "ami-0f535a71b34f2d44a"
  instance_type     = "t2.micro"
  key_name          = "linux"
  count = 2
  availability_zone = "ap-south-1a"
  tags = {
    Name = "aws_lifecycle-1"
  }

# lifecycle is used to controll the action of state and ec2 instance destory

 lifecycle {
   create_before_destroy = true
 }

  lifecycle {
     prevent_destroy = true
  }

lifecycle {
  ignore_changes = [ tags ]
}
 
}
