{
  tenantName: 'b-tenant',
  serviceAccountSuffix: '-svc',
  role: 'platform-reader',
  extraRole: 'platform-writer',
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
}
