// modules/instance/variables.tf
variable "subnet_id" {
  description = "The subnet ID where the instance will be deployed"
  type        = string
  default     = "subnet-0781c16f907cf4491"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default       = "t2.micro"
}

variable "prefix" {
  description = "Prefix"
  type        = string
  default     = "ass1"
}

variable "ecr_repos" {
  description = "ECR repository names for storing Docker images"
  type        = list(string)
  default = ["webapp", "mysql-db"]
}

variable "allowHttpSsh" {
  description = "The ID of the security group that allows HTTP and SSH."
  type        = string
}

# variable "instance_profile_name" {
#   description = "The IAM instance profile name"
#   type        = string
#   default = "ecr_access_instance_profile"
  
# }

# variable "iam_role_name" {
#   description = "The IAM role name for EC2 instance"
#   type        = string
#   default     = "LabInstanceProfile"  # Use your existing IAM role name here
# }

