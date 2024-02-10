
# Project Environment Configuration Instructions

This document outlines the necessary steps to configure your environment for secure and efficient project operation. It is imperative to source the `must-run-me.sh` script to correctly set up the environment variables required for accessing and managing cloud resources.

## Importance of Sourcing `must-run-me.sh`

The `must-run-me.sh` script contains crucial environment variable definitions, including your Azure subscription ID, tenant ID, client ID, client secret, and potentially your current public IP address for secure access configurations. These variables are essential for authenticating and authorizing operations with Azure services through Terraform or other automation tools.

## Step-by-Step Guide to Source the Script

1. **Locate the Script:** Ensure `must-run-me.sh` is present in your project directory.
2. **Source the Script:** Execute the following command in your terminal:

```bash
source must-run-me.sh
```

This command makes the defined environment variables available in your current shell session, allowing Terraform and other tools to utilize these credentials and settings.

## Security Measures

- **Credential Safety:** Given the sensitive nature of the information within `must-run-me.sh`, it is crucial to handle this script with care. Do not share or transmit this file insecurely.
- **.gitignore Inclusion:** To prevent accidental exposure of credentials, `must-run-me.sh` must be added to your `.gitignore` file. This action ensures that the script, along with its sensitive content, is not committed to your version control system.

By following these guidelines, you can maintain a secure and efficient workflow for managing cloud resources and services as part of our project.


# Configuring kubectl with AKS kubeconfig

After saving the kubeconfig file, you need to tell kubectl to use it when communicating with your Kubernetes cluster. You can do this by setting the KUBECONFIG environment variable to point to the file you just created:

```bash
export KUBECONFIG=./kubeconfig_aks
```

#### With KUBECONFIG set, you can now use kubectl to interact with your AKS cluster. For example, to get the list of nodes in your cluster, run:

```bash
kubectl get nodes
```

This configuration step is crucial for managing your AKS cluster. The `kubeconfig` file contains all the necessary details to connect to your Kubernetes cluster, including cluster certificates and user credentials. When you set the KUBECONFIG environment variable, `kubectl` reads this file to determine the cluster's endpoint and the appropriate method to authenticate.