{
  // Function to create a Namespace
  Namespace(name):: {
    apiVersion: 'v1',
    kind: 'Namespace',
    metadata: {
      name: name,
      // Additional labels or annotations can be added here
      labels: {
        managedBy: 'jsonnet',
      },
    },
  },
}
