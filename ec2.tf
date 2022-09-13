
resource "aws_instance" "app-server_for_VPC_A_subnet_AZ1" {
  instance_type          = "t2.micro"
  ami                    = var.ami
  vpc_security_group_ids = [aws_security_group.security_group_for_VPC_A_instance.id]
  subnet_id              = aws_subnet.vpc_A_subnet_AZ1.id
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name
  key_name               = var.instance_key
  associate_public_ip_address = true
  tags = {
    Name = "app_server-for_VPC_A"
  }
}
locals {
  vpc_a_account_id = aws_vpc.vpc_A_cidr.owner_id
}



resource "aws_instance" "app-server_for_VPC_B_subnet_AZ1" {
  instance_type          = "t2.micro"
  ami                    = var.ami
  vpc_security_group_ids = [aws_security_group.security_group_for_VPC_B_instance.id]
  subnet_id              = aws_subnet.vpc_B_subnet_AZ1.id
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name
  key_name               = var.instance_key
  associate_public_ip_address = true
  tags = {
    Name = "app_server_for_VPC_B"
  }
}
locals {
  vpc_b_account_id = aws_vpc.vpc_B_cidr.owner_id
}


resource "aws_instance" "app-server_for_VPC_C_subnet_AZ1" {
  instance_type          = "t2.micro"
  ami                    = var.ami
  vpc_security_group_ids = [aws_security_group.security_group_for_VPC_C_instance.id]
  subnet_id              = aws_subnet.vpc_C_subnet_AZ1.id
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name
  key_name               = var.instance_key

  associate_public_ip_address = true
  tags = {
    Name = "app_server_for_VPC_C"
  }
}
locals {
  vpc_c_account_id = aws_vpc.vpc_C_cidr.owner_id
}