locals {
  vm_configs = {
    marketing = {
      env_name       = "marketing"
      network_id     = module.vpc_prod.network_id
      subnet_zones   = module.vpc_prod.subnet_zones
      subnet_ids     = module.vpc_prod.subnet_ids
      instance_name  = "vm"
      instance_count = 1
      image_family   = "ubuntu-2004-lts"
      public_ip      = true
      labels         = { project = "marketing" }
      metadata       = {
        "user-data"           = data.template_file.cloudinit.rendered
        "serial-port-enable" = "1"
      }
    },
    analytics = {
      env_name       = "analytics"
      network_id     = module.vpc_prod.network_id
      subnet_zones   = module.vpc_prod.subnet_zones
      subnet_ids     = module.vpc_prod.subnet_ids
      instance_name  = "vm"
      instance_count = 1
      image_family   = "ubuntu-2004-lts"
      public_ip      = true
      labels         = { project = "analytics" }
      metadata       = {
        "user-data"           = data.template_file.cloudinit.rendered
        "serial-port-enable" = "1"
      }
    }
  }
}  