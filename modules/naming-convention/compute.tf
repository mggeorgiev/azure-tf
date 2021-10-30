###https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming

### Compute and Web

variable "vm_name" {
    type        = string
    description = "vm<app name><###>"  
}

variable "function_name" {
    type        = string
    description = "func-<app name>-<environment>-<###>.azurewebsites.net"  
}