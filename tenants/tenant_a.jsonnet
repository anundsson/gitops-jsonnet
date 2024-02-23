{
  tenantName: 'a-tenant',
  serviceAccountSuffix: '-svc',
  role: 'platform-reader',
  extraRole: 'platform-writer',
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
}
