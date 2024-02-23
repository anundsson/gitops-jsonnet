{
  AppProject(name, namespace):: {
    apiVersion: 'argoproj.io/v1alpha1',
    kind: 'AppProject',
    metadata: {
      name: name,
      namespace: namespace,
    },
    spec: {
      description: 'AppProject for ' + name,
      destinations: [
        {
          namespace: '*',
          server: 'https://kubernetes.default.svc',
        },
      ],
      sourceRepos: [
        '*',
      ],
    },
  },
}
