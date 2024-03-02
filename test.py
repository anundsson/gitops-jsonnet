import os
import yaml
import subprocess

tenants_dir = './tenants'
output_dir = './generated'

for tenant_file in os.listdir(tenants_dir):
    if tenant_file.endswith('.yaml'):
        with open(os.path.join(tenants_dir, tenant_file)) as f:
            tenant_config = yaml.safe_load(f)
            # Assuming you have a Jsonnet template that takes this config and outputs Kubernetes manifests
            output_path = os.path.join(output_dir, tenant_file.replace('.yaml', '.json'))
            subprocess.run(['jsonnet', './roles/example_tenant.jsonnet', '--ext-str', f'config={yaml.dump(tenant_config)}', '-o', output_path])
