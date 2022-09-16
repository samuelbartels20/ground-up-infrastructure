variable "vpc_A_cidr" {}
variable "vpc_B_cidr" {}
variable "vpc_C_cidr" {}
variable "OnPremVpc_cidr" {}

variable "vpc_A_subnet_cidr" {}
variable "vpc_B_subnet_cidr" {}
variable "vpc_C_subnet_cidr" {}
variable "OnPremVpc_subnet_cidr" {}

variable "region" {}

variable "access_key" {
  type      = string
  default   = ""
  sensitive = true
}
variable "secret_key" {
  type      = string     
  default   = ""
  sensitive = true
}

variable "ServerName" {
  type    = string
  default = "app-server"
}

variable "SecureVariableOne" {
  type      = string
  default   = ""
  sensitive = true
}

variable "ami"{}

variable "instance_key" {
  description = "SSH key name to launch instances with"
}

variable "aws_caller_identity"{}

variable "instance_class" {
  default = "t2.micro"
}

variable "scenario" {
  default = "vpc-tgw"
}
