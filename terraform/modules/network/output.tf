// Output the VPC ID and the Subnet ID
output "vpc_id" {
  value = data.aws_vpc.vpc_main.id
}

output "subnet_id" {
  value = data.aws_subnet.subnet.id
}