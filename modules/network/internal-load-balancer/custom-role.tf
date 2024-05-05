resource "azurerm_role_definition" "manage-internal-lb" {
  role_definition_id = local.uuid
  name               = "manage-internal-lb"
  scope              = data.azurerm_subscription.primary.id

  permissions {
    actions = [
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

data "azurerm_subscription" "primary" {}