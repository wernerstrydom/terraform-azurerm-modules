variable "name" {
  description = "The name of the storage table. Only Alphanumeric characters allowed, starting with a letter. Must be unique within the storage account the table is located. Changing this forces a new resource to be created."
  type        = string

  validation {
    condition     = var.name == null || can(regex("^[A-Za-z][A-Za-z0-9]{2,62}$", var.name))
    error_message = "Table names must be 3-63 alphanumeric characters and must start with a letter."
  }
}

variable "storage_account_id" {
  description = "Specifies the ID of the storage account in which to create the storage table. Changing this forces a new resource to be created."
  type        = string
  default     = null

  validation {
    condition     = var.storage_account_id == null || startswith(coalesce(var.storage_account_id, "/"), "/")
    error_message = "The storage_account_id value must be a fully qualified Azure resource ID starting with \"/\"."
  }
}

variable "acl" {
  description = "One or more `acl` blocks as defined below."
  type = set(object({
    id = string
    access_policy = optional(list(object({
      expiry      = string
      permissions = string
      start       = string
    })))
  }))
  default = null
}

variable "timeouts" {
  description = "Custom timeouts for create, read, update, and delete operations on the table."
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}
