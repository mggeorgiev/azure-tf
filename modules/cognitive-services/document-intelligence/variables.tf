variable "location" {
  type        = string
  description = "Location for all resources."
  default     = "eastus"
}

variable "deploy_custom_role" {
  type        = bool
  description = "(Optional) If set to true a custom role will be deployed."
  default     = false
}

variable "resource_group_name" {
  type        = string
  description = "(Optional) the name of the resource group. If not provided a default one will be created."
  default     = null
}

variable "resource_group_name_prefix" {
  type        = string
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
  default     = "rg"
}

variable "sku" {
  type        = string
  description = "The sku name of the Azure Analysis Services server to create. Choose from: B1, B2, D1, S0, S1, S2, S3, S4, S8, S9. Some skus are region specific. See https://docs.microsoft.com/en-us/azure/analysis-services/analysis-services-overview#availability-by-region"
  default     = "S0"

  validation {
    condition = anytrue([
      var.sku == "B1",
      var.sku == "B2",
      var.sku == "D1",
      var.sku == "S0",
      var.sku == "S1",
      var.sku == "S2",
      var.sku == "S3",
      var.sku == "S4",
      var.sku == "S8",
      var.sku == "S9"
    ])
    error_message = "Invalid SKU. Please choose from: B1, B2, D1, S0, S1, S2, S3, S4, S8, S9."
  }
}

variable "environment" {
  type        = string
  description = "The environement type. Please choose from: lab, development, staging, production."
  default     = "staging"

  validation {
    condition = anytrue([
      var.environment == "staging",
      var.environment == "development",
      var.environment == "lab",
      var.environment == "production",
    ])
    error_message = "Invalid ENVIRONEMENT. Please choose from: lab, development, staging, production."
  }
}

variable "billing-code" {
  type        = string
  description = "The billing code for the environement."
  default     = "000"
} 