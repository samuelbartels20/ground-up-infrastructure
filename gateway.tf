# Elastic IP
resource "aws_eip" "eip_for_vpc_A_subnet_AZ1_instance" {
  vpc = true
  instance                  = aws_instance.app-server_for_VPC_A_subnet_AZ1.id
  depends_on                = [aws_internet_gateway.internet_gateway_for_VPC_A]
}

resource "aws_eip" "eip_for_vpc_B_subnet_AZ1_instance" {
  vpc = true
  instance                  = aws_instance.app-server_for_VPC_B_subnet_AZ1.id
  depends_on                = [aws_internet_gateway.internet_gateway_for_VPC_B]
}

resource "aws_eip" "eip_for_vpc_C_subnet_AZ1_instance" {
  vpc = true
  instance                  = aws_instance.app-server_for_VPC_C_subnet_AZ1.id
  depends_on                = [aws_internet_gateway.internet_gateway_for_VPC_C]
}


#Internet Gateway

resource "aws_internet_gateway" "internet_gateway_for_VPC_A" {

    vpc_id = aws_vpc.vpc_A_cidr.id

    tags = {

        Name = "internet_gateway_for_VPC_A"
 
    }

}


resource "aws_internet_gateway" "internet_gateway_for_VPC_B" {

    vpc_id = aws_vpc.vpc_B_cidr.id

    tags = {

        Name = "internet_gateway_for_VPC_B"

    }

}

resource "aws_internet_gateway" "internet_gateway_for_VPC_C" {

    vpc_id = aws_vpc.vpc_C_cidr.id

    tags = {

        Name = "internet_gateway_for_VPC_C"

    }

}