.PHONY: help lint-markdown lint-yaml lint-shell scan-secrets ci-local

help: ## Show available targets
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z0-9_.-]+:.*##/ {printf "%-18s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

lint-markdown: ## Lint markdown files (requires markdownlint-cli)	
	@if command -v markdownlint >/dev/null 2>&1; then \
		markdownlint '**/*.md'; \
	else \
		echo 'markdownlint not installed. Install: npm i -g markdownlint-cli'; \
		exit 1; \
	fi

lint-yaml: ## Lint YAML files (requires yamllint)
	@if command -v yamllint >/dev/null 2>&1; then \
		yamllint .; \
	else \
		echo 'yamllint not installed. Install: pip install yamllint'; \
		exit 1; \
	fi

lint-shell: ## Lint shell scripts (requires shellcheck)
	@if command -v shellcheck >/dev/null 2>&1; then \
		files=$$(find . -type f -name '*.sh' -not -path './.git/*'); \
		if [ -z "$$files" ]; then \
			echo 'No shell scripts found.'; \
		else \
			echo "$$files" | xargs shellcheck; \
		fi; \
	else \
		echo 'shellcheck not installed. Install: apt install shellcheck'; \
		exit 1; \
	fi

scan-secrets: ## Run gitleaks scan (requires gitleaks)
	@if command -v gitleaks >/dev/null 2>&1; then \
		gitleaks detect --source . --verbose; \
	else \
		echo 'gitleaks not installed: https://github.com/gitleaks/gitleaks'; \
		exit 1; \
	fi

ci-local: lint-markdown lint-yaml lint-shell scan-secrets ## Run all local checks
