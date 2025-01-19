/*
output "out" {
     value = [
       module.vms["marketing"].external_ip_address,
       module.vms["analytics"].external_ip_address
     ]
   }
*/  
output "dev_network_id" {
  description = "ID сети для development окружения"
  value       = module.vpc_dev.network_id
}

output "dev_subnet_id" {
  description = "ID подсети для development окружения"
  value       = module.vpc_dev.subnet_id
}

output "dev_subnet_cidr" {
  description = "CIDR подсети для development окружения"
  value       = module.vpc_dev.subnet_cidr
}
/*
output "s3_bucket_id" {
  description = "ID созданного S3 бакета"
  value       = module.s3.bucket_id
}

output "s3_bucket_name" {
  description = "Имя созданного S3 бакета"
  value       = module.s3.bucket_name
}
*/