variable "access_tier" {
  description = "Defines the access tier for `BlobStorage`, `FileStorage` and `StorageV2` accounts. Valid options are `Hot`, `Cool`, `Cold`, `Smart` and `Premium`. Defaults to `Hot`."
  type        = string
  default     = null

  validation {
    condition     = var.access_tier == null || contains(["Hot", "Cool", "Cold", "Smart", "Premium"], var.access_tier)
    error_message = "The access_tier value must be one of: Hot, Cool, Cold, Smart, Premium (per the provider documentation)."
  }
}

variable "account_kind" {
  description = "Defines the Kind of account. Valid options are `BlobStorage`, `BlockBlobStorage`, `FileStorage`, `Storage` and `StorageV2`. Defaults to `StorageV2`."
  type        = string
  default     = null

  validation {
    condition     = var.account_kind == null || contains(["BlobStorage", "BlockBlobStorage", "FileStorage", "Storage", "StorageV2"], var.account_kind)
    error_message = "The account_kind value must be one of: BlobStorage, BlockBlobStorage, FileStorage, Storage, StorageV2 (per the provider documentation)."
  }
}

variable "account_replication_type" {
  description = "Defines the type of replication to use for this storage account. Valid options are `LRS`, `GRS`, `RAGRS`, `ZRS`, `GZRS` and `RAGZRS`. Changing this forces a new resource to be created when types `LRS`, `GRS` and `RAGRS` are changed to `ZRS`, `GZRS` or `RAGZRS` and vice versa."
  type        = string

  validation {
    condition     = var.account_replication_type == null || contains(["LRS", "GRS", "RAGRS", "ZRS", "GZRS", "RAGZRS"], var.account_replication_type)
    error_message = "The account_replication_type value must be one of: LRS, GRS, RAGRS, ZRS, GZRS, RAGZRS (per the provider documentation)."
  }
}

variable "account_tier" {
  description = "Defines the Tier to use for this storage account. Valid options are `Standard` and `Premium`. For `BlockBlobStorage` and `FileStorage` accounts only `Premium` is valid. Changing this forces a new resource to be created."
  type        = string

  validation {
    condition     = var.account_tier == null || contains(["Standard", "Premium"], var.account_tier)
    error_message = "The account_tier value must be one of: Standard, Premium (per the provider documentation)."
  }
}

variable "allow_nested_items_to_be_public" {
  description = "Allow or disallow nested items within this Account to opt into being public. Defaults to `true`."
  type        = bool
  default     = false
}

variable "allowed_copy_scope" {
  description = "The permitted scope for copy operations between storage accounts. Possible values are `AAD`, `PrivateLink` and `All`."
  type        = string
  default     = null

  validation {
    condition     = var.allowed_copy_scope == null || contains(["AAD", "PrivateLink", "All"], var.allowed_copy_scope)
    error_message = "The allowed_copy_scope value must be one of: AAD, PrivateLink, All (per the provider documentation)."
  }
}

variable "cross_tenant_replication_enabled" {
  description = "Should cross Tenant replication be enabled? Defaults to `false`."
  type        = bool
  default     = null
}

variable "default_to_oauth_authentication" {
  description = "Default to Azure Active Directory authorization in the Azure portal when accessing the Storage Account. The default value is `false`"
  type        = bool
  default     = true
}

variable "dns_endpoint_type" {
  description = "Specifies which DNS endpoint type to use. Possible values are `Standard` and `AzureDnsZone`. Defaults to `Standard`. Changing this forces a new resource to be created."
  type        = string
  default     = null

  validation {
    condition     = var.dns_endpoint_type == null || contains(["Standard", "AzureDnsZone"], var.dns_endpoint_type)
    error_message = "The dns_endpoint_type value must be one of: Standard, AzureDnsZone (per the provider documentation)."
  }
}

variable "edge_zone" {
  description = "Specifies the Edge Zone within the Azure Region where this Storage Account should exist. Changing this forces a new Storage Account to be created."
  type        = string
  default     = null
}

variable "https_traffic_only_enabled" {
  description = "Boolean flag which forces HTTPS if enabled, see here for more information. Defaults to `true`."
  type        = bool
  default     = true
}

variable "infrastructure_encryption_enabled" {
  description = "Is infrastructure encryption enabled? Changing this forces a new resource to be created. Defaults to `false`."
  type        = bool
  default     = null
}

variable "is_hns_enabled" {
  description = "Is Hierarchical Namespace enabled? This can be used with Azure Data Lake Storage Gen 2 (see here for more information). Changing this forces a new resource to be created."
  type        = bool
  default     = null
}

variable "large_file_share_enabled" {
  description = "Are Large File Shares Enabled? Defaults to `false`."
  type        = bool
  default     = null
}

variable "local_user_enabled" {
  description = "Is Local User Enabled? Defaults to `true`."
  type        = bool
  default     = false
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string

  validation {
    condition     = var.location == null || length(var.location) > 0
    error_message = "The location value must be an Azure region name, e.g. \"westus2\"."
  }
}

