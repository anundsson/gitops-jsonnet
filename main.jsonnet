local exampleTenant = import './roles/tenant_onboarding_example.jsonnet';
local tenantAConfig = import './tenants/tenant_a.jsonnet';
local tenantBConfig = import './tenants/tenant_b.jsonnet';

{
  "tenantA": exampleTenant.generate(tenantAConfig),
  "tenantB": exampleTenant.generate(tenantBConfig),
}