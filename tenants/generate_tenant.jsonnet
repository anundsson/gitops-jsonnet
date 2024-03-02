local namespaceLib = import '../modules/namespace.jsonnet';
local appProjectLib = import '../modules/appproject.jsonnet';
local applicationLib = import '../modules/application.jsonnet';
local applicationSetLib = import '../modules/applicationset.jsonnet';
local roleLib = import '../modules/role.jsonnet';
local rolebindingLib = import '../modules/rolebinding.jsonnet';

// Function to generate resources for a single tenant
local generateTenantResources(tenantConfig) = [
  namespaceLib.Namespace(tenantConfig.tenantName),
  appProjectLib.AppProject(tenantConfig.tenantName + '-project', tenantConfig.tenantName),
  rolebindingLib.RoleBinding(tenantConfig.tenantName + '-read-only-binding', tenantConfig.role, tenantConfig.tenantName, tenantConfig.tenantName + tenantConfig.serviceAccountSuffix, 'Role'),
  appProjectLib.AppProject(tenantConfig.tenantName, 'argocd'),
  applicationLib.Application(tenantConfig.tenantName + '-application', 'argocd', tenantConfig.tenantName, tenantConfig.repoUrl, tenantConfig.appPath, tenantConfig.targetRevision),
  applicationSetLib.ApplicationSet(tenantConfig.tenantName + '-applicationset', 'argocd', tenantConfig.repoUrl, [
    { name: app.name, namespace: tenantConfig.tenantName, path: app.path, targetRevision: app.targetRevision } for app in tenantConfig.applicationSet
  ]),
  rolebindingLib.RoleBinding(tenantConfig.tenantName + '-extra-binding', tenantConfig.extraRole, tenantConfig.tenantName, tenantConfig.tenantName + tenantConfig.serviceAccountSuffix, 'Role'),
];

// Import tenant configurations
local tenantAConfig = import 'tenant_a.jsonnet';
local tenantBConfig = import 'tenant_b.jsonnet';
// Add more tenants as needed

// Generate resources for all tenants
[
  generateTenantResources(tenantAConfig),
  generateTenantResources(tenantBConfig),
  // Repeat for additional tenants
]
