variable storage_account_location {
    type    = string
}

variable storage_account_name {
    type    = string

    # validation {
    #     condition     = length(var.storage_account_name) < 3 && length(var.storage_account_name) > 24
    #     error_message = "The storage account name must be between 3 and 24 symbols."
    # }

    # validation {
    #     condition     = lower(var.storage_account_name) != var.sto_name
    #     error_message = "The storage account name must be lowercase characters."
    # }

    # validation {
    #     condition     = regex("[a-z][0-9]", var.storage_account_name) != var.storage_account_name
    #     error_message = "The storage account name must contain letters and numbers only."
    # }

    # validation {
    #     condition     = substr(var.storage_account_name, 0, 3) != "sto"
    #     error_message = "The storage account name must start with sto."
    # }
}

variable "account_tier" {
    type    = string
    default = "Standard"
}

variable "account_replication_type" {
    type    = string
    default = "LRS"
}

variable resource_group {
    type    = string
}

### Common TAGS

variable environementtag {
    type    = string
}

variable billing-code {
    type    = string
}

variable "custom_tags" {
    type        = map(string)
    description = "Tags to set for all resources"
}
