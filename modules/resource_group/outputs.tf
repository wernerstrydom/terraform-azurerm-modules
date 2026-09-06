output "id" {
  description = "The ID of the Resource Group."
  value       = azurerm_resource_group.this.id
  depends_on  = [module.role_assignments, module.locks]
}

output "location" {
  description = "The Azure Region where the Resource Group should exist. Changing this forces a new Resource Group to be created."
  value       = azurerm_resource_group.this.location
  depends_on  = [module.role_assignments, module.locks]
}

output "locks" {
  value = module.locks
}

output "managed_by" {
  description = "The ID of the resource or application that manages this Resource Group."
  value       = azurerm_resource_group.this.managed_by
  depends_on  = [module.role_assignments, module.locks]
}

output "name" {
  description = "The Name which should be used for this Resource Group. Changing this forces a new Resource Group to be created."
  value       = azurerm_resource_group.this.name
  depends_on  = [module.role_assignments, module.locks]
}

output "role_assignments" {
  value = module.role_assignments
}

output "tags" {
  description = "A mapping of tags which should be assigned to the Resource Group."
  value       = azurerm_resource_group.this.tags
  depends_on  = [module.role_assignments, module.locks]
}
