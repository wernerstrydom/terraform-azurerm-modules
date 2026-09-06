output "condition" {
  description = "The condition that limits the resources that the role can be assigned to. Changing this forces a new resource to be created."
  value       = azurerm_role_assignment.this.condition
}

output "condition_version" {
  description = "The version of the condition. Possible values are `1.0` or `2.0`. Changing this forces a new resource to be created."
  value       = azurerm_role_assignment.this.condition_version
}

output "delegated_managed_identity_resource_id" {
  description = "The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created."
  value       = azurerm_role_assignment.this.delegated_managed_identity_resource_id
}

output "description" {
  description = "The description for this Role Assignment. Changing this forces a new resource to be created."
  value       = azurerm_role_assignment.this.description
}

output "id" {
  description = "The Role Assignment ID."
  value       = azurerm_role_assignment.this.id
}

output "name" {
  description = "A unique UUID/GUID for this Role Assignment - one will be generated if not specified. Changing this forces a new resource to be created."
  value       = azurerm_role_assignment.this.name
}

output "principal_id" {
  description = "The ID of the Principal (User, Group or Service Principal) to assign the Role Definition to. Changing this forces a new resource to be created."
  value       = azurerm_role_assignment.this.principal_id
}

output "principal_type" {
  description = "The type of the `principal_id`. Possible values are `User`, `Group` and `ServicePrincipal`. Changing this forces a new resource to be created. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute."
  value       = azurerm_role_assignment.this.principal_type
}

output "role_definition_id" {
  description = "The Scoped-ID of the Role Definition. Changing this forces a new resource to be created."
  value       = azurerm_role_assignment.this.role_definition_id
}

output "role_definition_name" {
  description = "The name of a built-in Role. Changing this forces a new resource to be created."
  value       = azurerm_role_assignment.this.role_definition_name
}

output "scope" {
  description = "The scope at which the Role Assignment applies to, such as `/subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333`, `/subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup`, or `/subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup/providers/Microsoft.Compute/virtualMachines/myVM`, or `/providers/Microsoft.Management/managementGroups/myMG`. Changing this forces a new resource to be created."
  value       = azurerm_role_assignment.this.scope
}

output "skip_service_principal_aad_check" {
  description = "If the `principal_id` is a newly provisioned `Service Principal` set this value to `true` to skip the `Azure Active Directory` check which may fail due to replication lag. This argument is only valid if the `principal_id` is a `Service Principal` identity. Defaults to `false`."
  value       = azurerm_role_assignment.this.skip_service_principal_aad_check
}
