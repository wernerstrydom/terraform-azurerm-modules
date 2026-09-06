output "address_space" {
  description = "The address space that is used the virtual network. You can supply more than one address space."
  value       = azurerm_virtual_network.this.address_space
  depends_on  = [module.role_assignments, module.locks]
}

output "bgp_community" {
  description = "The BGP community attribute in format `<as-number>:<community-value>`."
  value       = azurerm_virtual_network.this.bgp_community
  depends_on  = [module.role_assignments, module.locks]
}

output "dns_servers" {
  description = "List of IP addresses of DNS servers"
  value       = azurerm_virtual_network.this.dns_servers
  depends_on  = [module.role_assignments, module.locks]
}

output "edge_zone" {
  description = "Specifies the Edge Zone within the Azure Region where this Virtual Network should exist. Changing this forces a new Virtual Network to be created."
  value       = azurerm_virtual_network.this.edge_zone
  depends_on  = [module.role_assignments, module.locks]
}

output "flow_timeout_in_minutes" {
  description = "The flow timeout in minutes for the Virtual Network, which is used to enable connection tracking for intra-VM flows. Possible values are between `4` and `30` minutes."
  value       = azurerm_virtual_network.this.flow_timeout_in_minutes
  depends_on  = [module.role_assignments, module.locks]
}

output "guid" {
  description = "The GUID of the Virtual Network."
  value       = azurerm_virtual_network.this.guid
  depends_on  = [module.role_assignments, module.locks]
}

output "id" {
  description = "The Virtual Network ID."
  value       = azurerm_virtual_network.this.id
  depends_on  = [module.role_assignments, module.locks]
}

output "location" {
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
  value       = azurerm_virtual_network.this.location
  depends_on  = [module.role_assignments, module.locks]
}

output "locks" {
  value = module.locks
}

output "name" {
  description = "The name of the virtual network. Changing this forces a new resource to be created."
  value       = azurerm_virtual_network.this.name
  depends_on  = [module.role_assignments, module.locks]
}

output "private_endpoint_vnet_policies" {
  description = "The Private Endpoint VNet Policies for the Virtual Network. Possible values are `Disabled` and `Basic`. Defaults to `Disabled`."
  value       = azurerm_virtual_network.this.private_endpoint_vnet_policies
  depends_on  = [module.role_assignments, module.locks]
}

output "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network. Changing this forces a new resource to be created."
  value       = azurerm_virtual_network.this.resource_group_name
  depends_on  = [module.role_assignments, module.locks]
}

output "role_assignments" {
  value = module.role_assignments
}

output "subnet" {
  description = "Can be specified multiple times to define multiple subnets. Each `subnet` block supports fields documented below."
  value       = azurerm_virtual_network.this.subnet
  depends_on  = [module.role_assignments, module.locks]
}

output "tags" {
  description = "A mapping of tags to assign to the resource."
  value       = azurerm_virtual_network.this.tags
  depends_on  = [module.role_assignments, module.locks]
}
