# Create a VPC A

resource "aws_vpc" "vpc_A_cidr" {

    cidr_block = var.vpc_A_cidr
    enable_dns_hostnames = true

    tags = {

    Name = "vpc A"

    }

}

# Create a VPC B
resource "aws_vpc" "vpc_B_cidr" {
  cidr_block = var.vpc_B_cidr
  enable_dns_hostnames = true


  tags = {

    Name = "vpc B"

    }
}


# Create a VPC C
resource "aws_vpc" "vpc_C_cidr" {
  cidr_block = var.vpc_C_cidr
  enable_dns_hostnames = true


  tags = {

    Name = "vpc C"

    }
}