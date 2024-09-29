# // modules/instance/outputs.tf
output "instance_id" {
  value = aws_instance.web_ec2.id
}


# Output the ECR Repository URLs
output "ecr_repository_urls" {
  value = [for repo in aws_ecr_repository.ass1_repos : repo.repository_url]
  description = "List of URLs for the created ECR repositories"
}

# Ouput the security group
output "security_group_id" {
  value = aws_security_group.allowHttpSsh.id
}