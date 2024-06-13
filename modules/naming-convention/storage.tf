###https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming

variable "storage_account_name" {
  type        = string
  description = "st<storage name><###>"
}

variable "storage_account_diagnostics_name" {
  type        = string
  description = "stdiag<first 2 letters of subscription name and number><region><###>"
}

variable "azure_container_registry_name" {
  type        = string
  description = "cr<app name><environment><###>"
}