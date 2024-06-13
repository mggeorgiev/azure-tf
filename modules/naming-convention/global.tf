###https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming

variable "subscription_name" {
  type        = string
  description = "<business unit>-<subscription type>-<###>"
  default     = null
}

variable "resource_group_name" {
  type        = string
  description = "rg-<app or service name>-<subscription type>-<###>"
  default     = null
}

variable "regions" {
  type = map(any)
  default = {
    "Global"       = "global"
    "Central US"   = "centralus"
    "East US"      = "eastus"
    "East US 2"    = "eastus2"
    "West Europe"  = "westeurope"
    "North Europe" = "northeurope"
  }
}

variable "location" {
  description = "Resource location."
  default     = "westeurope"

  validation {
    condition = anytrue([
      var.location == "westeurope",
      var.location == "northeurope",
      var.location == "eastus",
    ])
    error_message = "Allowed values for location are: westeurope, northeurope, eastus."
  }
}

variable "environement" {
  description = "Environement name."
  default     = "production"

  validation {
    condition = anytrue([
      var.environement == "production",
      var.environement == "development",
      var.environement == "test",
    ])
    error_message = "Allowed values for environement are: development, test, production."
  }
}