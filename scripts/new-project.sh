#!/bin/bash

# new-project.sh - Create a new project with template files
# Usage: ./scripts/new-project.sh <category> <project-name>

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Help text
show_help() {
    cat << EOF
Usage: $0 <category> <project-name> [options]

Create a new project with template files and directory structure.

Arguments:
    category        Project category (active, experiments, learning)
    project-name    Name of the project (kebab-case)

Options:
    -h, --help      Show this help message
    -n, --no-git    Don't initialize git repository
    -d, --desc      Project description (optional)

Examples:
    $0 active my-web-app
    $0 experiments test-api --no-git
    $0 learning rust-tutorial -d "Learning Rust basics"

Categories:
    active          Current projects under regular development
    completed       Finished projects (use archive-project.sh to move here)
    experiments     Quick POCs and technical spikes
    learning        Tutorial projects and skill development
    archived        Paused/deprecated projects (use archive-project.sh)
EOF
}

# Parse arguments
CATEGORY=""
PROJECT_NAME=""
INIT_GIT=true
DESCRIPTION=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            exit 0
            ;;
        -n|--no-git)
            INIT_GIT=false
            shift
            ;;
        -d|--desc)
            DESCRIPTION="$2"
            shift 2
            ;;
        *)
            if [ -z "$CATEGORY" ]; then
                CATEGORY="$1"
            elif [ -z "$PROJECT_NAME" ]; then
                PROJECT_NAME="$1"
            else
                echo -e "${RED}Error: Unknown argument '$1'${NC}"
                echo "Run '$0 --help' for usage information."
                exit 1
            fi
            shift
            ;;
    esac
done

# Validate arguments
if [ -z "$CATEGORY" ] || [ -z "$PROJECT_NAME" ]; then
    echo -e "${RED}Error: Missing required arguments${NC}"
    show_help
    exit 1
fi

# Validate category
VALID_CATEGORIES=("active" "completed" "experiments" "learning" "archived")
if [[ ! " ${VALID_CATEGORIES[@]} " =~ " ${CATEGORY} " ]]; then
    echo -e "${RED}Error: Invalid category '${CATEGORY}'${NC}"
    echo "Valid categories: ${VALID_CATEGORIES[*]}"
    exit 1
fi

# Validate project name (kebab-case)
if [[ ! "$PROJECT_NAME" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
    echo -e "${YELLOW}Warning: Project name should be in kebab-case (lowercase with hyphens)${NC}"
fi

# Set project path
PROJECT_PATH="${CATEGORY}/${PROJECT_NAME}"

# Check if project already exists
if [ -d "$PROJECT_PATH" ]; then
    echo -e "${RED}Error: Project already exists at ${PROJECT_PATH}${NC}"
    exit 1
fi

echo -e "${GREEN}Creating new project: ${PROJECT_NAME}${NC}"
echo "Category: ${CATEGORY}"
echo "Path: ${PROJECT_PATH}"
echo ""

# Create project directory
mkdir -p "$PROJECT_PATH"

# Copy template files
echo "Copying templates..."
if [ -f "templates/README-template.md" ]; then
    cp "templates/README-template.md" "${PROJECT_PATH}/README.md"
    # Replace placeholders
    sed -i.bak "s/\[Project Name\]/${PROJECT_NAME}/g" "${PROJECT_PATH}/README.md"
    sed -i.bak "s/\[project-name\]/${PROJECT_NAME}/g" "${PROJECT_PATH}/README.md"
    rm "${PROJECT_PATH}/README.md.bak" 2>/dev/null || true
    echo "  ✓ README.md"
fi

if [ -f "templates/ARCHITECTURE-template.md" ]; then
    cp "templates/ARCHITECTURE-template.md" "${PROJECT_PATH}/ARCHITECTURE.md"
    sed -i.bak "s/\[Project Name\]/${PROJECT_NAME}/g" "${PROJECT_PATH}/ARCHITECTURE.md"
    rm "${PROJECT_PATH}/ARCHITECTURE.md.bak" 2>/dev/null || true
    echo "  ✓ ARCHITECTURE.md"
fi

if [ -f "templates/gitignore-template" ]; then
    cp "templates/gitignore-template" "${PROJECT_PATH}/.gitignore"
    echo "  ✓ .gitignore"
fi

# Create initial process-notes.md
cat > "${PROJECT_PATH}/process-notes.md" << EOF
# Process Notes - ${PROJECT_NAME}

Work log for this project. (This file is gitignored)

## $(date +%Y-%m-%d) - Project Initialization

**Session Goal**: Set up ${PROJECT_NAME} project structure

### What Was Accomplished
- Created project structure using new-project.sh
- Initialized template files

### Next Steps
- Define project requirements
- Set up development environment
- Begin implementation

---
EOF
echo "  ✓ process-notes.md"

# Initialize git if requested
if [ "$INIT_GIT" = true ]; then
    cd "$PROJECT_PATH"
    git init
    git add .
    git commit -m "Initial commit for ${PROJECT_NAME}"
    cd - > /dev/null
    echo "  ✓ Git repository initialized"
fi

echo ""
echo -e "${GREEN}Project created successfully!${NC}"
echo ""
echo "Next steps:"
echo "  1. cd ${PROJECT_PATH}"
echo "  2. Edit README.md with project details"
echo "  3. Update PROJECTS.md with project entry"
echo "  4. Add project metadata to tags.json"
echo ""
echo "Documentation commands:"
echo "  /project-docs:readme         - Update README"
echo "  /project-docs:architecture   - Document design"
echo "  /project-docs:process-notes  - Log work progress"
