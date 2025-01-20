variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "net_name" {
  description = "Название сети"
  type        = string
  default     = "develop-network"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  description = "CIDR блок по умолчанию для подсети"
  type        = string
  default     = "10.0.1.0/24"
}

variable "vpc_prod_env_name" {
  description = "Название сети"
  type        = string
  default     = "production"
}

variable "vpc_prod_subnets" {
  description = "Список подсетей с указанием зоны и CIDR блока"
  type = list(object({
    zone = string
    cidr = string
  }))
  default = [
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
    { zone = "ru-central1-b", cidr = "10.0.2.0/24" },
    { zone = "ru-central1-d", cidr = "10.0.3.0/24" },
  ]
}

variable "username" {
  type = string
  default = "ubuntu"
}

variable "ssh_public_key" {
  description = "Путь к публичному SSH ключу"
  type        = string
  default     = "/home/vlad/.ssh/id_ed25519.pub"
}

variable packages {
  type    = list
  default = ["vim", "nginx"]
}

variable "public_key" {
  type    = string
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC8bDGbiyUNa2k07/T9jlaRKD1gMcMT9/4wqljOvFJOD nevzorovvlad@mail.ru"
}

variable "cluster_name" {
  type = string
  default = "example"
}

variable "db_managed_name" {
  type = string
  default = "test"
}

variable "db_managed_user" {
  type = string
  default = "app"
}
/*
variable "max_size" {
  type = string
}*/