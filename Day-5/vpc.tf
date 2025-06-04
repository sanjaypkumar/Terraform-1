# Create VPC

resource "aws_vpc" "dev_vpc" {
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "dev-1"
  }

}

# Create Subnet

resource "aws_subnet" "dev_subnet" {
  vpc_id            = aws_vpc.dev_vpc.id
  cidr_block        = "10.0.0.0/25"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "dev-public-subnet"
  }

}

# Create Internet Gateway and attached to VPC 

resource "aws_internet_gateway" "dev_ig" {
  vpc_id = aws_vpc.dev_vpc.id


}

# Create Route Table and # Create Route in Route Table for Internet Access

resource "aws_route_table" "dev_RT" {
  vpc_id = aws_vpc.dev_vpc.id

  # Create Route in Route Table for Internet Access
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev_ig.id
  }

}

# Associate Route Table with Subnet

resource "aws_route_table_association" "dev_rt_ass" {
  subnet_id      = aws_subnet.dev_subnet.id
  route_table_id = aws_route_table.dev_RT.id

}

# Create Security Group in the VPC with port 80, 22 as inbound open

resource "aws_security_group" "dev_sg" {
  name   = "dev_sg_allow"
  vpc_id = aws_vpc.dev_vpc.id

  ingress {
    description = "TLS Support from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TLS Support from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
# Create EC2 Instance in respective new vpc, new subnet created above with a static key pair, associate Security group created earlier

