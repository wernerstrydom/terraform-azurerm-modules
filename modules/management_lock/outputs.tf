output "id" {
  description = "The ID of the Management Lock"
  value       = azurerm_management_lock.this.id
}

output "lock_level" {
  description = "Specifies the Level to be used for this Lock. Possible values are `CanNotDelete` and `ReadOnly`. Changing this forces a new resource to be created."
  value       = azurerm_management_lock.this.lock_level
}

output "name" {
  description = "Specifies the name of the Management Lock. Changing this forces a new resource to be created."
  value       = azurerm_management_lock.this.name
}

output "notes" {
  description = "Specifies some notes about the lock. Maximum of 512 characters. Changing this forces a new resource to be created."
  value       = azurerm_management_lock.this.notes
}

output "scope" {
  description = "Specifies the scope at which the Management Lock should be created. Changing this forces a new resource to be created."
  value       = azurerm_management_lock.this.scope
}
