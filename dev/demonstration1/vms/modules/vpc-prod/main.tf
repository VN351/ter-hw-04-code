terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.8.4"  ### some test
}

resource "yandex_vpc_network" "prod" {
  name = "${var.env_name}-network"
}

resource "yandex_vpc_subnet" "prod-sub" {
  for_each = { for idx, subnet in var.subnets : "${var.env_name}-subnet-${idx}" => subnet }

  name           = "${var.env_name}-subnet-${each.key}"
  zone           = each.value.zone
  network_id     = yandex_vpc_network.prod.id
  v4_cidr_blocks = [each.value.cidr]
}
