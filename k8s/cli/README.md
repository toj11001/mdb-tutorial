# MongoDB Kubernetes Automation CLI

This CLI tool automates the deployment of MongoDB components on Kubernetes clusters in GCP or Azure. It provides commands to:

1. Create a Kubernetes cluster.
2. Install the MongoDB Operator using Helm.
3. Deploy MongoDB Ops Manager.
4. Configure the Ops Manager API and whitelist IP addresses.
5. Deploy a MongoDB cluster.

## Prerequisites

- **Go**: Ensure Go is installed on your system. [Download Go](https://golang.org/dl/)
- **kubectl**: Kubernetes command-line tool. [Install kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- **Helm**: Package manager for Kubernetes. [Install Helm](https://helm.sh/docs/intro/install/)
- **Cloud CLI Tools**:
  - For GCP: [Install Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
  - For Azure: [Install Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

## Installation

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/tobiasjoschko/mdb-tutorial.git
   cd mdb-tutorial/k8s/cli
   ```

2. **Build the CLI**:

   ```bash
   go build -o mongodb-k8s-cli
   ```

   This command compiles the Go code and produces an executable named `mongodb-k8s-cli`.

## Usage

The CLI provides the following commands:

### Create Kubernetes Cluster

```bash
./mongodb-k8s-cli create-cluster --provider [gcp|azure]
```

- `--provider`: Specifies the cloud provider (`gcp` or `azure`).

### Install MongoDB Operator

```bash
./mongodb-k8s-cli install-operator
```

### Deploy MongoDB Ops Manager

```bash
./mongodb-k8s-cli deploy-ops-manager
```

### Configure API and Whitelist IP

```bash
./mongodb-k8s-cli configure-api --ops-manager-url <URL> --public-key <PUBLIC_KEY> --private-key <PRIVATE_KEY>
```

- `--ops-manager-url`: The base URL of your Ops Manager instance.
- `--public-key`: The public API key for Ops Manager.
- `--private-key`: The private API key for Ops Manager.

### Deploy MongoDB Cluster

```bash
./mongodb-k8s-cli deploy-cluster
```

## Notes

- Ensure you have the necessary permissions and configurations set up in your cloud provider account.
- The `configure-api` command requires valid Ops Manager API credentials.
- Before deploying the MongoDB cluster, ensure that the Ops Manager is accessible and properly configured.

For detailed information on each command and its options, use the `--help` flag:

```bash
./mongodb-k8s-cli [command] --help
```


