variable "location" {
  description = "The Azure Region where the Resource Group should exist. Changing this forces a new Resource Group to be created."
  type        = string

  validation {
    condition     = var.location == null || length(var.location) > 0
    error_message = "The location value must be an Azure region name, e.g. \"westus2\"."
  }
}

variable "managed_by" {
  description = "The ID of the resource or application that manages this Resource Group."
  type        = string
  default     = null
}

variable "name" {
  description = "The Name which should be used for this Resource Group. Changing this forces a new Resource Group to be created."
  type        = string

  validation {
    condition     = var.name == null || (length(coalesce(var.name, "x")) >= 1 && length(coalesce(var.name, "x")) <= 90 && !endswith(coalesce(var.name, "x"), "."))
    error_message = "Resource group names must be 1-90 characters and must not end with a period."
  }
}

variable "tags" {
  description = "A mapping of tags which should be assigned to the Resource Group."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "Custom timeouts for create, read, update, and delete operations on the resource group."
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
