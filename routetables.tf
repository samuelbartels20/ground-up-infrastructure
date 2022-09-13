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



 


 

