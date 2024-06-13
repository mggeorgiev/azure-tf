###https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming

###Networking

variable "vnet_name" {
  type        = string
  description = "vnet-<subscription type>-<region>-<###>"
}

variable "snet_name" {
  type        = string
  description = "snet-<subscription type>-<region>-<###>"
}

variable "nic_name" {
  type        = string
  description = "nic-<##>-<vm name>-<subscription type>-<###>"
}