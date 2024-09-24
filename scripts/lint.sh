#!/bin/bash
set -eufo pipefail

export RED='\E[1;31m'
export YELLOW='\E[1;33m'
export RESET='\033[0m'

cd -- "$(dirname -- "$0")/.." || exit 1

if ! command -v golangci-lint &>/dev/null; then
	echo -e "${YELLOW}Installing golangci-lint ...${RESET}"
	go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
fi

if ! command -v govulncheck &>/dev/null; then
	echo -e "${YELLOW}Installing govulncheck ...${RESET}"
	go install golang.org/x/vuln/cmd/govulncheck@latest
fi

trap cleanup EXIT
cleanup() {
	if [ "$?" -ne 0 ]; then
		echo -e "${RED}LINTING FAILED${RESET}"
	fi
}

echo -e "${YELLOW}golangci-lint ...${RESET}"
golangci-lint run ./...

echo -e "${YELLOW}govulncheck ...${RESET}"
govulncheck ./...
