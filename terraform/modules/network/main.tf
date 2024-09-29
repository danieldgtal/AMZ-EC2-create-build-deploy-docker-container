// modules/network/main.tf

// Data source to retrieve details about the provided VPC
data "aws_vpc" "vpc_main" {
  id = var.vpc_id
}

// Fetch details about the specified subnet using the variable
data "aws_subnet" "subnet" {
  id = var.subnet_id
}

# Security Group | Allow SSH and HTTP
resource "aws_security_group" "allowHttpSsh" {
  name        = "allow_http_ssh"
  description = "Allow HTTP and SSH inbound traffic"
  vpc_id      = data.aws_vpc.vpc_main.id

  ingress {
    description      = "HTTP from everywhere"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "SSH from everywhere"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}

# Security Gtroup | Allow SSH only
resource "aws_security_group" "allowSshOnly" {
  name        = "allow_ssh_only"
  description = "Allow SSH inbound traffic only"
  vpc_id      = data.aws_vpc.vpc_main.id

  ingress {
    description      = "SSH from everywhere"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}
