resource "azurerm_role_definition" "manage-data-factory" {
  count              = var.deploy_custom_role != null ? 1 : 0
  role_definition_id = local.uuid
  name               = "manage-data-factory-${local.resource_group_name}"
  scope              = data.azurerm_subscription.primary.id

  permissions {
    actions = [
      "Microsoft.Resources/subscriptions/providers/read",
      "Microsoft.Resources/subscriptions/resourcegroups/delete",
      "Microsoft.Resources/subscriptions/resourcegroups/read",
      "Microsoft.Resources/subscriptions/resourcegroups/write",

      "Microsoft.Authorization/*/read",
      "Microsoft.DataFactory/dataFactories/*",
      "Microsoft.DataFactory/factories/*",
      "Microsoft.Insights/alertRules/*",
      "Microsoft.ResourceHealth/availabilityStatuses/read",
      "Microsoft.Resources/deployments/*",
      "Microsoft.Resources/subscriptions/resourceGroups/read",
      "Microsoft.Support/*",
      "Microsoft.EventGrid/eventSubscriptions/write"
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