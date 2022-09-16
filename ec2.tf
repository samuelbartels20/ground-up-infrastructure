
resource "aws_instance" "app-server_for_VPC_A_subnet_AZ1" {
  instance_type          = var.instance_class
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
  instance_type          = var.instance_class
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
  instance_type          = var.instance_class
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


resource "aws_instance" "app-server_for_OnPremVPC_private_subnet" {
  instance_type          = var.instance_class
  ami                    = var.ami
  vpc_security_group_ids = [aws_security_group.security_group_for_OnPremVPC_private_subnet.id]
  subnet_id              = aws_subnet.OnPremVpc_private_subnet.id
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name
  key_name               = var.instance_key

  associate_public_ip_address = false
  tags = {
    Name = "app-server_for_OnPremVPC_private_subnet"
  }
}
locals {
  app-server_for_OnPremVPC_private_subnet = aws_vpc.OnPremVpc.owner_id
}

resource "aws_instance" "app-server_for_OnPremVPC_public_subnet" {
  instance_type          = var.instance_class
  ami                    = var.ami
  vpc_security_group_ids = [aws_security_group.security_group_for_OnPremVPC_public_subnet.id]
  subnet_id              = aws_subnet.OnPremVpc_public_subnet.id
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name
  key_name               = var.instance_key

  associate_public_ip_address = false
  tags = {
    Name = "app-server_for_OnPremVPC_public_subnet"
  }
}
locals {
  app-server_for_OnPremVPC_public_subnet = aws_vpc.OnPremVpc.owner_id
}



resource "aws_instance" "app-server_for_OnPremVPC" {
  instance_type          = var.instance_class
  ami                    = var.ami
  vpc_security_group_ids = [aws_security_group.security_group_for_OnPremVPC_private_subnet.id]
  subnet_id              = aws_subnet.OnPremVpc_private_subnet.id
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name
  key_name               = var.instance_key

  associate_public_ip_address = false
  tags = {
    Name = "app-server_for_OnPremVPC"
  }
}
locals {
  app-server_for_OnPremVPC = aws_vpc.OnPremVpc.owner_id
}


resource "aws_instance" "dns-server_for_OnPremVPC" {
  instance_type          = var.instance_class
  ami                    = var.ami
  vpc_security_group_ids = [aws_security_group.security_group_for_OnPremVPC_private_subnet.id]
  subnet_id              = aws_subnet.OnPremVpc_private_subnet.id
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name
  key_name               = var.instance_key

  associate_public_ip_address = false
  tags = {
    Name = "dns-server_for_OnPremVPC"
  }
}
locals {
  dns-server_for_OnPremVPC = aws_vpc.OnPremVpc.owner_id
}