variable "min_tls_version" {
  description = "The minimum supported TLS version for the storage account. Possible values are `TLS1_0`, `TLS1_1` and `TLS1_2`. Defaults to `TLS1_2` for new storage accounts."
  type        = string
  default     = "TLS1_2"

  validation {
    condition     = var.min_tls_version == null || contains(["TLS1_0", "TLS1_1", "TLS1_2"], var.min_tls_version)
    error_message = "The min_tls_version value must be one of: TLS1_0, TLS1_1, TLS1_2 (per the provider documentation)."
  }
}

variable "name" {
  description = "Specifies the name of the storage account. Only lowercase Alphanumeric characters allowed. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]{3,24}$", var.name))
    error_message = "Storage account names must be 3-24 characters of lowercase letters and digits."
  }
}

variable "nfsv3_enabled" {
  description = "Is NFSv3 protocol enabled? Changing this forces a new resource to be created. Defaults to `false`."
  type        = bool
  default     = null
}

variable "provisioned_billing_model_version" {
  description = "Specifies the version of the **provisioned** billing model (e.g. when `account_kind = \"FileStorage\"` for Storage File). Possible value is `V2`. Changing this forces a new resource to be created."
  type        = string
  default     = null

  validation {
    condition     = var.provisioned_billing_model_version == null || lower(coalesce(var.provisioned_billing_model_version, "V2")) == "v2"
    error_message = "The provisioned_billing_model_version value must be V2."
  }
}

variable "public_network_access_enabled" {
  description = "Whether the public network access is enabled? Defaults to `true`."
  type        = bool
  default     = null
}

variable "queue_encryption_key_type" {
  description = "The encryption type of the queue service. Possible values are `Service` and `Account`. Changing this forces a new resource to be created. Default value is `Service`."
  type        = string
  default     = null

  validation {
    condition     = var.queue_encryption_key_type == null || contains(["Service", "Account"], var.queue_encryption_key_type)
    error_message = "The queue_encryption_key_type value must be one of: Service, Account (per the provider documentation)."
  }
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the storage account. Changing this forces a new resource to be created."
  type        = string
}

variable "sftp_enabled" {
  description = "Boolean, enable SFTP for the storage account"
  type        = bool
  default     = null
}

variable "shared_access_key_enabled" {
  description = "Indicates whether the storage account permits requests to be authorized with the account access key via Shared Key. If false, then all requests, including shared access signatures, must be authorized with Azure Active Directory (Azure AD). Defaults to `true`."
  type        = bool
  default     = null
}

