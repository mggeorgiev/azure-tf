resource "azurerm_role_definition" "manage-site-to-site-vpn" {
  role_definition_id = local.uuid
  name               = "manage-site-to-site-vpn"
  scope              = data.azurerm_subscription.primary.id

  permissions {
    actions = [
      "Microsoft.Network/virtualNetworks/read",
      "Microsoft.Network/virtualNetworks/subnets/delete",
      "Microsoft.Network/virtualNetworks/subnets/read",
      "Microsoft.Network/virtualNetworks/subnets/write",
      "Microsoft.Resources/subscriptions/resourcegroups/read"
      # azurerm_public_ip not implemented
      # azurerm_local_network_gateway not implemented
      # azurerm_virtual_network_gateway not implemented
      # azurerm_virtual_network_gateway_connection not implemented
    ]
    not_actions = []
  }

  assignable_scopes = [
    data.azurerm_subscription.primary.id,
  ]
}

locals {
  uuid = uuid()
}

data "azurerm_subscription" "primary" {}