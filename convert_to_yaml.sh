for tenant_file in tenants/*.jsonnet; do
    # Extract the tenant name from the file name for naming the output file
    tenant_name=$(basename $tenant_file .jsonnet)
    
    # Generate to Kubernetes YAML from Jsonnet template (add -y to streamline to yaml if required???)
    jsonnet -J . -e "(import 'roles/example_tenant.jsonnet').generate(import '$tenant_file')" > "generated/tenants/$tenant_name.yaml"
   

    # Optionally, split the output into multiple files if needed
    # csplit, awk, or similar tools can be used based on the structure of the output
done

# Commit and push the generated YAML files to the Git repository
#git add generated/*
#git commit -m "Update tenant configurations"
#git push origin main