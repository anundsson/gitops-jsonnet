// Assuming this file is in a directory that has `template` as a sibling directory
local tenantTemplate = import '../templates/tenant_template.jsonnet';

tenantTemplate({
  tenantName: 'tenant-a-app',
  namespaceName: 'tenant-a-namespace',
  rolesBindings: [
    {
      roleName: 'tenant-a-role',
      verbs: ['get', 'watch', 'list'],
      apiGroups: ['', 'extensions', 'apps'],
      resources: ['deployments', 'pods'],
      bindingName: 'tenant-a-rolebinding',
      serviceAccountName: 'tenant-a-serviceaccount',
    },
    // Additional roles and bindings can be defined in the same manner
  ],
  // Optional application parameters can be included or omitted
  // Ensure these are either all provided or handled as optional within the template
})
