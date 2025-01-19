resource "yandex_vpc_network" "dev" {
  name = var.network_name
}

resource "yandex_vpc_subnet" "dev-sub" {
  name           = "${var.network_name}-${var.zone}-subnet"
  zone           = var.zone
  network_id     = yandex_vpc_network.dev.id
  v4_cidr_blocks = [var.v4_cidr_block]
}

