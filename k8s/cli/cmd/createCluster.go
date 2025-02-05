package cmd

import (
	"fmt"
	"os"
	"os/exec"

	"github.com/spf13/cobra"
)

var createClusterCmd = &cobra.Command{
	Use:   "create-cluster",
	Short: "Creates a Kubernetes cluster in GCP or Azure",
	Run: func(cmd *cobra.Command, args []string) {
		provider, _ := cmd.Flags().GetString("provider")

		if provider == "" {
			fmt.Println("Error: You must specify a cloud provider using --provider=gcp or --provider=azure")
			return
		}

		err := createKubernetesCluster(provider)
		if err != nil {
			fmt.Printf("Failed to create Kubernetes cluster: %v\n", err)
			return
		}

		fmt.Println("Kubernetes cluster created successfully!")
	},
}

func init() {
	rootCmd.AddCommand(createClusterCmd)
	createClusterCmd.Flags().StringP("provider", "p", "", "Specify cloud provider: gcp or azure")
}

func createKubernetesCluster(provider string) error {
	var cmd *exec.Cmd

	if provider == "gcp" {
		fmt.Println("Creating Kubernetes cluster in GCP...")
		cmd = exec.Command("gcloud", "container", "clusters", "create", "my-cluster", "--zone", "us-central1-a")
	} else if provider == "azure" {
		fmt.Println("Creating Kubernetes cluster in Azure...")
		cmd = exec.Command("az", "aks", "create", "--resource-group", "my-resource-group", "--name", "my-cluster", "--node-count", "3", "--enable-addons", "monitoring", "--generate-ssh-keys")
	} else {
		return fmt.Errorf("invalid provider: %s. Use 'gcp' or 'azure'", provider)
	}

	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	return cmd.Run()
}