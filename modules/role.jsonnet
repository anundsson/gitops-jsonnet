{
  Role(name, namespace, verbs, apiGroups=[''], resources):: {
    apiVersion: 'rbac.authorization.k8s.io/v1',
    kind: 'Role',
    metadata: {
      name: name,
      namespace: namespace,
    },
    rules: [
      {
        apiGroups: apiGroups,
        resources: resources,
        verbs: verbs,
      },
    ],
  },
}