.PHONY: all
all: help

.PHONY: lint
lint: ## Run the golangci linter
	golangci-lint run

.PHONY: test
test: ## Run the application unit tests
	go test -v ./...

.PHONY: dev
dev: ## Run the application inside nonodo
	nonodo -- go run .

.PHONY: build
build: ## Build the application RISC-V image with sunodo
	cartesi build

.PHONY: run
run: ## Run the application in the Cartesi Machine with sunodo
	cartesi run

.PHONY: clean
clean: ## Delete the application RISC-V image generated by sunodo
	rm -rf .cartesi

.PHONY: help
help: ## Show help for each of the Makefile recipes
	@grep "##" $(MAKEFILE_LIST) | grep -v grep | sed -e 's/:.*##/:\t/'
