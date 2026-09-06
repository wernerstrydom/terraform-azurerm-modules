output "container_access_type" {
  description = "The Access Level configured for this Container. Possible values are `blob`, `container` or `private`. Defaults to `private`."
  value       = azurerm_storage_container.this.container_access_type
  depends_on  = [module.role_assignments]
}

output "default_encryption_scope" {
  description = "The default encryption scope to use for blobs uploaded to this container. Changing this forces a new resource to be created."
  value       = azurerm_storage_container.this.default_encryption_scope
  depends_on  = [module.role_assignments]
}

output "encryption_scope_override_enabled" {
  description = "Whether to allow blobs to override the default encryption scope for this container. Can only be set when specifying `default_encryption_scope`. Defaults to `true`. Changing this forces a new resource to be created."
  value       = azurerm_storage_container.this.encryption_scope_override_enabled
  depends_on  = [module.role_assignments]
}

output "has_immutability_policy" {
  description = "Is there an Immutability Policy configured on this Storage Container?"
  value       = azurerm_storage_container.this.has_immutability_policy
  depends_on  = [module.role_assignments]
}

output "has_legal_hold" {
  description = "Is there a Legal Hold configured on this Storage Container?"
  value       = azurerm_storage_container.this.has_legal_hold
  depends_on  = [module.role_assignments]
}

output "id" {
  description = "The ID of the Storage Container."
  value       = azurerm_storage_container.this.id
  depends_on  = [module.role_assignments]
}

output "metadata" {
  description = "A mapping of MetaData for this Container. All metadata keys should be lowercase."
  value       = azurerm_storage_container.this.metadata
  depends_on  = [module.role_assignments]
}

output "name" {
  description = "The name of the Container which should be created within the Storage Account. Changing this forces a new resource to be created."
  value       = azurerm_storage_container.this.name
  depends_on  = [module.role_assignments]
}

output "role_assignments" {
  value = module.role_assignments
}

output "storage_account_id" {
  description = "The name of the Storage Account where the Container should be created."
  value       = azurerm_storage_container.this.storage_account_id
  depends_on  = [module.role_assignments]
}

output "url" {
  description = "The data plane URL of the Storage Container in the format of `<storage blob endpoint>/<container name>`. E.g. `https://example.blob.core.windows.net/mycontainer`."
  value       = azurerm_storage_container.this.url
  depends_on  = [module.role_assignments]
}
