output "aggregate" {
  value = {
    id               = data.azurerm_resource_group.this.id
    location         = data.azurerm_resource_group.this.location
    locks            = try(data.azapi_resource_list.locks[0].output, null)
    managed_by       = data.azurerm_resource_group.this.managed_by
    name             = data.azurerm_resource_group.this.name
    role_assignments = try(module.role_assignments[0].aggregate, null)
    tags             = data.azurerm_resource_group.this.tags
  }
}

output "id" {
  description = "The ID of the Resource Group."
  value       = data.azurerm_resource_group.this.id
}

output "location" {
  description = "The Azure Region where the Resource Group exists."
  value       = data.azurerm_resource_group.this.location
}

output "locks" {
  value = try(data.azapi_resource_list.locks[0].output, null)
}

output "managed_by" {
  value = data.azurerm_resource_group.this.managed_by
}

output "name" {
  description = "The Name of this Resource Group."
  value       = data.azurerm_resource_group.this.name
}

output "role_assignments" {
  value = try(module.role_assignments[0].aggregate, null)
}

output "tags" {
  description = "A mapping of tags assigned to the Resource Group."
  value       = data.azurerm_resource_group.this.tags
}
