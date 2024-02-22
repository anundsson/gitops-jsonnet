// Define global variables that can be reused
local global = {
  imageRegistry: '',
  imagePullSecrets: [],
};

local image = {
  registry: 'docker.io',
  repository: 'bitnami/nginx-ingress-controller',
  tag: '1.9.6-debian-11-r6',
  digest: '',
  pullPolicy: 'IfNotPresent',
  pullSecrets: [],
};

local containerPorts = {
  http: 8080,
  https: 8443,
  metrics: 10254,
};

local ingressClassResource = {
  name: 'nginx',
  enabled: true,
  default: false,
  controllerClass: 'k8s.io/ingress-nginx',
  parameters: {},
};

// Main configuration
{
  global: global,
  kubeVersion: '',
  nameOverride: '',
  fullnameOverride: '',
  namespaceOverride: '',
  commonLabels: {},
  commonAnnotations: {},
  extraDeploy: [],
  clusterDomain: 'cluster.local',
  image: image,
  containerPorts: containerPorts,
  automountServiceAccountToken: true,
  hostAliases: [],
  config: {},
  proxySetHeaders: {},
  addHeaders: {},
  defaultBackendService: '',
  electionID: 'ingress-controller-leader',
  allowSnippetAnnotations: false,
  reportNodeInternalIp: false,
  watchIngressWithoutClass: false,
  ingressClassResource: ingressClassResource,
  // Add other configurations following the same pattern
  // This is a simplified example to illustrate the conversion
}
