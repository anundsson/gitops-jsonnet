// Assuming correct paths to the modules
local namespaceMod = import '../modules/namespace.jsonnet';
local roleMod = import '../modules/role.jsonnet';
local roleBindingMod = import '../modules/rolebinding.jsonnet';

{
  // Function to create resources for a tenant
  createTenantResources(tenantName, rolesBindings):: {
    local ns = namespaceMod.Namespace(tenantName + '-namespace'),
    roles = [ // Note the comma at the end of this line
      roleMod.Role(rb.roleName, ns.metadata.name, rb.verbs, rb.apiGroups, rb.resources) for rb in rolesBindings
    ],
    roleBindings = [ // And here
      roleBindingMod.RoleBinding(rb.bindingName, rb.roleName, ns.metadata.name, rb.serviceAccountName) for rb in rolesBindings
    ]; // This semicolon ends the local variable definitions

    // Returning an object with a resources field
    resources: std.flattenArrays([[ns]] + roles + roleBindings), // Ensure proper comma usage in object fields
  },
}
