// Adjusted tenant_template.jsonnet to ensure correct output format
function(params) {
  local application = import '../modules/application.jsonnet';
  local namespace = import '../modules/namespace.jsonnet';
  local role = import '../modules/role.jsonnet';
  local rolebinding = import '../modules/rolebinding.jsonnet';

  {
    apiVersion: 'v1',
    kind: 'List',
    items: [
      namespace.Namespace(params.namespaceName),
      // Assuming application parameters are optional; adjust logic as needed
      if params.project != null && params.repoURL != null && params.path != null && params.targetRevision != null then
        application.Application(params.tenantName, params.namespaceName, params.project, params.repoURL, params.path, params.targetRevision)
      else null,
    ] + [
      role.Role(rb.roleName, params.namespaceName, rb.verbs, rb.apiGroups, rb.resources) for rb in params.rolesBindings
    ] + [
      rolebinding.RoleBinding(rb.bindingName, rb.roleName, params.namespaceName, rb.serviceAccountName) for rb in params.rolesBindings
    ],
  }
}