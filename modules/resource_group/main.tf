resource "azurerm_resource_group" "this" {
  location   = var.location
  managed_by = var.managed_by
  name       = var.name
  tags       = var.tags

  dynamic "timeouts" {
    for_each = var.timeouts == null ? [] : [var.timeouts]
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}

module "role_assignments" {
  source   = "../role_assignment"
  for_each = var.role_assignments

  scope = azurerm_resource_group.this.id

  condition                              = each.value.condition
  condition_version                      = each.value.condition_version
  delegated_managed_identity_resource_id = each.value.delegated_managed_identity_resource_id
  description                            = each.value.description
  name                                   = each.value.name
  principal_id                           = each.value.principal_id
  principal_type                         = each.value.principal_type
  role_definition_id                     = each.value.role_definition_id
  role_definition_name                   = each.value.role_definition_name
  skip_service_principal_aad_check       = each.value.skip_service_principal_aad_check
  timeouts                               = each.value.timeouts
}

module "locks" {
  source   = "../management_lock"
  for_each = var.locks

  scope = azurerm_resource_group.this.id

  lock_level = each.value.lock_level
  name       = each.value.name
  notes      = each.value.notes
  timeouts   = each.value.timeouts
}
