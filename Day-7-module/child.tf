module "ec2_child" {
  source = "./root"
  ami_id = "ami-0f535a71b34f2d44a" # Example AMI ID, replace with actual
  # This AMI ID is for Amazon Linux 2 in the us-east-1 region.
  instance_type     = "t3.micro"
  availability_zone = "ap-south-1b" # Example availability zone, replace with actual

}
