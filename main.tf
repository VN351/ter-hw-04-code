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

module "vms" {
  source = "./modules/vm"

  for_each = local.vm_configs

  env_name       = each.value.env_name
  network_id     = each.value.network_id
  subnet_zones   = each.value.subnet_zones
  subnet_ids     = each.value.subnet_ids
  instance_name  = each.value.instance_name
  instance_count = each.value.instance_count
  image_family   = each.value.image_family
  public_ip      = each.value.public_ip
  labels         = each.value.labels
  metadata       = each.value.metadata
}


data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  
  vars = {
    username           = var.username
    ssh_public_key     = file(var.ssh_public_key)
    packages           = jsonencode(var.packages)
  }
  
}
