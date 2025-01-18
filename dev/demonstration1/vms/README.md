## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.8.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_vpc_network.dev](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.dev-sub](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Название VPC сети. | `string` | n/a | yes |
| <a name="input_v4_cidr_block"></a> [v4\_cidr\_block](#input\_v4\_cidr\_block) | CIDR блок для IPv4 подсети. | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | Зона, в которой будет создана подсеть. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | Идентификатор созданной VPC сети |
| <a name="output_subnet_cidr"></a> [subnet\_cidr](#output\_subnet\_cidr) | CIDR блок подсети |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | Идентификатор созданной подсети |
| <a name="output_subnet_name"></a> [subnet\_name](#output\_subnet\_name) | Название созданной подсети |
| <a name="output_subnet_zone"></a> [subnet\_zone](#output\_subnet\_zone) | Зона подсети |
