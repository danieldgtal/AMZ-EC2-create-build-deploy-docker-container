// modules/network/variables.tf
// modules/network/variables.tf

variable "vpc_id" {
  description = "The ID of the existing VPC where resources will be deployed"
  type        = string
  default   = "vpc-034ef8f261fda741d"
}

variable "subnet_id" {
  description = "The ID of the subnet where the EC2 instance will be deployed"
  type        = string
  default     = "subnet-0781c16f907cf4491"
}
