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
| [azurerm_network_interface.hubNic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_interface.spoke1Nic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_interface.spoke2Nic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_interface_security_group_association.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_interface_security_group_association.spoke1nictonsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_interface_security_group_association.spoke2nictonsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_security_group.hubnsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.spoke1nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.spoke2nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_resource_group.rghubspoke](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_role_definition.terraform_pike](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition) | resource |
| [azurerm_subnet.hubAzureBastionHostSubnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.hubSubnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.spoke1Subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.spoke2Subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.spokeAzureBastionHostSubnet1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.spokeAzureBastionHostSubnet2](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.vnetHub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network.vnetSpoke1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network.vnetSpoke2](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network_peering.hubtospoke1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.hubtospoke2](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.spoke1tohub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.spoke2tohub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_subscription.primary](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_namingprefixes"></a> [namingprefixes](#input\_namingprefixes) | n/a | `map(any)` | <pre>{<br>  "centralus": "cus1",<br>  "eastus": "eus1",<br>  "eastus2": "eus2",<br>  "global": "glob",<br>  "northeurope": "neu1",<br>  "westeurope": "weu1"<br>}</pre> | no |
| <a name="input_regions"></a> [regions](#input\_regions) | n/a | `map(any)` | <pre>{<br>  "Central US": "centralus",<br>  "East US": "eastus",<br>  "East US 2": "eastus2",<br>  "Global": "global",<br>  "North Europe": "northeurope",<br>  "West Europe": "westeurope"<br>}</pre> | no |
| <a name="input_rgHubPpoke"></a> [rgHubPpoke](#input\_rgHubPpoke) | n/a | `map(any)` | <pre>{<br>  "billing-code": "010",<br>  "environment": "infra",<br>  "location": "eastus",<br>  "resource_group_name": "hub-spoke"<br>}</pre> | no |
| <a name="input_vnetHub"></a> [vnetHub](#input\_vnetHub) | n/a | `map(any)` | <pre>{<br>  "AzureBastionSubnet": "10.50.1.0/24",<br>  "address_space": "10.50.0.0/16",<br>  "billing-code": "010",<br>  "defaultSubnet": "10.50.2.0/24",<br>  "environment": "infra",<br>  "name": "hub-vnet"<br>}</pre> | no |
| <a name="input_vnetSpoke1"></a> [vnetSpoke1](#input\_vnetSpoke1) | n/a | `map(any)` | <pre>{<br>  "AzureBastionSubnet": "10.51.1.0/24",<br>  "address_space": "10.51.0.0/16",<br>  "billing-code": "010",<br>  "defaultSubnet": "10.51.2.0/24",<br>  "environment": "infra",<br>  "name": "spoke1-vnet"<br>}</pre> | no |
| <a name="input_vnetSpoke2"></a> [vnetSpoke2](#input\_vnetSpoke2) | n/a | `map(any)` | <pre>{<br>  "AzureBastionSubnet": "10.52.1.0/24",<br>  "address_space": "10.52.0.0/16",<br>  "billing-code": "010",<br>  "defaultSubnet": "10.52.2.0/24",<br>  "environment": "infra",<br>  "name": "spoke2-vnet"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vnet_subnet_id_spoke1"></a> [vnet\_subnet\_id\_spoke1](#output\_vnet\_subnet\_id\_spoke1) | n/a |
| <a name="output_vnet_subnet_id_spoke2"></a> [vnet\_subnet\_id\_spoke2](#output\_vnet\_subnet\_id\_spoke2) | n/a |
<!-- END_TF_DOCS -->