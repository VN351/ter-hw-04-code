output "network_id" {
  description = "ID созданной сети"
  value       = yandex_vpc_network.dev.id
}

output "subnet_id" {
  description = "ID созданной подсети"
  value       = yandex_vpc_subnet.dev-sub.id
}

output "subnet_cidr" {
  description = "CIDR блока подсети"
  value       = yandex_vpc_subnet.dev-sub.v4_cidr_blocks
}
