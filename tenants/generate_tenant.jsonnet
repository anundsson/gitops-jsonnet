local namespaceLib = import '../modules/namespace.jsonnet';
local appProjectLib = import '../modules/appproject.jsonnet';
local applicationLib = import '../modules/application.jsonnet';
local applicationSetLib = import '../modules/applicationset.jsonnet';
local roleLib = import '../modules/role.jsonnet';
local rolebindingLib = import '../modules/rolebinding.jsonnet';

// Function to generate resources for a single tenant
local generateTenantResources(tenantConfig) = {
  [tenantConfig.tenantName + '_namespace']: namespaceLib.Namespace(tenantConfig.tenantName),
  [tenantConfig.tenantName + '_project']: appProjectLib.AppProject(tenantConfig.tenantName + '-project', tenantConfig.tenantName),
  // Add other resources similarly, ensuring each key is unique
  // Example for rolebinding
  [tenantConfig.tenantName + '_read_only_binding']: rolebindingLib.RoleBinding(tenantConfig.tenantName + '-read-only-binding', tenantConfig.role, tenantConfig.tenantName, tenantConfig.tenantName + tenantConfig.serviceAccountSuffix, 'Role'),
  // Continue for other resources...
};

// Import tenant configurations
local tenantAConfig = import 'tenant_a.jsonnet';
local tenantBConfig = import 'tenant_b.jsonnet';
// Add more tenants as needed

// Generate resources for all tenants and merge them into a single object
local allResources = generateTenantResources(tenantAConfig) +
                     generateTenantResources(tenantBConfig);
// Repeat for additional tenants and add to allResources

allResources
