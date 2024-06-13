<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_container_registry_name"></a> [azure\_container\_registry\_name](#input\_azure\_container\_registry\_name) | cr<app name><environment><###> | `string` | n/a | yes |
| <a name="input_azure_cosmos_db_name"></a> [azure\_cosmos\_db\_name](#input\_azure\_cosmos\_db\_name) | cosmos-<app name>-<environment> | `string` | n/a | yes |
| <a name="input_azure_redis_instance_name"></a> [azure\_redis\_instance\_name](#input\_azure\_redis\_instance\_name) | redis-<app name>-<environment> | `string` | n/a | yes |
| <a name="input_azure_sql_db_name"></a> [azure\_sql\_db\_name](#input\_azure\_sql\_db\_name) | sqldb-<database name>-<environment> | `string` | n/a | yes |
| <a name="input_azure_sql_server_name"></a> [azure\_sql\_server\_name](#input\_azure\_sql\_server\_name) | sql-<app name>-<environment> | `string` | n/a | yes |
| <a name="input_environement"></a> [environement](#input\_environement) | Environement name. | `string` | `"production"` | no |
| <a name="input_function_name"></a> [function\_name](#input\_function\_name) | func-<app name>-<environment>-<###>.azurewebsites.net | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Resource location. | `string` | `"westeurope"` | no |
| <a name="input_nic_name"></a> [nic\_name](#input\_nic\_name) | nic-<##>-<vm name>-<subscription type>-<###> | `string` | n/a | yes |
| <a name="input_regions"></a> [regions](#input\_regions) | n/a | `map(any)` | <pre>{<br>  "Central US": "centralus",<br>  "East US": "eastus",<br>  "East US 2": "eastus2",<br>  "Global": "global",<br>  "North Europe": "northeurope",<br>  "West Europe": "westeurope"<br>}</pre> | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | rg-<app or service name>-<subscription type>-<###> | `string` | `null` | no |
| <a name="input_snet_name"></a> [snet\_name](#input\_snet\_name) | snet-<subscription type>-<region>-<###> | `string` | n/a | yes |
| <a name="input_storage_account_diagnostics_name"></a> [storage\_account\_diagnostics\_name](#input\_storage\_account\_diagnostics\_name) | stdiag<first 2 letters of subscription name and number><region><###> | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | st<storage name><###> | `string` | n/a | yes |
| <a name="input_subscription_name"></a> [subscription\_name](#input\_subscription\_name) | <business unit>-<subscription type>-<###> | `string` | `null` | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | vm<app name><###> | `string` | `null` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | vnet-<subscription type>-<region>-<###> | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_enviromenet_index"></a> [enviromenet\_index](#output\_enviromenet\_index) | A single letter environement indicator. |
| <a name="output_enviromenet_prefix"></a> [enviromenet\_prefix](#output\_enviromenet\_prefix) | A three letter environement indicator. |
| <a name="output_regions_prefixes"></a> [regions\_prefixes](#output\_regions\_prefixes) | A region abreviation. |
<!-- END_TF_DOCS -->