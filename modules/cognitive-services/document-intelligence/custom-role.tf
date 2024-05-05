resource "azurerm_role_definition" "manage-document-intelligence" {
  count              = var.deploy_custom_role != null ? 1 : 0
  role_definition_id = local.uuid
  name               = "manage-document-intelligence-${local.resource_group_name}"
  scope              = data.azurerm_subscription.primary.id

  permissions {
    actions = [
      "Microsoft.CognitiveServices/accounts/delete",
      "Microsoft.CognitiveServices/accounts/listKeys/action",
      "Microsoft.CognitiveServices/accounts/read",
      "Microsoft.CognitiveServices/accounts/write",
      "Microsoft.CognitiveServices/locations/resourceGroups/deletedAccounts/delete",
      "Microsoft.CognitiveServices/locations/resourceGroups/deletedAccounts/read",
      "Microsoft.Resources/subscriptions/providers/read",
      "Microsoft.Resources/subscriptions/resourcegroups/delete",
      "Microsoft.Resources/subscriptions/resourcegroups/read",
      "Microsoft.Resources/subscriptions/resourcegroups/write"
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