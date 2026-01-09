#!/bin/bash

# archive-project.sh - Move project to completed or archived
# Usage: ./scripts/archive-project.sh <project-path> <destination>

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Help text
show_help() {
    cat << EOF
Usage: $0 <project-path> <destination> [options]

Move a project to completed or archived directory.

Arguments:
    project-path    Current path to project (e.g., active/my-project)
    destination     Where to move (completed, archived)

Options:
    -h, --help      Show this help message
    -r, --reason    Reason for archiving (required for archived)
    -k, --keep      Keep a copy in original location

Examples:
    $0 active/my-project completed
    $0 experiments/test-api archived -r "Experiment concluded"
    $0 learning/tutorial archived --reason "Tutorial completed"

Destinations:
    completed       Successfully finished projects
    archived        Paused, deprecated, or superseded projects
EOF
}

# Parse arguments
PROJECT_PATH=""
DESTINATION=""
REASON=""
KEEP_COPY=false

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            exit 0
            ;;
        -r|--reason)
            REASON="$2"
            shift 2
            ;;
        -k|--keep)
            KEEP_COPY=true
            shift
            ;;
        *)
            if [ -z "$PROJECT_PATH" ]; then
                PROJECT_PATH="$1"
            elif [ -z "$DESTINATION" ]; then
                DESTINATION="$1"
            else
                echo -e "${RED}Error: Unknown argument '$1'${NC}"
                exit 1
            fi
            shift
            ;;
    esac
done

# Validate arguments
if [ -z "$PROJECT_PATH" ] || [ -z "$DESTINATION" ]; then
    echo -e "${RED}Error: Missing required arguments${NC}"
    show_help
    exit 1
fi

# Validate destination
if [[ "$DESTINATION" != "completed" && "$DESTINATION" != "archived" ]]; then
    echo -e "${RED}Error: Destination must be 'completed' or 'archived'${NC}"
    exit 1
fi

# Check if reason provided for archived
if [[ "$DESTINATION" == "archived" && -z "$REASON" ]]; then
    echo -e "${RED}Error: Reason required when archiving${NC}"
    echo "Use -r or --reason to provide a reason"
    exit 1
fi

# Check if project exists
if [ ! -d "$PROJECT_PATH" ]; then
    echo -e "${RED}Error: Project not found at ${PROJECT_PATH}${NC}"
    exit 1
fi

# Extract project name
PROJECT_NAME=$(basename "$PROJECT_PATH")

# Set destination path
DEST_PATH="${DESTINATION}/${PROJECT_NAME}"

# Check if destination already exists
if [ -d "$DEST_PATH" ]; then
    echo -e "${RED}Error: Project already exists at ${DEST_PATH}${NC}"
    exit 1
fi

echo -e "${GREEN}Moving project: ${PROJECT_NAME}${NC}"
echo "From: ${PROJECT_PATH}"
echo "To:   ${DEST_PATH}"
[ -n "$REASON" ] && echo "Reason: ${REASON}"
echo ""

# Confirm action
read -p "Continue? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Aborted."
    exit 0
fi

# Move or copy project
if [ "$KEEP_COPY" = true ]; then
    cp -r "$PROJECT_PATH" "$DEST_PATH"
    echo "  ✓ Project copied to ${DEST_PATH}"
else
    mv "$PROJECT_PATH" "$DEST_PATH"
    echo "  ✓ Project moved to ${DEST_PATH}"
fi

# Update process-notes.md
if [ -f "${DEST_PATH}/process-notes.md" ]; then
    cat >> "${DEST_PATH}/process-notes.md" << EOF

---

## $(date +%Y-%m-%d) - Project ${DESTINATION^}

**Status**: Moved to ${DESTINATION}/

$([ -n "$REASON" ] && echo "**Reason**: ${REASON}")

EOF
    echo "  ✓ Updated process-notes.md"
fi

echo ""
echo -e "${GREEN}Project moved successfully!${NC}"
echo ""
echo "Next steps:"
echo "  1. Update PROJECTS.md - move entry to ${DESTINATION} section"
echo "  2. Update tags.json - change status to '${DESTINATION}'"
echo "  3. Add completion/archive date and reason"
echo ""
echo "Don't forget to:"
echo "  - Document final status in project README"
echo "  - Note any lessons learned"
echo "  - Update any related documentation"
