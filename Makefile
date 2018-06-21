BIN             = hello
OUTPUT_DIR      = .build

.PHONY: help
.DEFAULT_GOAL := help

build: clean ## Build a linux binary ready to be zipped for AWS Lambda
	mkdir -p $(OUTPUT_DIR) && GOOS=linux GOARCH=amd64 go build -o $(OUTPUT_DIR)/$(BIN) .
	cd $(OUTPUT_DIR) && zip $(BIN).zip $(BIN)

clean: ## Remove Lambda build artifacts
	$(RM) $(OUTPUT_DIR)/$(BIN).zip
	$(RM) $(OUTPUT_DIR)/$(BIN)

help: ## Display this help message
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_\/-]+:.*?## / {printf "\033[34m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST) | \
		sort | \
		grep -v '#'	