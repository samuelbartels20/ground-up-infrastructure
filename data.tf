data "aws_availability_zones" "available" {

    state = "available"

}

data "aws_ami" "ami" {
  most_recent = true
}

data "aws_caller_identity" "current" {}
