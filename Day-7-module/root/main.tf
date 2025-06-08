
resource "aws_instance" "linux" {
  ami               = var.ami_id

  instance_type     = var.instance_type
  associate_public_ip_address = true
  key_name          = "linux"
  //subnet_id         = aws_subnet.dev_subnet.id
  availability_zone = var.availability_zone
 // security_groups   = [aws_security_group.dev_sg.id]
 // user_data = file("httpd.sh")
 // depends_on = [ aws_ebs_volume.dev ]
 tags = {
   Name = "linux-instance"
   Environment = "dev"
 }
 
}