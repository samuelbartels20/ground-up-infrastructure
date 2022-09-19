# Subnets for VPC A
resource "aws_subnet" "vpc_A_subnet_AZ1" {

    cidr_block = var.vpc_A_subnet_cidr[0]


    vpc_id = aws_vpc.vpc_A_cidr.id

    map_public_ip_on_launch = true


    availability_zone = data.aws_availability_zones.available.names[0]


    tags = {

    Name = "vpc_A_subnet_AZ1"

    }

}



resource "aws_subnet" "vpc_A_subnet_AZ2" {

    cidr_block = var.vpc_A_subnet_cidr[1]


    vpc_id = aws_vpc.vpc_A_cidr.id

    map_public_ip_on_launch = true

    availability_zone = data.aws_availability_zones.available.names[1]


    tags = {

    Name = "vpc_A_subnet_AZ2"

    }

}

resource "aws_subnet" "vpc_A_subnet_AZ1-TGW" {

    cidr_block = var.vpc_A_subnet_cidr[2]


    vpc_id = aws_vpc.vpc_A_cidr.id

    map_public_ip_on_launch = true


    availability_zone = data.aws_availability_zones.available.names[0]


    tags = {

    Name = "vpc_A_subnet_AZ1-TGW"

    }

}

resource "aws_subnet" "vpc_A_subnet_AZ2-TGW" {

    cidr_block = var.vpc_A_subnet_cidr[3]


    vpc_id = aws_vpc.vpc_A_cidr.id

    map_public_ip_on_launch = true


    availability_zone = data.aws_availability_zones.available.names[1]


    tags = {

    Name = "vpc_A_subnet_AZ2-TGW"

    }

}

# subnets for VPC B
resource "aws_subnet" "vpc_B_subnet_AZ1" {

    cidr_block = var.vpc_B_subnet_cidr[0]

    vpc_id = aws_vpc.vpc_B_cidr.id

    map_public_ip_on_launch = true

    availability_zone = data.aws_availability_zones.available.names[0]

    tags = {

    Name = "vpc_B_subnet_AZ1"

    }

}


resource "aws_subnet" "vpc_B_subnet_AZ2" {

    cidr_block = var.vpc_B_subnet_cidr[1]

    vpc_id = aws_vpc.vpc_B_cidr.id

    map_public_ip_on_launch = true

    availability_zone = data.aws_availability_zones.available.names[1]


    tags = {

    Name = "vpc_B_subnet_AZ2"

    }

}

resource "aws_subnet" "vpc_B_subnet_AZ1-TGW" {

    cidr_block = var.vpc_B_subnet_cidr[2]


    vpc_id = aws_vpc.vpc_B_cidr.id

    map_public_ip_on_launch = true


    availability_zone = data.aws_availability_zones.available.names[0]


    tags = {

    Name = "vpc_B_subnet_AZ1-TGW"

    }
}

resource "aws_subnet" "vpc_B_subnet_AZ2-TGW" {

    cidr_block = var.vpc_B_subnet_cidr[3]

    vpc_id = aws_vpc.vpc_B_cidr.id

    map_public_ip_on_launch = true

    availability_zone = data.aws_availability_zones.available.names[1]

    tags = {

    Name = "vpc_B_subnet_AZ2-TGW"

    }

}

# Subnets for VPC C 

resource "aws_subnet" "vpc_C_subnet_AZ1" {

    cidr_block = var.vpc_C_subnet_cidr[0]

    vpc_id = aws_vpc.vpc_C_cidr.id

    map_public_ip_on_launch = true

    availability_zone = data.aws_availability_zones.available.names[0]

    tags = {

    Name = "vpc_C_subnet_AZ1"

    }

}

resource "aws_subnet" "vpc_C_subnet_AZ2" {

    cidr_block = var.vpc_C_subnet_cidr[1]

    vpc_id = aws_vpc.vpc_C_cidr.id

    map_public_ip_on_launch = true

    availability_zone = data.aws_availability_zones.available.names[1]

    tags = {

    Name = "vpc_C_subnet_AZ2"

    }

}

resource "aws_subnet" "vpc_C_subnet_AZ1-TGW" {

    cidr_block = var.vpc_C_subnet_cidr[2]

    vpc_id = aws_vpc.vpc_C_cidr.id

    map_public_ip_on_launch = true

    availability_zone = data.aws_availability_zones.available.names[0]

    tags = {

    Name = "vpc_C_subnet_AZ1-TGW"

    }

}

resource "aws_subnet" "vpc_C_subnet_AZ2-TGW" {

    cidr_block = var.vpc_C_subnet_cidr[3]

    vpc_id = aws_vpc.vpc_C_cidr.id

    map_public_ip_on_launch = true

    availability_zone = data.aws_availability_zones.available.names[1]

    tags = {

    Name = "vpc_C_subnet_AZ2-TGW"

    }

}

# OnPrem VPC
resource "aws_subnet" "OnPremVpc_public_subnet" {
    cidr_block = var.OnPremVpc_subnet_cidr[0]

    vpc_id = aws_vpc.OnPremVpc.id

    map_public_ip_on_launch = true

    availability_zone = data.aws_availability_zones.available.names[0]

    tags = {

    Name = "OnPremVpc_public_subnet"

    }

}

resource "aws_subnet" "OnPremVpc_private_subnet" {

    cidr_block = var.OnPremVpc_subnet_cidr[1]

    vpc_id = aws_vpc.OnPremVpc.id

    map_public_ip_on_launch = false

    availability_zone = data.aws_availability_zones.available.names[1]

    tags = {

    Name = "OnPremVpc_private_subnet"

    }

}
