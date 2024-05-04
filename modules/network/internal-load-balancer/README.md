<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_lb.azlb](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb) | resource |
| [azurerm_lb_backend_address_pool.azlb](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_backend_address_pool) | resource |
| [azurerm_lb_nat_rule.azlb](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_nat_rule) | resource |
| [azurerm_lb_probe.azlb](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_probe) | resource |
| [azurerm_lb_rule.azlb](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_rule) | resource |
| [azurerm_public_ip.azlb](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.azlb](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocation_method"></a> [allocation\_method](#input\_allocation\_method) | (Required) Defines how an IP address is assigned. Options are Static or Dynamic. | `string` | `"Static"` | no |
| <a name="input_frontend_name"></a> [frontend\_name](#input\_frontend\_name) | (Required) Specifies the name of the frontend ip configuration. | `string` | `"myPublicIP"` | no |
| <a name="input_frontend_private_ip_address"></a> [frontend\_private\_ip\_address](#input\_frontend\_private\_ip\_address) | (Optional) Private ip address to assign to frontend. Use it with type = private | `string` | `"10.52.2.10"` | no |
| <a name="input_frontend_private_ip_address_allocation"></a> [frontend\_private\_ip\_address\_allocation](#input\_frontend\_private\_ip\_address\_allocation) | (Optional) Frontend ip allocation type (Static or Dynamic) | `string` | `"Dynamic"` | no |
| <a name="input_frontend_subnet_id"></a> [frontend\_subnet\_id](#input\_frontend\_subnet\_id) | (Optional) Frontend subnet id to use when in private mode | `string` | `"/subscriptions/cf2aa82c-ec73-4555-932a-6adbf20aa6d8/resourceGroups/hub-spoke/providers/Microsoft.Network/virtualNetworks/spoke2-vnet/subnets/spoke2-subnet"` | no |
| <a name="input_lb_port"></a> [lb\_port](#input\_lb\_port) | Protocols to be used for lb rules. Format as [frontend\_port, protocol, backend\_port] | `map(any)` | `{}` | no |
| <a name="input_lb_probe"></a> [lb\_probe](#input\_lb\_probe) | (Optional) Protocols to be used for lb health probes. Format as [protocol, port, request\_path] | `map(any)` | `{}` | no |
| <a name="input_lb_probe_interval"></a> [lb\_probe\_interval](#input\_lb\_probe\_interval) | Interval in seconds the load balancer health probe rule does a check | `number` | `5` | no |
| <a name="input_lb_probe_unhealthy_threshold"></a> [lb\_probe\_unhealthy\_threshold](#input\_lb\_probe\_unhealthy\_threshold) | Number of times the load balancer health probe has an unsuccessful attempt before considering the endpoint unhealthy. | `number` | `2` | no |
| <a name="input_lb_sku"></a> [lb\_sku](#input\_lb\_sku) | (Optional) The SKU of the Azure Load Balancer. Accepted values are Basic and Standard. | `string` | `"Basic"` | no |
| <a name="input_location"></a> [location](#input\_location) | (Optional) The location/region where the core network will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions | `string` | `"East US"` | no |
| <a name="input_name"></a> [name](#input\_name) | (Optional) Name of the load balancer. If it is set, the 'prefix' variable will be ignored. | `string` | `"outsystems"` | no |
| <a name="input_pip_name"></a> [pip\_name](#input\_pip\_name) | (Optional) Name of public ip. If it is set, the 'prefix' variable will be ignored. | `string` | `""` | no |
| <a name="input_pip_sku"></a> [pip\_sku](#input\_pip\_sku) | (Optional) The SKU of the Azure Public IP. Accepted values are Basic and Standard. | `string` | `"Basic"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | (Required) Default prefix to use with your resource names. | `string` | `"azure_lb"` | no |
| <a name="input_remote_port"></a> [remote\_port](#input\_remote\_port) | Protocols to be used for remote vm access. [protocol, backend\_port].  Frontend port will be automatically generated starting at 50000 and in the output. | `map(any)` | `{}` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group where the load balancer resources will be imported. | `string` | `"rsg-outsystems-weu1-p-001"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | <pre>{<br>  "source": "terraform"<br>}</pre> | no |
| <a name="input_type"></a> [type](#input\_type) | (Optional) Defined if the loadbalancer is private or public | `string` | `"private"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->