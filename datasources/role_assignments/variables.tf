variable "limit_at_scope" {
  description = "Whether to limit the result exactly at the specified scope and not above or below it. Defaults to `false`."
  type        = bool
  default     = true
}

variable "principal_id" {
  description = "The principal ID to filter the list of Role Assignments against."
  type        = string
  default     = null

  validation {
    condition     = var.principal_id == null || can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", var.principal_id))
    error_message = "The principal_id value must be a GUID, e.g. \"8331f39a-2eb9-4b39-96a1-3e37e9a7c841\"."
  }
}

variable "scope" {
  description = "The scope at which to list Role Assignments."
  type        = string

  validation {
    condition     = var.scope == null || startswith(var.scope, "/")
    error_message = "The scope value must be a fully qualified Azure resource ID starting with \"/\"."
  }
}

variable "tenant_id" {
  description = "The tenant ID for cross-tenant requests."
  type        = string
  default     = null

  validation {
    condition     = var.tenant_id == null || can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", var.tenant_id))
    error_message = "The tenant_id value must be a GUID, e.g. \"8331f39a-2eb9-4b39-96a1-3e37e9a7c841\"."
  }
}

variable "timeouts" {
  type = object({
    read = optional(string)
  })
  default = null
}
