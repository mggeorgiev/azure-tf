###https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming

variable "subscription_name" {
    type        = string
    description = "<business unit>-<subscription type>-<###>"
}

variable "resource_group_name" {
    type        = string
    description = "rg-<app or service name>-<subscription type>-<###>"
}