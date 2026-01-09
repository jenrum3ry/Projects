#!/bin/bash

# update-project-list.sh - Generate project summaries for PROJECTS.md
# Usage: ./scripts/update-project-list.sh

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}Generating project statistics...${NC}"
echo ""

# Count projects in each category
count_projects() {
    local category=$1
    local count=$(find "$category" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | wc -l)
    echo $count
}

ACTIVE=$(count_projects "active")
COMPLETED=$(count_projects "completed")
EXPERIMENTS=$(count_projects "experiments")
LEARNING=$(count_projects "learning")
ARCHIVED=$(count_projects "archived")
TOTAL=$((ACTIVE + COMPLETED + EXPERIMENTS + LEARNING + ARCHIVED))

echo "Project Statistics:"
echo "  Active:      $ACTIVE"
echo "  Completed:   $COMPLETED"
echo "  Experiments: $EXPERIMENTS"
echo "  Learning:    $LEARNING"
echo "  Archived:    $ARCHIVED"
echo "  ─────────────────"
echo "  Total:       $TOTAL"
echo ""

# List projects by category
list_projects() {
    local category=$1
    local projects=$(find "$category" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | sort)

    if [ -n "$projects" ]; then
        echo -e "${GREEN}${category^} Projects:${NC}"
        while IFS= read -r project; do
            local name=$(basename "$project")
            local readme="${project}/README.md"
            local desc=""

            # Try to extract first line from README
            if [ -f "$readme" ]; then
                desc=$(head -n 3 "$readme" | grep -v "^#" | grep -v "^$" | head -n 1 | cut -c1-80)
            fi

            echo "  - ${name}"
            [ -n "$desc" ] && echo "    ${desc}"
        done <<< "$projects"
        echo ""
    fi
}

# List all projects
list_projects "active"
list_projects "completed"
list_projects "experiments"
list_projects "learning"
list_projects "archived"

echo -e "${YELLOW}Note: Update PROJECTS.md manually with detailed information${NC}"
echo "This script provides a quick overview. For full tracking, maintain PROJECTS.md and tags.json."
