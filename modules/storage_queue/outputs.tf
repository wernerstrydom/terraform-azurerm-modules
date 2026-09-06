output "id" {
  description = "The ID of the Storage Queue."
  value       = azurerm_storage_queue.this.id
}

output "metadata" {
  description = "A mapping of MetaData which should be assigned to this Storage Queue."
  value       = azurerm_storage_queue.this.metadata
}

output "name" {
  description = "The name of the Queue which should be created within the Storage Account. Must be unique within the storage account the queue is located. Changing this forces a new resource to be created."
  value       = azurerm_storage_queue.this.name
}

output "storage_account_id" {
  description = "The name of the Storage Account where the Storage Queue should be created."
  value       = azurerm_storage_queue.this.storage_account_id
}

output "url" {
  description = "The data plane URL of the Storage Queue in the format of `<storage queue endpoint>/<queue name>`. E.g. `https://example.queue.core.windows.net/queue1`."
  value       = azurerm_storage_queue.this.url
}
