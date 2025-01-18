###cloud vars

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "security_group_ids" {
 description = "Список ID групп безопасности"
  type        = list(string)
  default     = []
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

