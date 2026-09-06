output "aggregate" {
  value = {
    id               = data.azurerm_role_assignments.this.id
    limit_at_scope   = data.azurerm_role_assignments.this.limit_at_scope
    principal_id     = data.azurerm_role_assignments.this.principal_id
    role_assignments = data.azurerm_role_assignments.this.role_assignments
    scope            = data.azurerm_role_assignments.this.scope
    tenant_id        = data.azurerm_role_assignments.this.tenant_id
  }
}

output "id" {
  description = "The ID of this Role Assignments data source."
  value       = data.azurerm_role_assignments.this.id
}

output "limit_at_scope" {
  description = "Whether to limit the result exactly at the specified scope and not above or below it. Defaults to `false`."
  value       = data.azurerm_role_assignments.this.limit_at_scope
}

output "principal_id" {
  description = "The principal ID to filter the list of Role Assignments against."
  value       = data.azurerm_role_assignments.this.principal_id
}

output "role_assignments" {
  description = "A `role_assignments` block as defined below."
  value       = data.azurerm_role_assignments.this.role_assignments
}

output "scope" {
  description = "The scope at which to list Role Assignments."
  value       = data.azurerm_role_assignments.this.scope
}

output "tenant_id" {
  description = "The tenant ID for cross-tenant requests."
  value       = data.azurerm_role_assignments.this.tenant_id
}
