resource "aws_route_table" "rt_for_VPC_A" {

    vpc_id = aws_vpc.vpc_A_cidr.id

    route {

    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.internet_gateway_for_VPC_A.id

    }

    tags = {

        Name = "rt_for_VPC_A"

    }

}

resource "aws_route_table" "rt_for_VPC_B" {

    vpc_id = aws_vpc.vpc_B_cidr.id

    route {

    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.internet_gateway_for_VPC_B.id

    }

    tags = {

        Name = "rt_for_VPC_B"

    }

}

resource "aws_route_table" "rt_for_VPC_C" {

    vpc_id = aws_vpc.vpc_C_cidr.id

    route {

    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.internet_gateway_for_VPC_C.id

    }

    tags = {

        Name = "rt_for_VPC_C"

    }

}

resource "aws_route_table" "public_rt_for_OnPremVPC" {

    vpc_id = aws_vpc.OnPremVpc.id

    route {

    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.internet_gateway_for_OnPremVPC.id

    }

    tags = {

        Name = "public_rt_for_OnPremVPC"

    }

}

resource "aws_route_table" "nat_gateway_rt_for_OnPremVPC" {

    vpc_id = aws_vpc.OnPremVpc.id

    route {

    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.internet_gateway_for_OnPremVPC.id

    }

    tags = {

        Name = "nat_gateway_rt_for_OnPremVPC"

    }

}


# #Associate Public Route Table to Public Subnets

resource "aws_route_table_association" "rt_association_for_VPC_A_subnet_AZ1" {

    subnet_id = aws_subnet.vpc_A_subnet_AZ1.id

    route_table_id = aws_route_table.rt_for_VPC_A.id

}

resource "aws_route_table_association" "rt_association_for_VPC_A_subnet_AZ2" {

    subnet_id = aws_subnet.vpc_A_subnet_AZ2.id

    route_table_id = aws_route_table.rt_for_VPC_A.id

}

resource "aws_route_table_association" "rt_association_for_VPC_B_subnet_AZ1" {

    subnet_id = aws_subnet.vpc_B_subnet_AZ1.id

    route_table_id = aws_route_table.rt_for_VPC_B.id

}

resource "aws_route_table_association" "rt_association_for_VPC_B_subnet_AZ2" {

    subnet_id = aws_subnet.vpc_B_subnet_AZ2.id

    route_table_id = aws_route_table.rt_for_VPC_B.id

}

resource "aws_route_table_association" "rt_association_for_VPC_C_subnet_AZ1" {

    subnet_id = aws_subnet.vpc_C_subnet_AZ1.id

    route_table_id = aws_route_table.rt_for_VPC_C.id

}

resource "aws_route_table_association" "rt_association_for_VPC_C_subnet_AZ2" {

    subnet_id = aws_subnet.vpc_C_subnet_AZ2.id

    route_table_id = aws_route_table.rt_for_VPC_C.id

}

resource "aws_route" "VPC_A_rt_to_VPC_B_rt" {
  route_table_id            = aws_vpc.vpc_A_cidr.main_route_table_id
  destination_cidr_block    = aws_vpc.vpc_B_cidr.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_A_to_VPC_B.id
}

resource "aws_route" "VPC_B_rt_to_VPC_A_rt" {
  route_table_id            = aws_vpc.vpc_B_cidr.main_route_table_id
  destination_cidr_block    = aws_vpc.vpc_A_cidr.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_A_to_VPC_B.id
}

resource "aws_route" "VPC_A_rt_to_VPC_C_rt" {
  route_table_id            = aws_vpc.vpc_A_cidr.main_route_table_id
  destination_cidr_block    = aws_vpc.vpc_C_cidr.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_A_to_VPC_C.id
}

resource "aws_route" "VPC_C_rt_to_VPC_A_rt" {
  route_table_id            = aws_vpc.vpc_C_cidr.main_route_table_id
  destination_cidr_block    = aws_vpc.vpc_A_cidr.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_A_to_VPC_C.id
}
 
resource "aws_ec2_transit_gateway_route_table" "transit_gateway-rt" {
  transit_gateway_id = "${aws_ec2_transit_gateway.transit_gateway.id}"
  tags               = {
    Name             = "transit_gateway-rt"
    scenario         = "${var.scenario}"
  }
  depends_on = [aws_ec2_transit_gateway.transit_gateway]
}


resource "aws_ec2_transit_gateway_route_table_association" "tgw-rt-vpc-A-assoc" {
  transit_gateway_attachment_id  = "${aws_ec2_transit_gateway_vpc_attachment.transit_gateway_attachment_for_vpc_A.id}"
  transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.transit_gateway-rt.id}"
}

resource "aws_ec2_transit_gateway_route_table_association" "tgw-rt-vpc-B-assoc" {
  transit_gateway_attachment_id  = "${aws_ec2_transit_gateway_vpc_attachment.transit_gateway_attachment_for_vpc_B.id}"
  transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.transit_gateway-rt.id}"
}

resource "aws_ec2_transit_gateway_route_table_association" "tgw-rt-vpc-C-assoc" {
  transit_gateway_attachment_id  = "${aws_ec2_transit_gateway_vpc_attachment.transit_gateway_attachment_for_vpc_C.id}"
  transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.transit_gateway-rt.id}"
}


# Route Tables Propagations
## This section defines which VPCs will be routed from each Route Table created in the Transit Gateway

resource "aws_ec2_transit_gateway_route_table_propagation" "tgw-rt-to-vpc-A" {
  transit_gateway_attachment_id  = "${aws_ec2_transit_gateway_vpc_attachment.transit_gateway_attachment_for_vpc_A.id}"
  transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.transit_gateway-rt.id}"
}

resource "aws_ec2_transit_gateway_route_table_propagation" "tgw-rt-to-vpc-B" {
  transit_gateway_attachment_id  = "${aws_ec2_transit_gateway_vpc_attachment.transit_gateway_attachment_for_vpc_B.id}"
  transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.transit_gateway-rt.id}"
}
resource "aws_ec2_transit_gateway_route_table_propagation" "tgw-rt-to-vpc-C" {
  transit_gateway_attachment_id  = "${aws_ec2_transit_gateway_vpc_attachment.transit_gateway_attachment_for_vpc_C.id}"
  transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.transit_gateway-rt.id}"
}


 

