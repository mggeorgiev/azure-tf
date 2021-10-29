variable sto_location {
    type    = string
}

variable sto_name {
    type    = string

    validation {
        condition     = length(var.sto_name) < 3 && length(var.sto_name) > 24
        error_message = "The storage account name must be between 3 and 24 symbols."
    }

    validation {
        condition     = lower(var.sto_name) != var.sto_name
        error_message = "The storage account name must be lowercase characters."
    }

    validation {
        condition     = regex("[a-z][0-9]", var.sto_name) != var.sto_name
        error_message = "The storage account name must contain letters and numbers only."
    }

    validation {
        condition     = substr(var.sto_name, 0, 3) != "sto"
        error_message = "The storage account name must start with sto."
    }
}

variable tier {
    type        = string
    description = "account_tier"
}

variable replication_type {
    type        = string
    description = "account_replication_type"
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
