// Assuming this file is in a directory that has `template` as a sibling directory
local tenantTemplate = import '../templates/tenant_template.jsonnet';

tenantTemplate({
  tenantName: 'tenant-b-app',
  namespaceName: 'tenant-b-namespace',
  rolesBindings: [
    {
      roleName: 'tenant-b-role',
      verbs: ['get', 'watch', 'list'],
      apiGroups: ['', 'extensions', 'apps'],
      resources: ['deployments', 'pods'],
      bindingName: 'tenant-b-rolebinding',
      serviceAccountName: 'tenant-b-serviceaccount',
    },
    // Additional roles and bindings can be defined in the same manner
  ],
  // Optional application parameters can be included or omitted
  // Ensure these are either all provided or handled as optional within the template
})
