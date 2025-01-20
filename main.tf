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

resource "random_string" "unique_id" {
  length  = 8
  upper   = false
  lower   = true
  numeric = true
  special = false
}

module "s3" {
  source = "git::https://github.com/terraform-yc-modules/terraform-yc-s3.git?ref=master"

  bucket_name = "simple-bucket-${random_string.unique_id.result}"
  versioning = {
    enabled = true
  }
  #max_size = 1073741824
}
/*
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

module "mysql" {
  source = "./modules/mysql"
  name = var.cluster_name
  network_id = module.vpc_dev.network_id
  subnet_id = module.vpc_dev.subnet_id
  HA = true  
}

module "mysql_db" {
  source = "./modules/user_db"
  cluster_id = module.mysql.yandex_mdb_mysql_cluster.id
  db_name = var.db_managed_name
  db_user = var.db_managed_user
}
*/
