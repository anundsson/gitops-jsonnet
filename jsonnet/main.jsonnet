// Import generated configuration that includes all tenant configs
local tenantConfigs = import 'tenantConfigs.jsonnet';

// Aggregate resources from all tenants
local aggregatedResources = std.flattenArrays(tenantConfigs.configs);

// Output the aggregated resources, structured for YAML conversion
{
  apiVersion: 'v1',
  kind: 'List',
  items: aggregatedResources,
}
