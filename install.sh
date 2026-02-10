#!/usr/bin/env bash
#
# Install script for AI Agent OSS Helper commands
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/YOUR_ORG/ai-agents-oss-helper/main/install.sh | bash
#   ./install.sh              # Install to both claude and bob
#   ./install.sh claude       # Install to claude only
#   ./install.sh bob          # Install to bob only
#

set -euo pipefail

# Configuration
BASE_URL="${BASE_URL:-https://raw.githubusercontent.com/orpiske/ai-agents-oss-helper/main}"
AGENTS=("claude" "bob")

# Command files to install (relative paths from repo root)
COMMAND_FILES=(
    "ai-agents-oss-helper/ai-agents-oss-helper-create-cmd.md"
    "camel-core/camel-fix-sonarcloud.md"
    "camel-core/camel-core-fix-jira-issue.md"
    "camel-core/camel-core-find-task.md"
    "wanaku/wanaku-create-issue.md"
    "wanaku/wanaku-find-task.md"
    "wanaku/wanaku-fix-issue.md"
)

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1" >&2
}

# Determine script location (for local installs)
get_script_dir() {
    if [[ -n "${BASH_SOURCE[0]:-}" ]] && [[ -f "${BASH_SOURCE[0]}" ]]; then
        cd "$(dirname "${BASH_SOURCE[0]}")" && pwd
    else
        echo ""
    fi
}

# Download or copy a file
fetch_file() {
    local src="$1"
    local dest="$2"
    local script_dir
    script_dir="$(get_script_dir)"

    # If running locally and file exists, copy it
    if [[ -n "$script_dir" ]] && [[ -f "$script_dir/$src" ]]; then
        cp "$script_dir/$src" "$dest"
        return 0
    fi

    # Otherwise, download from remote
    if command -v curl &> /dev/null; then
        curl -fsSL "$BASE_URL/$src" -o "$dest"
    elif command -v wget &> /dev/null; then
        wget -q "$BASE_URL/$src" -O "$dest"
    else
        error "Neither curl nor wget found. Cannot download files."
        return 1
    fi
}

# Install commands for a specific agent
install_for_agent() {
    local agent="$1"
    local target_dir="$HOME/.$agent/commands"

    info "Installing commands for $agent..."

    # Create target directory
    if ! mkdir -p "$target_dir"; then
        error "Failed to create directory: $target_dir"
        return 1
    fi

    # Install each command file
    for file in "${COMMAND_FILES[@]}"; do
        local filename
        filename="$(basename "$file")"
        local dest="$target_dir/$filename"

        if fetch_file "$file" "$dest"; then
            info "  Installed: $filename"
        else
            error "  Failed to install: $filename"
            return 1
        fi
    done

    info "Commands installed to: $target_dir"
}

# Main
main() {
    local agents_to_install=()

    # Parse arguments
    if [[ $# -eq 0 ]]; then
        # No arguments: install for all agents
        agents_to_install=("${AGENTS[@]}")
    else
        # Validate agent argument
        local valid=false
        for agent in "${AGENTS[@]}"; do
            if [[ "$1" == "$agent" ]]; then
                valid=true
                break
            fi
        done

        if [[ "$valid" == "false" ]]; then
            error "Unknown agent: $1"
            echo "Valid agents: ${AGENTS[*]}"
            exit 1
        fi

        agents_to_install=("$1")
    fi

    echo ""
    echo "AI Agent OSS Helper - Command Installer"
    echo "========================================"
    echo ""

    # Install for each agent
    for agent in "${agents_to_install[@]}"; do
        install_for_agent "$agent"
        echo ""
    done

    info "Installation complete!"
    echo ""
    echo "Available commands:"
    for file in "${COMMAND_FILES[@]}"; do
        local filename
        filename="$(basename "$file" .md)"
        echo "  /$filename"
    done
}

main "$@"
