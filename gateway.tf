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

resource "aws_eip" "eip_for_OnPremVPC_private_subnet" {
  vpc = true
  instance                  = aws_instance.app-server_for_OnPremVPC_private_subnet.id
  depends_on                = [aws_internet_gateway.internet_gateway_for_OnPremVPC]
}


resource "aws_nat_gateway" "nat_gateway_for_OnPremVPC" {
  depends_on = [
    aws_eip.eip_for_OnPremVPC_private_subnet
  ]
  connectivity_type = "private"
  
  # Associating it in the Public Subnet!
  subnet_id = aws_subnet.OnPremVpc_private_subnet.id
  tags = {
    Name = "OnPremVPC_private_nat_gateway"
  }
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

resource "aws_internet_gateway" "internet_gateway_for_OnPremVPC" {
    vpc_id = aws_vpc.OnPremVpc.id
    tags = {

        Name = "internet_gateway_for_OnPremVPC"

    }
}

resource "aws_ec2_transit_gateway" "transit_gateway" {
  description                     = "Transit Gateway with 3 VPCs, 2 subnets each"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"
  tags                            = {
    Name                          = "${var.scenario}"
    scenario                      = "${var.scenario}"
  }
}

# VPC attachment

resource "aws_ec2_transit_gateway_vpc_attachment" "transit_gateway_attachment_for_vpc_A" {
  subnet_ids         = ["${aws_subnet.vpc_A_subnet_AZ1.id}", "${aws_subnet.vpc_A_subnet_AZ2.id}"]
  transit_gateway_id = "${aws_ec2_transit_gateway.transit_gateway.id}"
  vpc_id             = "${aws_vpc.vpc_A_cidr.id}"
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  tags               = {
    Name             = "transit_gateway_attachment_for_vpc_A"
    scenario         = "${var.scenario}"
  }
  depends_on = [aws_ec2_transit_gateway.transit_gateway]
}

resource "aws_ec2_transit_gateway_vpc_attachment" "transit_gateway_attachment_for_vpc_B" {
  subnet_ids         = ["${aws_subnet.vpc_B_subnet_AZ1.id}", "${aws_subnet.vpc_B_subnet_AZ2.id}"]
  transit_gateway_id = "${aws_ec2_transit_gateway.transit_gateway.id}"
  vpc_id             = "${aws_vpc.vpc_B_cidr.id}"
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  tags               = {
    Name             = "transit_gateway_attachment_for_vpc_B"
    scenario         = "${var.scenario}"
  }
  depends_on = [aws_ec2_transit_gateway.transit_gateway]
}

resource "aws_ec2_transit_gateway_vpc_attachment" "transit_gateway_attachment_for_vpc_C" {
  subnet_ids         = ["${aws_subnet.vpc_C_subnet_AZ1.id}", "${aws_subnet.vpc_C_subnet_AZ2.id}"]
  transit_gateway_id = "${aws_ec2_transit_gateway.transit_gateway.id}"
  vpc_id             = "${aws_vpc.vpc_C_cidr.id}"
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  tags               = {
    Name             = "transit_gateway_attachment_for_vpc_C"
    scenario         = "${var.scenario}"
  }
  depends_on = [aws_ec2_transit_gateway.transit_gateway]
}

