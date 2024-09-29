provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "clo835-assignment1"           # Specify the S3 bucket name
    key    = "terraform/state/main.tfstate" # State file path in S3 bucket
    region = "us-east-1"                    # AWS Region
  }
}