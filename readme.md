# GitOps Example jsonnet

## Overview

This project uses Jsonnet to manage Kubernetes configurations for multi-tenant environments. It is designed to streamline the onboarding process for new tenants by utilizing modular Jsonnet templates and roles. The configurations are intended for use with GitOps workflows, specifically Argo CD, to ensure declarative, version-controlled, and automated application deployment.

## Project Structure

```
.
├── main.jsonnet             # Main entry point for generating tenant configurations
├── modules                  # Reusable Jsonnet modules for Kubernetes resources
│   ├── application.jsonnet
│   ├── applicationset.jsonnet
│   ├── appproject.jsonnet
│   ├── namespace.jsonnet
│   ├── role.jsonnet
│   └── rolebinding.jsonnet
├── roles                    # Roles combining modules for specific operational goals
│   └── example_tenant.jsonnet
└── tenants                  # Tenant-specific configurations
    ├── tenant_a.jsonnet
    └── tenant_b.jsonnet
```

## Prerequisites

- Jsonnet CLI: For compiling Jsonnet files into JSON/YAML.
- Kubernetes Cluster: Where the resources will be deployed.
- Argo CD: For implementing the GitOps workflow.

## Setup Instructions

1. **Install Jsonnet:**

   Follow the instructions at [Jsonnet Installation Guide](https://jsonnet.org/learning/getting_started.html) to install the Jsonnet CLI on your system.

2. **Clone the Repository:**

   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

3. **Install Argo CD in Your Kubernetes Cluster (if not already installed):**

   Refer to the [Argo CD Getting Started Guide](https://argo-cd.readthedocs.io/en/stable/getting_started/) for installation instructions.

## Usage

1. **Configure Tenants:**

   Edit the files under the `tenants` directory to define tenant-specific configurations.

2. **Generate Kubernetes Configurations:**

   Run the following command to compile the Jsonnet files into JSON, which will be used by Kubernetes and Argo CD:

   ```bash
   jsonnet -J modules main.jsonnet -o output.json
   ```

   Alternatively, convert to YAML if preferred (requires additional tools like `yq`).

3. **Apply Configurations with Argo CD:**

   Use Argo CD CLI or UI to create an application pointing to your generated configuration file or directly to the Jsonnet files if Argo CD is configured to use Jsonnet.

   ```bash
   argocd app create <app-name> --repo <repository-url> --path <path-to-jsonnet-file> --dest-server https://kubernetes.default.svc --dest-namespace <destination-namespace>
   ```

## Contributing

Contributions are welcome! Please read our [Contributing Guide](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## License

This project is licensed under the [MIT License](LICENSE) - see the LICENSE file for details.

---

### Customization

Remember to replace placeholders like `<repository-url>`, `<repository-directory>`, `<app-name>`, `<path-to-jsonnet-file>`, and `<destination-namespace>` with actual values relevant to your project. Also, you may need to create or adjust the CONTRIBUTING.md and LICENSE files according to your project's requirements and licensing decisions.