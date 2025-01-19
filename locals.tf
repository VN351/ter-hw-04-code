locals {
     vm_configs = {
       marketing = {
         env_name       = "marketing"
         network_id     = module.vpc_dev.network_id
         subnet_zones   = ["ru-central1-a"]
         subnet_ids     = [module.vpc_dev.subnet_id]
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
         network_id     = module.vpc_dev.network_id
         subnet_zones   = ["ru-central1-a"]
         subnet_ids     = [module.vpc_dev.subnet_id]
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