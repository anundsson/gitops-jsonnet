// tenants/template/tenant_template.jsonnet

//local application = import '../modules/application.jsonnet';
local namespace = import '../modules/namespace.jsonnet';
local role = import '../modules/role.jsonnet';
local rolebinding = import '../modules/rolebinding.jsonnet';

function(tenantName, namespaceName, project, repoURL, path, targetRevision, rolesBindings) {
  apiVersion: 'v1',
  kind: 'List',
  items: [
    namespace.Namespace(namespaceName),
    //application.Application(tenantName, namespaceName, project, repoURL, path, targetRevision),
  ] + [
    role.Role(rb.roleName, namespaceName, rb.verbs, rb.apiGroups, rb.resources) for rb in rolesBindings
  ] + [
    rolebinding.RoleBinding(rb.bindingName, rb.roleName, namespaceName, rb.serviceAccountName) for rb in rolesBindings
  ],
}
