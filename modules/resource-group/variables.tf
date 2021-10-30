# variables.tf

variable "resource_group_name" {
    type = string
    description = "Resource group name"
    
    validation {
        condition     = length(var.resource_group_name) > 1 && length(var.resource_group_name) < 90
        error_message = "The lenght ofresourse group name must be between 1 and 90 characters."
    }
}

variable "resource_group_location" {
    type = string
    description = "Resource group location"
}

variable "environementtag" {
    type = string
}

variable "billing_code" {
    type = string
}

variable "regions" {
    type = map
    default = {
        "Global"        = "global"
        "Central US"    = "centralus"
        "East US"       = "eastus"
        "East US 2"     = "eastus2"
        "West Europe"   = "westeurope"
        "North Europe"  = "northeurope"
    }
}

variable "regions_prefixes" {
    type = map
    default = {
        "global"        = "glob"
        "centralus"     = "cus1"
        "eastus"        = "eus1"
        "eastus2"       = "eus2"
        "westeurope"    = "weu1"
        "northeurope"   = "neu1"
    }
}
