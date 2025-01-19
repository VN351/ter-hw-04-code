# main.tf

module "vpc_dev" {
  source       = "./modules/vpc"
  network_name = var.net_name
  zone         = var.default_zone
  v4_cidr_block = var.default_cidr

}

module "vpc_prod" {
  source   = "./modules/vpc-prod"
  env_name = var.vpc_prod_env_name
  subnets = var.vpc_prod_subnets
}

module "marketing-vm" {
  source         = "./modules/vm"
  env_name       = "marketing" 
  network_id     = module.vpc_dev.network_id
  subnet_zones   = ["ru-central1-a"]
  subnet_ids     = [module.vpc_dev.subnet_id]
  instance_name  = "vm"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = { 
    project = "marketing"
     }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }
}

module "analytics-vm" {
  source         = "./modules/vm"
  env_name       = "analytics"
  network_id     = module.vpc_dev.network_id
  subnet_zones   = ["ru-central1-a"]
  subnet_ids     = [module.vpc_dev.subnet_id]
  instance_name  = "vm"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = { 
  project = "analytics"
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }

}

data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  
  vars = {
    username           = var.username
    ssh_public_key     = file(var.ssh_public_key)
    packages           = jsonencode(var.packages)
  }
  
}

  