{
  generate(config):: {  // Use `::` to define a hidden field if you don't want it to appear in the output
    // Correctly define local variables within the function
    local namespace = config.tenantName,
    local serviceAccountName = config.tenantName + config.serviceAccountSuffix,
    
    // Define imports here (without "::" as they are part of the local scope of the function)
    local namespaceLib = import '../modules/namespace.jsonnet',
    local appProjectLib = import '../modules/appproject.jsonnet',
    local applicationLib = import '../modules/application.jsonnet',
    local applicationSetLib = import '../modules/applicationset.jsonnet',
    local rbacLib = import '../modules/rbac.jsonnet',

    // The resources array includes calls to the module functions, passing necessary parameters
    resources: [
      namespaceLib.Namespace(namespace),
      appProjectLib.AppProject(namespace + '-project', namespace),
      rbacLib.RoleBinding(namespace + '-read-only-binding', config.role, namespace, serviceAccountName, 'Role'),
      appProjectLib.AppProject(namespace, 'argocd'),
      applicationLib.Application(namespace + '-application', 'argocd', namespace, config.repoUrl, config.appPath, config.targetRevision),
      applicationSetLib.ApplicationSet(namespace + '-applicationset', 'argocd', config.repoUrl, [
        { name: app.name, namespace: namespace, path: app.path, targetRevision: app.targetRevision } for app in config.applicationSet
      ]),
      rbacLib.RoleBinding(namespace + '-extra-binding', config.extraRole, namespace, serviceAccountName, 'Role'),
    ],
  },
}
