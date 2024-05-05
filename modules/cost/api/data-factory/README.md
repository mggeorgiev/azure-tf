<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~>3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~>3.0 |
| <a name="provider_random"></a> [random](#provider\_random) | ~>3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_data_factory.df](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_role_definition.manage-data-factory](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition) | resource |
| [random_pet.rg_name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |
| [random_string.azurerm_data_factory_name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [azurerm_subscription.primary](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing-code"></a> [billing-code](#input\_billing-code) | The billing code for the environement. | `string` | `"000"` | no |
| <a name="input_deploy_custom_role"></a> [deploy\_custom\_role](#input\_deploy\_custom\_role) | (Optional) If set to true a custom role will be deployed. | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environement type. Please choose from: lab, development, staging, production. | `string` | `"staging"` | no |
| <a name="input_location"></a> [location](#input\_location) | Location for all resources. | `string` | `"eastus"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Optional) the name of the resource group. If not provided a default one will be created. | `string` | `null` | no |
| <a name="input_resource_group_name_prefix"></a> [resource\_group\_name\_prefix](#input\_resource\_group\_name\_prefix) | Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription. | `string` | `"rg"` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | The sku name of the Azure Analysis Services server to create. Choose from: B1, B2, D1, S0, S1, S2, S3, S4, S8, S9. Some skus are region specific. See https://docs.microsoft.com/en-us/azure/analysis-services/analysis-services-overview#availability-by-region | `string` | `"S0"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azurerm_data_factory_id"></a> [azurerm\_data\_factory\_id](#output\_azurerm\_data\_factory\_id) | The ID of the Data Factory. |
| <a name="output_azurerm_data_factory_identity"></a> [azurerm\_data\_factory\_identity](#output\_azurerm\_data\_factory\_identity) | The ID of the Data Factory. |
| <a name="output_azurerm_data_factory_principal_id"></a> [azurerm\_data\_factory\_principal\_id](#output\_azurerm\_data\_factory\_principal\_id) | The Principal ID associated with this Managed Service Identity. |
| <a name="output_azurerm_data_factory_tenant_id"></a> [azurerm\_data\_factory\_tenant\_id](#output\_azurerm\_data\_factory\_tenant\_id) | The Tenant ID associated with this Managed Service Identity. |
| <a name="output_azurerm_role_definition_name"></a> [azurerm\_role\_definition\_name](#output\_azurerm\_role\_definition\_name) | The document intelligence custom role name. |
| <a name="output_azurerm_role_definition_uuid"></a> [azurerm\_role\_definition\_uuid](#output\_azurerm\_role\_definition\_uuid) | The document intelligence custom role uuid. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | The resource group name that where the resoruces are deployed. |
<!-- END_TF_DOCS -->