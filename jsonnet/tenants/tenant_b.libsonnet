// Import the enhanced example tenant template
local exampleTenant = import '../roles/example_tenant.libsonnet';

// b tenant specific configuration
local bConfig = {
  tenantName: 'b-tenant',
  serviceAccountSuffix: '-svc',
  role: 'platform-reader',
  extraRole: 'platform-writer',
  argocdProject: 'argocd',
  repoUrl: 'https://b.com/repo.git',
  appPath: 'path/to/b/application',
  targetRevision: 'HEAD',
  applicationSet: [
    {
      name: 'b-app1',
      namespace: 'b-tenant',
      path: 'apps/b-app1',
      targetRevision: 'HEAD',
    },
    {
      name: 'b-app2',
      namespace: 'b-tenant',
      path: 'apps/b-app2',
      targetRevision: 'HEAD',
    },
  ],
};

// Generate resources for the "b" tenant using the template with specified config
exampleTenant.generate(bConfig)
