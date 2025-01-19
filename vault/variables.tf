# variables.tf

variable "vault_address" {
  description = "Адрес Vault сервера"
  type        = string
  default     = "http://127.0.0.1:8200"
}

variable "vault_token" {
  description = "Токен доступа Vault"
  type        = string
  sensitive   = true
}

variable "secret_path" {
  description = "Путь, по которому будет записан секрет в Vault"
  type        = string
  default     = "secret/example"
}

variable "secret_path1" {
  description = "Путь, по которому будет записан секрет в Vault"
  type        = string
  default     = "secret/testnv/"
}

variable "secret_data" {
  description = "Данные секрета для записи в Vault"
  type        = map(string)
  default = {
    username = "root"
    password = "P@ssw0rd"
  }
}
