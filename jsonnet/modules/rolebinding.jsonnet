// Function to create a RoleBinding for a given Role or ClusterRole
{
  RoleBinding(name, roleName, namespace, serviceAccountName, roleKind='Role'):: {
    apiVersion: 'rbac.authorization.k8s.io/v1',
    kind: 'RoleBinding',
    metadata: {
      name: name,
      namespace: namespace,
    },
    subjects: [
      {
        kind: 'ServiceAccount',
        name: serviceAccountName,
        namespace: namespace,
      },
    ],
    roleRef: {
      kind: roleKind, // 'Role' for namespace-scoped Role, 'ClusterRole' for cluster-wide access
      name: roleName,
      apiGroup: 'rbac.authorization.k8s.io',
    },
  },
}
