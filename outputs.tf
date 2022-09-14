output "instance_ip_for_VPC_A" {
  value = aws_instance.app-server_for_VPC_A_subnet_AZ1.public_ip
}

output "instance_ip_for_VPC_B" {
  value = aws_instance.app-server_for_VPC_B_subnet_AZ1.public_ip
}

output "instance_ip_for_VPC_C" {
  value = aws_instance.app-server_for_VPC_C_subnet_AZ1.public_ip
}

