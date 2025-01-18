variable "env_name" {
  description = "Название окружения (например, production, develop)"
  type        = string
}

variable "subnets" {
  description = "Список подсетей с зонами и CIDR"
  type = list(object({
    zone = string
    cidr = string
  }))
}
