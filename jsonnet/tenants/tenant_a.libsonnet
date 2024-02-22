// Import the enhanced example tenant template
local exampleTenant = import '../roles/example_tenant.libsonnet';

// a tenant specific configuration
local aConfig = {
  tenantName: 'a-tenant',
  serviceAccountSuffix: '-svc',
  role: 'platform-reader',
  extraRole: 'platform-writer',
  argocdProject: 'argocd',
  repoUrl: 'https://a.com/repo.git',
  appPath: 'path/to/a/application',
  targetRevision: 'HEAD',
  applicationSet: [
    {
      name: 'a-app1',
      namespace: 'a-tenant',
      path: 'apps/a-app1',
      targetRevision: 'HEAD',
    },
    {
      name: 'a-app2',
      namespace: 'a-tenant',
      path: 'apps/a-app2',
      targetRevision: 'HEAD',
    },
  ],
};

// Generate resources for the "a" tenant using the template with specified config
exampleTenant.generate(aConfig)
