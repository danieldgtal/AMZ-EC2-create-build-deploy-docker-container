// Main Entry into Infrastructure Provisioning

# EC2 Instance key pair
resource "aws_key_pair" "ass1" {
    key_name = var.prefix
    public_key = file("~/.ssh/ass1.pub")
}

# AWS Official AMI
data "aws_ami" "latest_amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"]  # Amazon's AWS account ID for official AMIs
}


# EC2 Instance
resource "aws_instance" "web_ec2" {
  ami                    = data.aws_ami.latest_amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  iam_instance_profile   = "LabInstanceProfile"
  associate_public_ip_address = true
  key_name                    = aws_key_pair.ass1.key_name
  vpc_security_group_ids = [var.allowHttpSsh]
  
  user_data = file("${path.module}/install_docker.sh")

  tags = {
    Name = "WebAppInstance"
  }
}


# Create repositories based on the number of variables 
resource "aws_ecr_repository" "ass1_repos" {
  count = length(var.ecr_repos)
  name  = var.ecr_repos[count.index]
}