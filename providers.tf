terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "> 0.9"
    }

    random = {
      source  = "hashicorp/random"
      version = "> 3.5"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "> 3.74.0"
    }
  }
  required_version = "~>1.8.4"
}

provider "aws" {
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_region_validation      = true
  skip_requesting_account_id  = true

  access_key = "foo"
  secret_key = "bar"
}

resource "aws_s3_bucket" "disabled" {
  count  = 0
  bucket = "hello-world"
}
provider "yandex" {
  #token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
  service_account_key_file = file("~/.key.json")
}
