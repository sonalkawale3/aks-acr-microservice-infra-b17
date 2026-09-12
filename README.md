<div align="center">
  <h1>🚀 AKS & ACR Microservice Infrastructure</h1>
  <p><i>Terraform infrastructure-as-code (IaC) to provision a foundational Azure environment for deploying microservices.</i></p>

  ![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
  ![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=for-the-badge&logo=microsoftazure&logoColor=white)
  ![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)
  ![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
</div>

<hr />

## 🏗️ Architecture Overview

This repository is designed in a modular way to manage resources across different environments (e.g., `dev`, `prod`). The infrastructure provisions the following core Azure resources:

- **📦 Azure Resource Group (RG)**: Logical container for grouping all associated resources.
- **🐳 Azure Container Registry (ACR)**: A managed, private Docker registry to store and manage your container images for microservices.
- **☸️ Azure Kubernetes Service (AKS)**: A managed Kubernetes cluster to host, scale, and manage the microservices.

## 📂 Project Structure

The project follows a clean, modular Terraform layout:

```text
.
├── environments/
│   └── dev/                 # 🛠️ Contains Terraform configurations for the 'dev' environment
│       ├── main.tf          # 🔗 Instantiates modules for the environment
│       ├── variables.tf     # 📝 Variable declarations
│       ├── terraform.tfvars # ⚙️ Input variables specific to the dev environment
│       ├── outputs.tf       # 📤 Outputs from the dev environment
│       └── providers.tf     # ☁️ Azure provider configuration
├── modules/
│   ├── acr/                 # 🐳 Terraform module for Azure Container Registry
│   ├── aks/                 # ☸️ Terraform module for Azure Kubernetes Service
│   └── resource_group/      # 📦 Terraform module for Azure Resource Group
```

## 🧩 Modules Details

- **`resource_group`**: Creates standard Azure Resource Groups.
- **`acr`**: Provisions the Azure Container Registry, configuring SKUs, admin access, and optional network rules.
- **`aks`**: Deploys the AKS cluster with customizable node pools, network profiles (including network plugin and load balancers), and optional ingress application gateways.

## 🚀 Getting Started

### 📋 Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html) (version compatible with configuration)
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) (authenticated via `az login`)
- Appropriate permissions in your Azure Subscription to create Resource Groups, AKS, and ACR.

### 🛠️ Deployment (Dev Environment)

1. **Navigate** to the desired environment directory (e.g., `dev`):
   ```bash
   cd environments/dev
   ```

2. **Initialize** Terraform to download the required providers and modules:
   ```bash
   terraform init
   ```

3. **Review** the infrastructure plan:
   ```bash
   terraform plan
   ```

4. **Apply** the configuration to provision the resources:
   ```bash
   terraform apply
   ```

## ⚙️ Configuration Variables

The variables for the deployment are defined in `environments/<env>/terraform.tfvars`. You can adjust configurations such as:

- 🌐 Resource Group names and locations.
- 🏷️ ACR SKUs and names.
- 🖥️ AKS node counts, VM sizes, and DNS prefixes.

## 🧹 Clean Up

To destroy the provisioned infrastructure and avoid incurring further costs:

```bash
cd environments/dev
terraform destroy
```

<hr />
<div align="center">
  <i>Built with ❤️ using Terraform and Azure</i>
</div>
