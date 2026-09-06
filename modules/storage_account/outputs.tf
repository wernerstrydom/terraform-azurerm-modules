output "access_tier" {
  description = "Defines the access tier for `BlobStorage`, `FileStorage` and `StorageV2` accounts. Valid options are `Hot`, `Cool`, `Cold`, `Smart` and `Premium`. Defaults to `Hot`."
  value       = azurerm_storage_account.this.access_tier
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "account_kind" {
  description = "Defines the Kind of account. Valid options are `BlobStorage`, `BlockBlobStorage`, `FileStorage`, `Storage` and `StorageV2`. Defaults to `StorageV2`."
  value       = azurerm_storage_account.this.account_kind
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "account_replication_type" {
  description = "Defines the type of replication to use for this storage account. Valid options are `LRS`, `GRS`, `RAGRS`, `ZRS`, `GZRS` and `RAGZRS`. Changing this forces a new resource to be created when types `LRS`, `GRS` and `RAGRS` are changed to `ZRS`, `GZRS` or `RAGZRS` and vice versa."
  value       = azurerm_storage_account.this.account_replication_type
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "account_tier" {
  description = "Defines the Tier to use for this storage account. Valid options are `Standard` and `Premium`. For `BlockBlobStorage` and `FileStorage` accounts only `Premium` is valid. Changing this forces a new resource to be created."
  value       = azurerm_storage_account.this.account_tier
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "allow_nested_items_to_be_public" {
  description = "Allow or disallow nested items within this Account to opt into being public. Defaults to `true`."
  value       = azurerm_storage_account.this.allow_nested_items_to_be_public
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "allowed_copy_scope" {
  description = "The permitted scope for copy operations between storage accounts. Possible values are `AAD`, `PrivateLink` and `All`."
  value       = azurerm_storage_account.this.allowed_copy_scope
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "containers" {
  value = module.containers
}

output "cross_tenant_replication_enabled" {
  description = "Should cross Tenant replication be enabled? Defaults to `false`."
  value       = azurerm_storage_account.this.cross_tenant_replication_enabled
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "default_to_oauth_authentication" {
  description = "Default to Azure Active Directory authorization in the Azure portal when accessing the Storage Account. The default value is `false`"
  value       = azurerm_storage_account.this.default_to_oauth_authentication
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "dns_endpoint_type" {
  description = "Specifies which DNS endpoint type to use. Possible values are `Standard` and `AzureDnsZone`. Defaults to `Standard`. Changing this forces a new resource to be created."
  value       = azurerm_storage_account.this.dns_endpoint_type
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "edge_zone" {
  description = "Specifies the Edge Zone within the Azure Region where this Storage Account should exist. Changing this forces a new Storage Account to be created."
  value       = azurerm_storage_account.this.edge_zone
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "https_traffic_only_enabled" {
  description = "Boolean flag which forces HTTPS if enabled, see here for more information. Defaults to `true`."
  value       = azurerm_storage_account.this.https_traffic_only_enabled
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "id" {
  description = "The ID of the Storage Account."
  value       = azurerm_storage_account.this.id
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "infrastructure_encryption_enabled" {
  description = "Is infrastructure encryption enabled? Changing this forces a new resource to be created. Defaults to `false`."
  value       = azurerm_storage_account.this.infrastructure_encryption_enabled
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "is_hns_enabled" {
  description = "Is Hierarchical Namespace enabled? This can be used with Azure Data Lake Storage Gen 2 (see here for more information). Changing this forces a new resource to be created."
  value       = azurerm_storage_account.this.is_hns_enabled
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "large_file_share_enabled" {
  description = "Are Large File Shares Enabled? Defaults to `false`."
  value       = azurerm_storage_account.this.large_file_share_enabled
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "local_user_enabled" {
  description = "Is Local User Enabled? Defaults to `true`."
  value       = azurerm_storage_account.this.local_user_enabled
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  value       = azurerm_storage_account.this.location
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "locks" {
  value = module.locks
}

output "min_tls_version" {
  description = "The minimum supported TLS version for the storage account. Possible values are `TLS1_0`, `TLS1_1` and `TLS1_2`. Defaults to `TLS1_2` for new storage accounts."
  value       = azurerm_storage_account.this.min_tls_version
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "name" {
  description = "Specifies the name of the storage account. Only lowercase Alphanumeric characters allowed. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group."
  value       = azurerm_storage_account.this.name
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "nfsv3_enabled" {
  description = "Is NFSv3 protocol enabled? Changing this forces a new resource to be created. Defaults to `false`."
  value       = azurerm_storage_account.this.nfsv3_enabled
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_access_key" {
  description = "The primary access key for the storage account."
  value       = azurerm_storage_account.this.primary_access_key
  sensitive   = true
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_blob_connection_string" {
  description = "The connection string associated with the primary blob location."
  value       = azurerm_storage_account.this.primary_blob_connection_string
  sensitive   = true
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_blob_endpoint" {
  description = "The endpoint URL for blob storage in the primary location."
  value       = azurerm_storage_account.this.primary_blob_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_blob_host" {
  description = "The hostname with port if applicable for blob storage in the primary location."
  value       = azurerm_storage_account.this.primary_blob_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_blob_internet_endpoint" {
  description = "The internet routing endpoint URL for blob storage in the primary location."
  value       = azurerm_storage_account.this.primary_blob_internet_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_blob_internet_host" {
  description = "The internet routing hostname with port if applicable for blob storage in the primary location."
  value       = azurerm_storage_account.this.primary_blob_internet_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_blob_microsoft_endpoint" {
  description = "The microsoft routing endpoint URL for blob storage in the primary location."
  value       = azurerm_storage_account.this.primary_blob_microsoft_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_blob_microsoft_host" {
  description = "The microsoft routing hostname with port if applicable for blob storage in the primary location."
  value       = azurerm_storage_account.this.primary_blob_microsoft_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_connection_string" {
  description = "The connection string associated with the primary location."
  value       = azurerm_storage_account.this.primary_connection_string
  sensitive   = true
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_dfs_endpoint" {
  description = "The endpoint URL for DFS storage in the primary location."
  value       = azurerm_storage_account.this.primary_dfs_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_dfs_host" {
  description = "The hostname with port if applicable for DFS storage in the primary location."
  value       = azurerm_storage_account.this.primary_dfs_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_dfs_internet_endpoint" {
  description = "The internet routing endpoint URL for DFS storage in the primary location."
  value       = azurerm_storage_account.this.primary_dfs_internet_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_dfs_internet_host" {
  description = "The internet routing hostname with port if applicable for DFS storage in the primary location."
  value       = azurerm_storage_account.this.primary_dfs_internet_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_dfs_microsoft_endpoint" {
  description = "The microsoft routing endpoint URL for DFS storage in the primary location."
  value       = azurerm_storage_account.this.primary_dfs_microsoft_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_dfs_microsoft_host" {
  description = "The microsoft routing hostname with port if applicable for DFS storage in the primary location."
  value       = azurerm_storage_account.this.primary_dfs_microsoft_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_file_endpoint" {
  description = "The endpoint URL for file storage in the primary location."
  value       = azurerm_storage_account.this.primary_file_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_file_host" {
  description = "The hostname with port if applicable for file storage in the primary location."
  value       = azurerm_storage_account.this.primary_file_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_file_internet_endpoint" {
  description = "The internet routing endpoint URL for file storage in the primary location."
  value       = azurerm_storage_account.this.primary_file_internet_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_file_internet_host" {
  description = "The internet routing hostname with port if applicable for file storage in the primary location."
  value       = azurerm_storage_account.this.primary_file_internet_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_file_microsoft_endpoint" {
  description = "The microsoft routing endpoint URL for file storage in the primary location."
  value       = azurerm_storage_account.this.primary_file_microsoft_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_file_microsoft_host" {
  description = "The microsoft routing hostname with port if applicable for file storage in the primary location."
  value       = azurerm_storage_account.this.primary_file_microsoft_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_location" {
  description = "The primary location of the storage account."
  value       = azurerm_storage_account.this.primary_location
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_queue_endpoint" {
  description = "The endpoint URL for queue storage in the primary location."
  value       = azurerm_storage_account.this.primary_queue_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_queue_host" {
  description = "The hostname with port if applicable for queue storage in the primary location."
  value       = azurerm_storage_account.this.primary_queue_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_queue_microsoft_endpoint" {
  description = "The microsoft routing endpoint URL for queue storage in the primary location."
  value       = azurerm_storage_account.this.primary_queue_microsoft_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_queue_microsoft_host" {
  description = "The microsoft routing hostname with port if applicable for queue storage in the primary location."
  value       = azurerm_storage_account.this.primary_queue_microsoft_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_table_endpoint" {
  description = "The endpoint URL for table storage in the primary location."
  value       = azurerm_storage_account.this.primary_table_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_table_host" {
  description = "The hostname with port if applicable for table storage in the primary location."
  value       = azurerm_storage_account.this.primary_table_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_table_microsoft_endpoint" {
  description = "The microsoft routing endpoint URL for table storage in the primary location."
  value       = azurerm_storage_account.this.primary_table_microsoft_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_table_microsoft_host" {
  description = "The microsoft routing hostname with port if applicable for table storage in the primary location."
  value       = azurerm_storage_account.this.primary_table_microsoft_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_web_endpoint" {
  description = "The endpoint URL for web storage in the primary location."
  value       = azurerm_storage_account.this.primary_web_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_web_host" {
  description = "The hostname with port if applicable for web storage in the primary location."
  value       = azurerm_storage_account.this.primary_web_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_web_internet_endpoint" {
  description = "The internet routing endpoint URL for web storage in the primary location."
  value       = azurerm_storage_account.this.primary_web_internet_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_web_internet_host" {
  description = "The internet routing hostname with port if applicable for web storage in the primary location."
  value       = azurerm_storage_account.this.primary_web_internet_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_web_microsoft_endpoint" {
  description = "The microsoft routing endpoint URL for web storage in the primary location."
  value       = azurerm_storage_account.this.primary_web_microsoft_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "primary_web_microsoft_host" {
  description = "The microsoft routing hostname with port if applicable for web storage in the primary location."
  value       = azurerm_storage_account.this.primary_web_microsoft_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "provisioned_billing_model_version" {
  description = "Specifies the version of the **provisioned** billing model (e.g. when `account_kind = \"FileStorage\"` for Storage File). Possible value is `V2`. Changing this forces a new resource to be created."
  value       = azurerm_storage_account.this.provisioned_billing_model_version
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "public_network_access_enabled" {
  description = "Whether the public network access is enabled? Defaults to `true`."
  value       = azurerm_storage_account.this.public_network_access_enabled
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "queue_encryption_key_type" {
  description = "The encryption type of the queue service. Possible values are `Service` and `Account`. Changing this forces a new resource to be created. Default value is `Service`."
  value       = azurerm_storage_account.this.queue_encryption_key_type
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "queues" {
  value = module.queues
}

output "resource_group_name" {
  description = "The name of the resource group in which to create the storage account. Changing this forces a new resource to be created."
  value       = azurerm_storage_account.this.resource_group_name
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "role_assignments" {
  value = module.role_assignments
}

output "secondary_access_key" {
  description = "The secondary access key for the storage account."
  value       = azurerm_storage_account.this.secondary_access_key
  sensitive   = true
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_blob_connection_string" {
  description = "The connection string associated with the secondary blob location."
  value       = azurerm_storage_account.this.secondary_blob_connection_string
  sensitive   = true
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_blob_endpoint" {
  description = "The endpoint URL for blob storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_blob_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_blob_host" {
  description = "The hostname with port if applicable for blob storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_blob_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_blob_internet_endpoint" {
  description = "The internet routing endpoint URL for blob storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_blob_internet_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_blob_internet_host" {
  description = "The internet routing hostname with port if applicable for blob storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_blob_internet_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_blob_microsoft_endpoint" {
  description = "The microsoft routing endpoint URL for blob storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_blob_microsoft_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_blob_microsoft_host" {
  description = "The microsoft routing hostname with port if applicable for blob storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_blob_microsoft_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_connection_string" {
  description = "The connection string associated with the secondary location."
  value       = azurerm_storage_account.this.secondary_connection_string
  sensitive   = true
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_dfs_endpoint" {
  description = "The endpoint URL for DFS storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_dfs_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_dfs_host" {
  description = "The hostname with port if applicable for DFS storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_dfs_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_dfs_internet_endpoint" {
  description = "The internet routing endpoint URL for DFS storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_dfs_internet_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_dfs_internet_host" {
  description = "The internet routing hostname with port if applicable for DFS storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_dfs_internet_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_dfs_microsoft_endpoint" {
  description = "The microsoft routing endpoint URL for DFS storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_dfs_microsoft_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_dfs_microsoft_host" {
  description = "The microsoft routing hostname with port if applicable for DFS storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_dfs_microsoft_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_file_endpoint" {
  description = "The endpoint URL for file storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_file_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_file_host" {
  description = "The hostname with port if applicable for file storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_file_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_file_internet_endpoint" {
  description = "The internet routing endpoint URL for file storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_file_internet_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_file_internet_host" {
  description = "The internet routing hostname with port if applicable for file storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_file_internet_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_file_microsoft_endpoint" {
  description = "The microsoft routing endpoint URL for file storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_file_microsoft_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_file_microsoft_host" {
  description = "The microsoft routing hostname with port if applicable for file storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_file_microsoft_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_location" {
  description = "The secondary location of the storage account."
  value       = azurerm_storage_account.this.secondary_location
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_queue_endpoint" {
  description = "The endpoint URL for queue storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_queue_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_queue_host" {
  description = "The hostname with port if applicable for queue storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_queue_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_queue_microsoft_endpoint" {
  description = "The microsoft routing endpoint URL for queue storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_queue_microsoft_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_queue_microsoft_host" {
  description = "The microsoft routing hostname with port if applicable for queue storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_queue_microsoft_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_table_endpoint" {
  description = "The endpoint URL for table storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_table_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_table_host" {
  description = "The hostname with port if applicable for table storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_table_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_table_microsoft_endpoint" {
  description = "The microsoft routing endpoint URL for table storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_table_microsoft_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_table_microsoft_host" {
  description = "The microsoft routing hostname with port if applicable for table storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_table_microsoft_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_web_endpoint" {
  description = "The endpoint URL for web storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_web_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_web_host" {
  description = "The hostname with port if applicable for web storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_web_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_web_internet_endpoint" {
  description = "The internet routing endpoint URL for web storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_web_internet_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_web_internet_host" {
  description = "The internet routing hostname with port if applicable for web storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_web_internet_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_web_microsoft_endpoint" {
  description = "The microsoft routing endpoint URL for web storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_web_microsoft_endpoint
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "secondary_web_microsoft_host" {
  description = "The microsoft routing hostname with port if applicable for web storage in the secondary location."
  value       = azurerm_storage_account.this.secondary_web_microsoft_host
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "sftp_enabled" {
  description = "Boolean, enable SFTP for the storage account"
  value       = azurerm_storage_account.this.sftp_enabled
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "shared_access_key_enabled" {
  description = "Indicates whether the storage account permits requests to be authorized with the account access key via Shared Key. If false, then all requests, including shared access signatures, must be authorized with Azure Active Directory (Azure AD). Defaults to `true`."
  value       = azurerm_storage_account.this.shared_access_key_enabled
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "table_encryption_key_type" {
  description = "The encryption type of the table service. Possible values are `Service` and `Account`. Changing this forces a new resource to be created. Default value is `Service`."
  value       = azurerm_storage_account.this.table_encryption_key_type
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}

output "tables" {
  value = module.tables
}

output "tags" {
  description = "A mapping of tags to assign to the resource."
  value       = azurerm_storage_account.this.tags
  depends_on  = [module.role_assignments, module.locks, module.containers, module.tables, module.queues]
}
