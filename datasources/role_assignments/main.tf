data "azurerm_role_assignments" "this" {
  limit_at_scope = var.limit_at_scope
  principal_id   = var.principal_id
  scope          = var.scope
  tenant_id      = var.tenant_id

  dynamic "timeouts" {
    for_each = var.timeouts == null ? [] : [var.timeouts]
    content {
      read = timeouts.value.read
    }
  }
}
