package cmd

import (
	"fmt"
	"os"
	"os/exec"

	"github.com/spf13/cobra"
)

var deployOpsManagerCmd = &cobra.Command{
	Use:   "deploy-ops-manager",
	Short: "Deploys MongoDB Ops Manager",
	Run: func(cmd *cobra.Command, args []string) {
		err := deployOpsManager()
		if err != nil {
			fmt.Printf("Failed to deploy MongoDB Ops Manager: %v\n", err)
			return
		}

		fmt.Println("MongoDB Ops Manager deployed successfully!")
	},
}

func init() {
	rootCmd.AddCommand(deployOpsManagerCmd)
}

func deployOpsManager() error {
	fmt.Println("Deploying MongoDB Ops Manager...")
	cmd := exec.Command("kubectl", "apply", "-f", "ops-manager.yaml")
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	return cmd.Run()
}