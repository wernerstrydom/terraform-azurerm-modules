data "azurerm_resource_group" "this" {
  name = var.name

  dynamic "timeouts" {
    for_each = var.timeouts == null ? [] : [var.timeouts]
    content {
      read = timeouts.value.read
    }
  }
}

data "azapi_resource_list" "locks" {
  count = var.include_locks ? 1 : 0

  type      = "Microsoft.Authorization/locks@2020-05-01"
  parent_id = data.azurerm_resource_group.this.id
}

module "role_assignments" {
  source = "../role_assignments"
  count  = var.include_role_assignments ? 1 : 0

  scope = data.azurerm_resource_group.this.id
}
