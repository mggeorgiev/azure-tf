resource "azurerm_role_definition" "vnet-custom-role" {
  role_definition_id = local.uuid
  name               = "manage-vnet-custom-role"
  scope              = data.azurerm_subscription.primary.id

  permissions {
    actions = [
      "Microsoft.Network/virtualNetworks/delete",
      "Microsoft.Network/virtualNetworks/read",
      "Microsoft.Network/virtualNetworks/subnets/delete",
      "Microsoft.Network/virtualNetworks/subnets/read",
      "Microsoft.Network/virtualNetworks/subnets/write",
      "Microsoft.Network/virtualNetworks/write",
      "Microsoft.Resources/subscriptions/resourcegroups/read"
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

data "azurerm_subscription" "primary" {
}