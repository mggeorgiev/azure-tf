locals {
  tags = {
    environment  = var.environment
    billing-code = var.billing-code
    lifecycle    = "pipeline"
    IaC          = "openTofu"
  }

  resource_group_name = var.resource_group_name == null ? azurerm_resource_group.rg.name : var.resource_group_name
}