variable "lock_level" {
  description = "Specifies the Level to be used for this Lock. Possible values are `CanNotDelete` and `ReadOnly`. Changing this forces a new resource to be created."
  type        = string

  validation {
    condition     = var.lock_level == null || contains(["CanNotDelete", "ReadOnly"], var.lock_level)
    error_message = "The lock_level value must be one of: CanNotDelete, ReadOnly (per the provider documentation)."
  }
}

variable "name" {
  description = "Specifies the name of the Management Lock. Changing this forces a new resource to be created."
  type        = string
}

variable "notes" {
  description = "Specifies some notes about the lock. Maximum of 512 characters. Changing this forces a new resource to be created."
  type        = string
  default     = null

  validation {
    condition     = var.notes == null || length(coalesce(var.notes, "x")) <= 512
    error_message = "The notes value must be at most 512 characters."
  }
}

variable "scope" {
  description = "Specifies the scope at which the Management Lock should be created. Changing this forces a new resource to be created."
  type        = string

  validation {
    condition     = var.scope == null || startswith(var.scope, "/")
    error_message = "The scope value must be a fully qualified Azure resource ID starting with \"/\"."
  }
}

variable "timeouts" {
  description = "Custom timeouts for create, read, and delete operations on the lock."
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
  })
  default = null
}
