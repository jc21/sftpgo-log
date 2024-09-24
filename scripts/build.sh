#!/bin/bash
set -eufo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "$0")" && pwd)"
PROJ_DIR="$(readlink -f "$SCRIPT_DIR/..")"
cd "$PROJ_DIR"

GITVERSION="$(git rev-parse HEAD)"

# TODO: xargs GITVERSION
go build -o bin/sftpgo-log ./cmd/sftpgo-log
