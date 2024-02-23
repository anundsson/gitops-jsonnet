{
  ApplicationSet(name, namespace, repoURL, applications):: {
    apiVersion: 'argoproj.io/v1alpha1',
    kind: 'ApplicationSet',
    metadata: {
      name: name,
      namespace: namespace,
    },
    spec: {
      generators: [
        {
          list: {
            elements: applications,
          },
        },
      ],
      template: {
        metadata: {
          name: '{{name}}',
        },
        spec: {
          project: '{{project}}',
          source: {
            repoURL: repoURL,
            path: '{{path}}',
            targetRevision: '{{targetRevision}}',
          },
          destination: {
            server: 'https://kubernetes.default.svc',
            namespace: '{{namespace}}',
          },
        },
      },
    },
  },
}