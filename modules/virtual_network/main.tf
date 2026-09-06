resource "azurerm_virtual_network" "this" {
  address_space                  = var.address_space
  bgp_community                  = var.bgp_community
  dns_servers                    = var.dns_servers
  edge_zone                      = var.edge_zone
  flow_timeout_in_minutes        = var.flow_timeout_in_minutes
  location                       = var.location
  name                           = var.name
  private_endpoint_vnet_policies = var.private_endpoint_vnet_policies
  resource_group_name            = var.resource_group_name
  subnet                         = var.subnet
  tags                           = var.tags

  dynamic "ddos_protection_plan" {
    for_each = var.ddos_protection_plan == null ? [] : [var.ddos_protection_plan]
    content {
      enable = ddos_protection_plan.value.enable
      id     = ddos_protection_plan.value.id
    }
  }

  dynamic "encryption" {
    for_each = var.encryption == null ? [] : [var.encryption]
    content {
      enforcement = encryption.value.enforcement
    }
  }

  dynamic "ip_address_pool" {
    for_each = var.ip_address_pool == null ? [] : var.ip_address_pool
    content {
      allocated_ip_address_prefixes = ip_address_pool.value.allocated_ip_address_prefixes
      id                            = ip_address_pool.value.id
      number_of_ip_addresses        = ip_address_pool.value.number_of_ip_addresses
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts == null ? [] : [var.timeouts]
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}

module "role_assignments" {
  source   = "../role_assignment"
  for_each = var.role_assignments

  scope = azurerm_virtual_network.this.id

  condition                              = each.value.condition
  condition_version                      = each.value.condition_version
  delegated_managed_identity_resource_id = each.value.delegated_managed_identity_resource_id
  description                            = each.value.description
  name                                   = each.value.name
  principal_id                           = each.value.principal_id
  principal_type                         = each.value.principal_type
  role_definition_id                     = each.value.role_definition_id
  role_definition_name                   = each.value.role_definition_name
  skip_service_principal_aad_check       = each.value.skip_service_principal_aad_check
  timeouts                               = each.value.timeouts
}

module "locks" {
  source   = "../management_lock"
  for_each = var.locks

  scope = azurerm_virtual_network.this.id

  lock_level = each.value.lock_level
  name       = each.value.name
  notes      = each.value.notes
  timeouts   = each.value.timeouts
}
