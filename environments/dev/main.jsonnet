local k = import 'k.libsonnet';
local deployment = import '../components/deployment.jsonnet';

{
  app: deployment.new('my-app', 'my-image:latest', 5),  // Example of using a component
}