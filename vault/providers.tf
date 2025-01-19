terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.8.4"
}

provider "vault" {
  address = var.vault_address
  token   = var.vault_token
}