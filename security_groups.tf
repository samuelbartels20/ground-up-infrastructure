resource "aws_security_group" "security_group_for_VPC_A_instance" {
  name        = "allow_web_access"
  description = "allow inbound traffic"
  vpc_id      = aws_vpc.vpc_A_cidr.id

  ingress {
    from_port   = "0"
    to_port     = "65535"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
     ipv6_cidr_blocks = ["::/0"]
    from_port   = "0"
    protocol    = "-1"
    to_port     = "0"
  }
  tags = {
    "Name" = "EC2_instance_for_VPC_A_subnet_AZ1"
  }
}



resource "aws_security_group" "security_group_for_VPC_B_instance" {
  name        = "allow_web_access"
  description = "allow inbound traffic"
  vpc_id      = aws_vpc.vpc_B_cidr.id

  ingress {
    from_port   = "0"
    to_port     = "65535"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    from_port   = "0"
    protocol    = "-1"
    to_port     = "0"
  }
  tags = {
    "Name" = "EC2_instance_for_VPC_B_subnet_AZ1"
  }
}


resource "aws_security_group" "security_group_for_VPC_C_instance" {
  name        = "allow_web_access"
  description = "allow inbound traffic"
  vpc_id      = aws_vpc.vpc_C_cidr.id

  ingress {
    from_port   = "0"
    to_port     = "65535"
    protocol    = "all"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
     ipv6_cidr_blocks = ["::/0"]
    from_port   = "0"
    protocol    = "-1"
    to_port     = "0"
  }
  tags = {
    "Name" = "EC2_instance_for_VPC_C_subnet_AZ1"
  }
}