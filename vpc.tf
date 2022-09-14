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

resource "aws_vpc_peering_connection" "vpc_A_to_VPC_B" {
  peer_owner_id = data.aws_caller_identity.current.account_id
  peer_vpc_id   = aws_vpc.vpc_B_cidr.id
  vpc_id        = aws_vpc.vpc_A_cidr.id
  auto_accept   = true
}

resource "aws_vpc_peering_connection" "vpc_A_to_VPC_C" {
  peer_owner_id = data.aws_caller_identity.current.account_id
  peer_vpc_id   = aws_vpc.vpc_C_cidr.id
  vpc_id        = aws_vpc.vpc_A_cidr.id
  auto_accept   = true
}
