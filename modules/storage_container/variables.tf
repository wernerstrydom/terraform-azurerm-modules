variable "container_access_type" {
  description = "The Access Level configured for this Container. Possible values are `blob`, `container` or `private`. Defaults to `private`."
  type        = string
  default     = "private"

  validation {
    condition     = var.container_access_type == null || contains(["blob", "container", "private"], var.container_access_type)
    error_message = "The container_access_type value must be one of: blob, container, private (per the provider documentation)."
  }
}

variable "default_encryption_scope" {
  description = "The default encryption scope to use for blobs uploaded to this container. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "encryption_scope_override_enabled" {
  description = "Whether to allow blobs to override the default encryption scope for this container. Can only be set when specifying `default_encryption_scope`. Defaults to `true`. Changing this forces a new resource to be created."
  type        = bool
  default     = null
}

variable "metadata" {
  description = "A mapping of MetaData for this Container. All metadata keys should be lowercase."
  type        = map(string)
  default     = null
}

variable "name" {
  description = "The name of the Container which should be created within the Storage Account. Changing this forces a new resource to be created."
  type        = string

  validation {
    condition     = var.name == null || can(regex("^[a-z0-9][a-z0-9-]{2,62}$", var.name)) || contains(["$root", "$web", "$logs"], coalesce(var.name, "$root"))
    error_message = "Container names must be 3-63 characters of lowercase letters, digits, and hyphens, starting with a letter or digit, or one of the reserved names $root, $web, or $logs."
  }
}

variable "storage_account_id" {
  description = "The name of the Storage Account where the Container should be created."
  type        = string
  default     = null

  validation {
    condition     = var.storage_account_id == null || startswith(coalesce(var.storage_account_id, "/"), "/")
    error_message = "The storage_account_id value must be a fully qualified Azure resource ID starting with \"/\"."
  }
}

variable "timeouts" {
  description = "Custom timeouts for create, read, update, and delete operations on the container."
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
