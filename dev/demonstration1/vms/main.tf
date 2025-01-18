# main.tf

module "vpc_dev" {
  source       = "./modules/vpc"
  network_name = "develop-network"
  zone         = "ru-central1-a"
  v4_cidr_block = "10.0.1.0/24"
}

module "vpc_prod" {
  source   = "./modules/vpc-prod"
  env_name = "production"
  subnets = [
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
    { zone = "ru-central1-b", cidr = "10.0.2.0/24" },
    { zone = "ru-central1-d", cidr = "10.0.3.0/24" },
  ]
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

  