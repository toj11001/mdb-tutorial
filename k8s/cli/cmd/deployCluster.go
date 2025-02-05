package cmd

import (
	"fmt"
	"os"
	"os/exec"

	"github.com/spf13/cobra"
)

var deployClusterCmd = &cobra.Command{
	Use:   "deploy-cluster",
	Short: "Deploys a MongoDB cluster",
	Run: func(cmd *cobra.Command, args []string) {
		// Ensure API is configured before proceeding
		fmt.Println("Checking API configuration...")
		// TODO: Implement validation logic

		err := deployMongoDBCluster()
		if err != nil {
			fmt.Printf("Failed to deploy MongoDB cluster: %v\n", err)
			return
		}

		fmt.Println("MongoDB cluster deployed successfully!")
	},
}

func init() {
	rootCmd.AddCommand(deployClusterCmd)
}

func deployMongoDBCluster() error {
	fmt.Println("Deploying MongoDB Cluster...")
	cmd := exec.Command("kubectl", "apply", "-f", "mongodb-cluster.yaml")
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	return cmd.Run()
}