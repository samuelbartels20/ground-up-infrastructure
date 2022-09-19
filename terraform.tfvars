vpc_A_cidr     = "10.0.0.0/16"
vpc_B_cidr     = "10.1.0.0/16"
vpc_C_cidr     = "10.2.0.0/16"
OnPremVpc_cidr      = "10.10.0.0/16"

vpc_A_subnet_cidr = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/28", "10.0.3.0/28"]

vpc_B_subnet_cidr = ["10.1.0.0/24", "10.1.1.0/24", "10.1.2.0/28", "10.1.3.0/28"]

vpc_C_subnet_cidr = ["10.2.0.0/24", "10.2.1.0/24", "10.2.2.0/28", "10.2.3.0/28"]

OnPremVpc_subnet_cidr = ["10.10.0.0/24", "10.10.1.0/24"]

region          = "us-east-1"
ami             = "ami-0729e439b6769d6ab"
instance_key    = "devops"

aws_caller_identity = " " # aws account id
