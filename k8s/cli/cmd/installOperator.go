package cmd

import (
	"fmt"
	"os"
	"os/exec"

	"github.com/spf13/cobra"
)

var installOperatorCmd = &cobra.Command{
	Use:   "install-operator",
	Short: "Installs the MongoDB Operator using Helm",
	Run: func(cmd *cobra.Command, args []string) {
		err := installMongoDBOperator()
		if err != nil {
			fmt.Printf("Failed to install MongoDB Operator: %v\n", err)
			return
		}

		fmt.Println("MongoDB Operator installed successfully!")
	},
}

func init() {
	rootCmd.AddCommand(installOperatorCmd)
}

func installMongoDBOperator() error {
	fmt.Println("Installing MongoDB Operator using Helm...")
	cmd := exec.Command("helm", "install", "mongodb-operator", "bitnami/mongodb-operator", "--namespace", "mongodb")
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	return cmd.Run()
}