// Output the VPC ID and the Subnet ID
output "vpc_id" {
  value = data.aws_vpc.vpc_main.id
}

output "subnet_id" {
  value = data.aws_subnet.subnet.id
}

# In modules/network/output.tf
output "allowHttpSsh" {
  value = aws_security_group.allowHttpSsh.id
}
