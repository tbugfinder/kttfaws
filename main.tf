#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition
#

data "azurerm_subscription" "primary" {
}

resource "azurerm_role_definition" "this" {
  name        = "my-custom-role-in-kttfazure"
  scope       = data.azurerm_subscription.primary.id
  description = "This is a custom role created via Terraform"

  permissions {
    actions     = ["*"]
    not_actions = []
  }

  assignable_scopes = [
    data.azurerm_subscription.primary.id, # /subscriptions/00000000-0000-0000-0000-000000000000
  ]
}
