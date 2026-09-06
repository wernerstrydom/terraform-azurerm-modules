resource "azurerm_role_assignment" "this" {
  condition                              = var.condition
  condition_version                      = var.condition_version
  delegated_managed_identity_resource_id = var.delegated_managed_identity_resource_id
  description                            = var.description
  name                                   = var.name
  principal_id                           = var.principal_id
  principal_type                         = var.principal_type
  role_definition_id                     = var.role_definition_id
  role_definition_name                   = var.role_definition_name
  scope                                  = var.scope
  skip_service_principal_aad_check       = var.skip_service_principal_aad_check

  dynamic "timeouts" {
    for_each = var.timeouts == null ? [] : [var.timeouts]
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
    }
  }
}
