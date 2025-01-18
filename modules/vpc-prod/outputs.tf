# modules/vpc/outputs.tf

output "network_id" {
  description = "Идентификатор созданной VPC сети"
  value       = yandex_vpc_network.prod.id
}

output "subnet_ids" {
  description = "Идентификаторы созданных подсетей"
  value       = [for subnet in yandex_vpc_subnet.prod-sub : subnet.id]
}

output "subnet_names" {
  description = "Названия созданных подсетей"
  value       = [for subnet in yandex_vpc_subnet.prod-sub  : subnet.name]
}

output "subnet_cidrs" {
  description = "CIDR блоки подсетей"
  value       = [for subnet in yandex_vpc_subnet.prod-sub : subnet.v4_cidr_blocks]
}

output "subnet_zones" {
  description = "Зоны подсетей"
  value       = [for subnet in yandex_vpc_subnet.prod-sub : subnet.zone]
}
