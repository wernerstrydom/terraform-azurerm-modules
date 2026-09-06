variable "metadata" {
  description = "A mapping of MetaData which should be assigned to this Storage Queue."
  type        = map(string)
  default     = null
}

variable "name" {
  description = "The name of the Queue which should be created within the Storage Account. Must be unique within the storage account the queue is located. Changing this forces a new resource to be created."
  type        = string

  validation {
    condition     = var.name == null || can(regex("^[a-z0-9][a-z0-9-]{1,61}[a-z0-9]$", var.name))
    error_message = "Queue names must be 3-63 characters of lowercase letters, digits, and hyphens, and must start and end with a letter or digit."
  }
}

variable "storage_account_id" {
  description = "The name of the Storage Account where the Storage Queue should be created."
  type        = string
  default     = null

  validation {
    condition     = var.storage_account_id == null || startswith(coalesce(var.storage_account_id, "/"), "/")
    error_message = "The storage_account_id value must be a fully qualified Azure resource ID starting with \"/\"."
  }
}

variable "timeouts" {
  description = "Custom timeouts for create, read, update, and delete operations on the queue."
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}
