output "out" {

    value=concat(module.analytics-vm.external_ip_address, module.marketing-vm.external_ip_address)
}

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
