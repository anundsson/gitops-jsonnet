local appModule = import '../modules/application.jsonnet';

local tenantAApp = appModule.Application(
  name = 'tenantA',
  namespace = 'argocd',
  project = 'default', # tenant_onboarding
  repoURL = 'https://github.com/anundsson/gitops-jsonnet.git',
  path = 'cluster-configuration/tenants/tenantA/',
  targetRevision = 'HEAD'
);

tenantAApp