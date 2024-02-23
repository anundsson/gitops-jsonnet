{
  Application(name, namespace, project, repoURL, path, targetRevision):: {
    apiVersion: 'argoproj.io/v1alpha1',
    kind: 'Application',
    metadata: {
      name: name,
      namespace: namespace,
    },
    spec: {
      project: project,
      source: {
        repoURL: repoURL,
        path: path,
        targetRevision: targetRevision,
      },
      destination: {
        server: 'https://kubernetes.default.svc',
        namespace: namespace,
      },
    },
  },
}