variable "table_encryption_key_type" {
  description = "The encryption type of the table service. Possible values are `Service` and `Account`. Changing this forces a new resource to be created. Default value is `Service`."
  type        = string
  default     = null

  validation {
    condition     = var.table_encryption_key_type == null || contains(["Service", "Account"], var.table_encryption_key_type)
    error_message = "The table_encryption_key_type value must be one of: Service, Account (per the provider documentation)."
  }
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "azure_files_authentication" {
  description = "A `azure_files_authentication` block as defined below."
  type = object({
    default_share_level_permission = optional(string)
    directory_type                 = string
    active_directory = optional(object({
      domain_guid         = string
      domain_name         = string
      domain_sid          = optional(string)
      forest_name         = optional(string)
      netbios_domain_name = optional(string)
      storage_sid         = optional(string)
    }))
  })
  default = null
}

variable "blob_properties" {
  description = "A `blob_properties` block as defined below."
  type = object({
    change_feed_enabled           = optional(bool)
    change_feed_retention_in_days = optional(number)
    default_service_version       = optional(string)
    last_access_time_enabled      = optional(bool)
    versioning_enabled            = optional(bool)
    container_delete_retention_policy = optional(object({
      days = optional(number)
    }))
    cors_rule = optional(list(object({
      allowed_headers    = list(string)
      allowed_methods    = list(string)
      allowed_origins    = list(string)
      exposed_headers    = list(string)
      max_age_in_seconds = number
    })))
    delete_retention_policy = optional(object({
      days                     = optional(number)
      permanent_delete_enabled = optional(bool)
    }))
    restore_policy = optional(object({
      days = number
    }))
  })
  default = null
}

variable "custom_domain" {
  description = "A `custom_domain` block as documented below."
  type = object({
    name          = string
    use_subdomain = optional(bool)
  })
  default = null
}

variable "customer_managed_key" {
  description = "A `customer_managed_key` block as documented below."
  type = object({
    key_vault_key_id          = optional(string)
    user_assigned_identity_id = string
  })
  default = null
}

variable "identity" {
  description = "An `identity` block as defined below."
  type = object({
    identity_ids = optional(set(string))
    principal_id = optional(string)
    tenant_id    = optional(string)
    type         = string
  })
  default = null

  validation {
    condition     = var.identity == null || contains(["systemassigned", "userassigned", "systemassigned, userassigned"], lower(coalesce(try(var.identity.type, null), "systemassigned")))
    error_message = "The identity type must be SystemAssigned, UserAssigned, or \"SystemAssigned, UserAssigned\"."
  }
}

variable "immutability_policy" {
  description = "An `immutability_policy` block as defined below. Changing this forces a new resource to be created."
  type = object({
    allow_protected_append_writes = bool
    period_since_creation_in_days = number
    state                         = string
  })
  default = null

  validation {
    condition     = var.immutability_policy == null || contains(["disabled", "unlocked", "locked"], lower(coalesce(try(var.immutability_policy.state, null), "disabled")))
    error_message = "The immutability_policy state must be one of Disabled, Unlocked, or Locked."
  }
}

variable "network_rules" {
  description = "A `network_rules` block as documented below."
  type = object({
    bypass                     = optional(set(string))
    default_action             = string
    ip_rules                   = optional(set(string))
    virtual_network_subnet_ids = optional(set(string))
    private_link_access = optional(list(object({
      endpoint_resource_id = string
      endpoint_tenant_id   = optional(string)
    })))
  })
  default = null

  validation {
    condition     = var.network_rules == null || contains(["allow", "deny"], lower(coalesce(try(var.network_rules.default_action, null), "deny")))
    error_message = "The network_rules default_action must be Allow or Deny."
  }

  validation {
    condition     = var.network_rules == null || try(var.network_rules.bypass, null) == null || length(setsubtract([for b in coalesce(try(var.network_rules.bypass, null), []) : lower(b)], ["logging", "metrics", "azureservices", "none"])) == 0
    error_message = "The network_rules bypass values must be drawn from Logging, Metrics, AzureServices, and None."
  }
}

variable "routing" {
  description = "A `routing` block as defined below."
  type = object({
    choice                      = optional(string)
    publish_internet_endpoints  = optional(bool)
    publish_microsoft_endpoints = optional(bool)
  })
  default = null

  validation {
    condition     = var.routing == null || try(var.routing.choice, null) == null || contains(["internetrouting", "microsoftrouting"], lower(coalesce(try(var.routing.choice, null), "microsoftrouting")))
    error_message = "The routing choice must be InternetRouting or MicrosoftRouting."
  }
}

variable "sas_policy" {
  description = "A `sas_policy` block as defined below."
  type = object({
    expiration_action = optional(string)
    expiration_period = string
  })
  default = null

  validation {
    condition     = var.sas_policy == null || try(var.sas_policy.expiration_action, null) == null || contains(["log", "block"], lower(coalesce(try(var.sas_policy.expiration_action, null), "log")))
    error_message = "The sas_policy expiration_action must be Log or Block."
  }
}

variable "share_properties" {
  description = "A `share_properties` block as defined below."
  type = object({
    cors_rule = optional(list(object({
      allowed_headers    = list(string)
      allowed_methods    = list(string)
      allowed_origins    = list(string)
      exposed_headers    = list(string)
      max_age_in_seconds = number
    })))
    retention_policy = optional(object({
      days = optional(number)
    }))
    smb = optional(object({
      authentication_types            = optional(set(string))
      channel_encryption_type         = optional(set(string))
      kerberos_ticket_encryption_type = optional(set(string))
      multichannel_enabled            = optional(bool)
      versions                        = optional(set(string))
    }))
  })
  default = null
}

variable "timeouts" {
  description = "Custom timeouts for create, read, update, and delete operations on the storage account."
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}

variable "role_assignments" {
  type = map(object({
    condition                              = optional(string)
    condition_version                      = optional(string)
    delegated_managed_identity_resource_id = optional(string)
    description                            = optional(string)
    name                                   = optional(string)
    principal_id                           = string
    principal_type                         = optional(string)
    role_definition_id                     = optional(string)
    role_definition_name                   = optional(string)
    skip_service_principal_aad_check       = optional(bool)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
    }))
  }))
  default = {}
}

variable "locks" {
  type = map(object({
    lock_level = string
    name       = string
    notes      = optional(string)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
    }))
  }))
  default = {}
}

variable "containers" {
  type = map(object({
    container_access_type             = optional(string)
    default_encryption_scope          = optional(string)
    encryption_scope_override_enabled = optional(bool)
    metadata                          = optional(map(string))
    name                              = string
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
    role_assignments = optional(map(object({
      condition                              = optional(string)
      condition_version                      = optional(string)
      delegated_managed_identity_resource_id = optional(string)
      description                            = optional(string)
      name                                   = optional(string)
      principal_id                           = string
      principal_type                         = optional(string)
      role_definition_id                     = optional(string)
      role_definition_name                   = optional(string)
      skip_service_principal_aad_check       = optional(bool)
      timeouts = optional(object({
        create = optional(string)
        delete = optional(string)
        read   = optional(string)
      }))
    })), {})
  }))
  default = {}
}

variable "tables" {
  type = map(object({
    name = string
    acl = optional(set(object({
      id = string
      access_policy = optional(list(object({
        expiry      = string
        permissions = string
        start       = string
      })))
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  default = {}
}

variable "queues" {
  type = map(object({
    metadata = optional(map(string))
    name     = string
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  default = {}
}
