// Import the modules
local namespaceMod = import '../modules/namespace.jsonnet';
local roleMod = import '../modules/role.jsonnet';
local roleBindingMod = import '../modules/rolebinding.jsonnet';

// Define the tenant's namespace, roles, and role bindings using the modules
local tenantNamespace = namespaceMod.Namespace('tenant-a-namespace');
local tenantRole = roleMod.Role(
  'tenant-a-role', 
  'tenant-a-namespace', 
  ['get', 'list', 'watch'], 
  [''], 
  ['pods', 'deployments']
);
local tenantRoleBinding = roleBindingMod.RoleBinding(
  'tenant-a-rolebinding', 
  'tenant-a-role', 
  'tenant-a-namespace', 
  'tenant-a-serviceaccount'
);

// Combine all the resources into a list for output
[
  tenantNamespace,
  tenantRole,
  tenantRoleBinding,
]
