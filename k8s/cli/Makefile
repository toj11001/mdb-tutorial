# Variables
BINARY_NAME=mongodb-k8s-cli
SOURCE_DIR=./cmd
OUTPUT_DIR=./bin

# Default target
all: build

# Build the CLI
build:
	mkdir -p $(OUTPUT_DIR)
	go build -o $(OUTPUT_DIR)/$(BINARY_NAME) $(SOURCE_DIR)

# Run tests
test:
	go test ./...

# Clean up build artifacts
clean:
	rm -f $(OUTPUT_DIR)/$(BINARY_NAME)

# Install the CLI
install:
	go install $(SOURCE_DIR)

# Run the CLI
run: build
	./$(OUTPUT_DIR)/$(BINARY_NAME)

.PHONY: all build test clean install run