variable "network_name" {
  description = "Название VPC сети."
  type        = string
}

variable "zone" {
  description = "Зона для подсети."
  type        = string
}

variable "v4_cidr_block" {
  description = "CIDR блок подсети IPv4."
  type        = string
}


