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
| [yandex_vpc_network.prod](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.prod-sub](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | Название окружения (например, production, develop) | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Список подсетей с зонами и CIDR | <pre>list(object({<br/>    zone = string<br/>    cidr = string<br/>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | Идентификатор созданной VPC сети |
| <a name="output_subnet_cidrs"></a> [subnet\_cidrs](#output\_subnet\_cidrs) | CIDR блоки подсетей |
| <a name="output_subnet_ids"></a> [subnet\_ids](#output\_subnet\_ids) | Идентификаторы созданных подсетей |
| <a name="output_subnet_names"></a> [subnet\_names](#output\_subnet\_names) | Названия созданных подсетей |
| <a name="output_subnet_zones"></a> [subnet\_zones](#output\_subnet\_zones) | Зоны подсетей |
