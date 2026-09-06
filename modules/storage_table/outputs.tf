output "id" {
  description = "The ID of the Table within the Storage Account."
  value       = azurerm_storage_table.this.id
}

output "name" {
  description = "The name of the storage table. Only Alphanumeric characters allowed, starting with a letter. Must be unique within the storage account the table is located. Changing this forces a new resource to be created."
  value       = azurerm_storage_table.this.name
}

output "resource_manager_id" {
  description = "The Resource Manager ID of this Storage Table."
  value       = azurerm_storage_table.this.resource_manager_id
}

output "storage_account_id" {
  description = "Specifies the ID of the storage account in which to create the storage table. Changing this forces a new resource to be created."
  value       = azurerm_storage_table.this.storage_account_id
}
