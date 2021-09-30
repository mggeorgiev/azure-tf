# Azure load balancer module
data "azurerm_resource_group" "azlb" {
  name = var.resource_group_name
}

locals {
  lb_name  = var.name != "" ? var.name : format("%s-lb", var.prefix)
  pip_name = var.pip_name != "" ? var.pip_name : format("%s-publicIP", var.prefix)
}

resource "azurerm_public_ip" "azlb" {
  count               = var.type == "public" ? 1 : 0
  name                = local.pip_name
  resource_group_name = data.azurerm_resource_group.azlb.name
  location            = coalesce(var.location, data.azurerm_resource_group.azlb.location)
  allocation_method   = var.allocation_method
  sku                 = var.pip_sku
  tags                = var.tags
}

resource "azurerm_lb" "azlb" {
  name                = local.lb_name
  resource_group_name = data.azurerm_resource_group.azlb.name
  location            = coalesce(var.location, data.azurerm_resource_group.azlb.location)
  sku                 = var.lb_sku
  tags                = var.tags

  frontend_ip_configuration {
    name                          = var.frontend_name
    public_ip_address_id          = var.type == "public" ? join("", azurerm_public_ip.azlb.*.id) : ""
    subnet_id                     = var.frontend_subnet_id
    private_ip_address            = var.frontend_private_ip_address
    private_ip_address_allocation = var.frontend_private_ip_address_allocation
  }
}

resource "azurerm_lb_backend_address_pool" "azlb" {
  name                = "BackEndAddressPool"
  loadbalancer_id     = azurerm_lb.azlb.id
  resource_group_name = var.resource_group_name
}

resource "azurerm_lb_nat_rule" "azlb" {
  count                          = length(var.remote_port)
  name                           = "VM-${count.index}"
  resource_group_name            = data.azurerm_resource_group.azlb.name
  loadbalancer_id                = azurerm_lb.azlb.id
  protocol                       = "tcp"
  frontend_port                  = "5000${count.index + 1}"
  backend_port                   = element(var.remote_port[element(keys(var.remote_port), count.index)], 1)
  frontend_ip_configuration_name = var.frontend_name
}

resource "azurerm_lb_probe" "azlb" {
  count               = length(var.lb_probe)
  name                = element(keys(var.lb_probe), count.index)
  resource_group_name = data.azurerm_resource_group.azlb.name
  loadbalancer_id     = azurerm_lb.azlb.id
  protocol            = element(var.lb_probe[element(keys(var.lb_probe), count.index)], 0)
  port                = element(var.lb_probe[element(keys(var.lb_probe), count.index)], 1)
  interval_in_seconds = var.lb_probe_interval
  number_of_probes    = var.lb_probe_unhealthy_threshold
  request_path        = element(var.lb_probe[element(keys(var.lb_probe), count.index)], 2)
}

resource "azurerm_lb_rule" "azlb" {
  count                          = length(var.lb_port)
  name                           = element(keys(var.lb_port), count.index)
  resource_group_name            = data.azurerm_resource_group.azlb.name
  loadbalancer_id                = azurerm_lb.azlb.id
  protocol                       = element(var.lb_port[element(keys(var.lb_port), count.index)], 1)
  frontend_port                  = element(var.lb_port[element(keys(var.lb_port), count.index)], 0)
  backend_port                   = element(var.lb_port[element(keys(var.lb_port), count.index)], 2)
  frontend_ip_configuration_name = var.frontend_name
  enable_floating_ip             = false
  backend_address_pool_id        = azurerm_lb_backend_address_pool.azlb.id
  idle_timeout_in_minutes        = 5
  probe_id                       = element(azurerm_lb_probe.azlb.*.id, count.index)
}

### Variables

variable "location" {
  description = "(Optional) The location/region where the core network will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group where the load balancer resources will be imported."
  type        = string
  default     = "rsg-outsystems-weu1-p-001"
}

variable "prefix" {
  description = "(Required) Default prefix to use with your resource names."
  type        = string
  default     = "azure_lb"
}

variable "remote_port" {
  description = "Protocols to be used for remote vm access. [protocol, backend_port].  Frontend port will be automatically generated starting at 50000 and in the output."
  type        = map(any)
  default     = {}
}

variable "lb_port" {
  description = "Protocols to be used for lb rules. Format as [frontend_port, protocol, backend_port]"
  type        = map(any)
  default     = {}
}

variable "lb_probe_unhealthy_threshold" {
  description = "Number of times the load balancer health probe has an unsuccessful attempt before considering the endpoint unhealthy."
  type        = number
  default     = 2
}

variable "lb_probe_interval" {
  description = "Interval in seconds the load balancer health probe rule does a check"
  type        = number
  default     = 5
}

variable "frontend_name" {
  description = "(Required) Specifies the name of the frontend ip configuration."
  type        = string
  default     = "myPublicIP"
}

variable "allocation_method" {
  description = "(Required) Defines how an IP address is assigned. Options are Static or Dynamic."
  type        = string
  default     = "Static"
}

variable "tags" {
  type = map(string)

  default = {
    source = "terraform"
  }
}

variable "type" {
  description = "(Optional) Defined if the loadbalancer is private or public"
  type        = string
  default     = "private"
}

variable "frontend_subnet_id" {
  description = "(Optional) Frontend subnet id to use when in private mode"
  type        = string
  default     = "/subscriptions/cf2aa82c-ec73-4555-932a-6adbf20aa6d8/resourceGroups/hub-spoke/providers/Microsoft.Network/virtualNetworks/spoke2-vnet/subnets/spoke2-subnet"
}


variable "frontend_private_ip_address" {
  description = "(Optional) Private ip address to assign to frontend. Use it with type = private"
  type        = string
  default     = "10.52.2.10"
}

variable "frontend_private_ip_address_allocation" {
  description = "(Optional) Frontend ip allocation type (Static or Dynamic)"
  type        = string
  default     = "Dynamic"
}

variable "lb_sku" {
  description = "(Optional) The SKU of the Azure Load Balancer. Accepted values are Basic and Standard."
  type        = string
  default     = "Basic"
}

variable "lb_probe" {
  description = "(Optional) Protocols to be used for lb health probes. Format as [protocol, port, request_path]"
  type        = map(any)
  default     = {}
}

variable "pip_sku" {
  description = "(Optional) The SKU of the Azure Public IP. Accepted values are Basic and Standard."
  type        = string
  default     = "Basic"
}

variable "name" {
  description = "(Optional) Name of the load balancer. If it is set, the 'prefix' variable will be ignored."
  type        = string
  default     = "outsystems"
}

variable "pip_name" {
  description = "(Optional) Name of public ip. If it is set, the 'prefix' variable will be ignored."
  type        = string
  default     = ""
}