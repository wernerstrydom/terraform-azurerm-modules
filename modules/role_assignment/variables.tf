variable "condition" {
  description = "The condition that limits the resources that the role can be assigned to. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "condition_version" {
  description = "The version of the condition. Possible values are `1.0` or `2.0`. Changing this forces a new resource to be created."
  type        = string
  default     = null

  validation {
    condition     = var.condition_version == null || contains(["1.0", "2.0"], coalesce(var.condition_version, "2.0"))
    error_message = "The condition_version value must be 1.0 or 2.0."
  }
}

variable "delegated_managed_identity_resource_id" {
  description = "The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created."
  type        = string
  default     = null

  validation {
    condition     = var.delegated_managed_identity_resource_id == null || startswith(var.delegated_managed_identity_resource_id, "/")
    error_message = "The delegated_managed_identity_resource_id value must be a fully qualified Azure resource ID starting with \"/\"."
  }
}

variable "description" {
  description = "The description for this Role Assignment. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "name" {
  description = "A unique UUID/GUID for this Role Assignment - one will be generated if not specified. Changing this forces a new resource to be created."
  type        = string
  default     = null

  validation {
    condition     = var.name == null || can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", var.name))
    error_message = "The name value must be a GUID, e.g. \"8331f39a-2eb9-4b39-96a1-3e37e9a7c841\"."
  }
}

variable "principal_id" {
  description = "The ID of the Principal (User, Group or Service Principal) to assign the Role Definition to. Changing this forces a new resource to be created."
  type        = string

  validation {
    condition     = var.principal_id == null || can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", var.principal_id))
    error_message = "The principal_id value must be a GUID, e.g. \"8331f39a-2eb9-4b39-96a1-3e37e9a7c841\"."
  }
}

variable "principal_type" {
  description = "The type of the `principal_id`. Possible values are `User`, `Group` and `ServicePrincipal`. Changing this forces a new resource to be created. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute."
  type        = string
  default     = null

  validation {
    condition     = var.principal_type == null || contains(["User", "Group", "ServicePrincipal"], var.principal_type)
    error_message = "The principal_type value must be one of: User, Group, ServicePrincipal (per the provider documentation)."
  }
}

variable "role_definition_id" {
  description = "The Scoped-ID of the Role Definition. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "role_definition_name" {
  description = "The name of a built-in Role. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "scope" {
  description = "The scope at which the Role Assignment applies to, such as `/subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333`, `/subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup`, or `/subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup/providers/Microsoft.Compute/virtualMachines/myVM`, or `/providers/Microsoft.Management/managementGroups/myMG`. Changing this forces a new resource to be created."
  type        = string

  validation {
    condition     = var.scope == null || startswith(var.scope, "/")
    error_message = "The scope value must be a fully qualified Azure resource ID starting with \"/\"."
  }
}

variable "skip_service_principal_aad_check" {
  description = "If the `principal_id` is a newly provisioned `Service Principal` set this value to `true` to skip the `Azure Active Directory` check which may fail due to replication lag. This argument is only valid if the `principal_id` is a `Service Principal` identity. Defaults to `false`."
  type        = bool
  default     = null
}

variable "timeouts" {
  description = "Custom timeouts for create, read, and delete operations on the role assignment."
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
  })
  default = null
}
