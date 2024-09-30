// main.tf
module "network" {
  source = "./modules/network"
}

module "instance" {
  source = "./modules/instances"
  allowHttpSsh = module.network.allowHttpSsh
  
  # ami_id         = var.ami_id
  # ecr_repos      = var.ecr_repos
  # instance_profile_name = var.instance_profile_name
}
