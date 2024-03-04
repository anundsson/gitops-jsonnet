// tenants/template/tenant_template.jsonnet

local namespace = import '../modules/namespace.jsonnet';
local role = import '../modules/role.jsonnet';
local rolebinding = import '../modules/rolebinding.jsonnet';

// Define the function to accept a single object parameter
function(params) {
  // Destructure params to extract individual parameters
  local tenantName = params.tenantName,
  local namespaceName = params.namespaceName,
  local rolesBindings = params.rolesBindings,

  items: [
    namespace.Namespace(namespaceName),
  ] + [
    role.Role(rb.roleName, namespaceName, rb.verbs, rb.apiGroups, rb.resources) for rb in rolesBindings
  ] + [
    rolebinding.RoleBinding(rb.bindingName, rb.roleName, namespaceName, rb.serviceAccountName) for rb in rolesBindings
  ],
}
