variable "address_space" {
  description = "The address space that is used the virtual network. You can supply more than one address space."
  type        = set(string)
  default     = null
}

variable "bgp_community" {
  description = "The BGP community attribute in format `<as-number>:<community-value>`."
  type        = string
  default     = null
}

variable "dns_servers" {
  description = "List of IP addresses of DNS servers"
  type        = list(string)
  default     = null
}

variable "edge_zone" {
  description = "Specifies the Edge Zone within the Azure Region where this Virtual Network should exist. Changing this forces a new Virtual Network to be created."
  type        = string
  default     = null
}

variable "flow_timeout_in_minutes" {
  description = "The flow timeout in minutes for the Virtual Network, which is used to enable connection tracking for intra-VM flows. Possible values are between `4` and `30` minutes."
  type        = number
  default     = null
}

variable "location" {
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
  type        = string

  validation {
    condition     = var.location == null || length(var.location) > 0
    error_message = "The location value must be an Azure region name, e.g. \"westus2\"."
  }
}

variable "name" {
  description = "The name of the virtual network. Changing this forces a new resource to be created."
  type        = string
}

variable "private_endpoint_vnet_policies" {
  description = "The Private Endpoint VNet Policies for the Virtual Network. Possible values are `Disabled` and `Basic`. Defaults to `Disabled`."
  type        = string
  default     = null

  validation {
    condition     = var.private_endpoint_vnet_policies == null || contains(["Disabled", "Basic"], var.private_endpoint_vnet_policies)
    error_message = "The private_endpoint_vnet_policies value must be one of: Disabled, Basic (per the provider documentation)."
  }
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network. Changing this forces a new resource to be created."
  type        = string
}

variable "subnet" {
  description = "Can be specified multiple times to define multiple subnets. Each `subnet` block supports fields documented below."
  type = set(object({
    address_prefixes                = list(string)
    default_outbound_access_enabled = bool
    delegation = list(object({
      name = string
      service_delegation = list(object({
        actions = set(string)
        name    = string
      }))
    }))
    id                                            = string
    name                                          = string
    private_endpoint_network_policies             = string
    private_link_service_network_policies_enabled = bool
    route_table_id                                = string
    security_group                                = string
    service_endpoint_policy_ids                   = set(string)
    service_endpoints                             = set(string)
  }))
  default = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "ddos_protection_plan" {
  description = "A `ddos_protection_plan` block as documented below."
  type = object({
    enable = bool
    id     = string
  })
  default = null
}

variable "encryption" {
  description = "A `encryption` block as defined below."
  type = object({
    enforcement = string
  })
  default = null
}

variable "ip_address_pool" {
  description = "One or more `ip_address_pool` blocks as defined below. Only one association of each IP type(IPv4 or IPv6) is allowed."
  type = list(object({
    allocated_ip_address_prefixes = optional(list(string))
    id                            = string
    number_of_ip_addresses        = string
  }))
  default = null
}

variable "timeouts" {
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
