#data source to created dynamic linux image
data "aws_ami" "amzlinux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

# Create EC2 Instance in respective new vpc, new subnet created above with a static key pair, associate Security group created # earlier

resource "aws_instance" "linux" {
  ami                         = data.aws_ami.amzlinux.id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = "linux"
  subnet_id                   = aws_subnet.dev_subnet.id
  availability_zone           = "ap-south-1a"
  security_groups             = [aws_security_group.dev_sg.id]
  user_data                   = file("httpd.sh")
  depends_on                  = [aws_ebs_volume.dev]
}

# creating ebs volume in the same availabilty zone where as ec2 instance created

resource "aws_ebs_volume" "dev" {

  availability_zone = "ap-south-1a"
  size              = 8
  tags = {
    Name = "dev_ebs_additional_volume"
  }
}

# attach the ebs volume to the ec2 instance 

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.dev.id
  instance_id = aws_instance.linux.id

}
