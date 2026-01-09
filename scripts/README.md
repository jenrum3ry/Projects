# Utility Scripts

Helper scripts for managing projects in this repository.

## Available Scripts

### new-project.sh

Create a new project with template files and directory structure.

**Usage:**
```bash
./scripts/new-project.sh <category> <project-name> [options]
```

**Examples:**
```bash
# Create active project
./scripts/new-project.sh active my-web-app

# Create experiment without git init
./scripts/new-project.sh experiments test-api --no-git

# Create learning project with description
./scripts/new-project.sh learning rust-tutorial -d "Learning Rust basics"
```

**What it does:**
- Creates project directory in specified category
- Copies template files (README, ARCHITECTURE, .gitignore)
- Initializes process-notes.md
- Optionally initializes git repository
- Provides next steps guidance

### archive-project.sh

Move a project to completed or archived directory.

**Usage:**
```bash
./scripts/archive-project.sh <project-path> <destination> [options]
```

**Examples:**
```bash
# Move to completed
./scripts/archive-project.sh active/my-project completed

# Archive with reason
./scripts/archive-project.sh experiments/test-api archived -r "Experiment concluded"

# Keep copy in original location
./scripts/archive-project.sh learning/tutorial archived --reason "Tutorial done" --keep
```

**What it does:**
- Moves project to completed/ or archived/ directory
- Updates process-notes.md with archive information
- Provides reminders to update PROJECTS.md and tags.json

### update-project-list.sh

Generate project statistics and summaries.

**Usage:**
```bash
./scripts/update-project-list.sh
```

**What it does:**
- Counts projects in each category
- Lists all projects with descriptions
- Provides overview of repository contents
- Useful for generating reports or updates

## Making Scripts Executable

Before first use, make scripts executable:

```bash
chmod +x scripts/*.sh
```

## Script Conventions

All scripts follow these conventions:
- Bash shebang: `#!/bin/bash`
- Set error handling: `set -e`
- Provide `--help` option for usage information
- Use colors for output (green=success, yellow=warning, red=error)
- Validate arguments before execution
- Provide clear error messages

## Adding New Scripts

When creating new utility scripts:

1. Follow naming convention: `action-description.sh`
2. Add shebang and error handling
3. Include help text with `-h/--help` option
4. Validate inputs and provide clear errors
5. Add color-coded output for better UX
6. Document in this README
7. Make executable: `chmod +x scripts/new-script.sh`

## Common Tasks

### Creating a New Project
```bash
# Quick start with defaults
./scripts/new-project.sh active my-new-project

# Then update metadata
# 1. Edit project README and ARCHITECTURE
# 2. Add entry to PROJECTS.md
# 3. Update tags.json
```

### Completing a Project
```bash
# Move to completed
./scripts/archive-project.sh active/my-project completed

# Update metadata
# 1. Update PROJECTS.md (move to completed section)
# 2. Update tags.json (status: "completed", add completion date)
# 3. Add final notes to process-notes.md
```

### Archiving a Project
```bash
# Archive with reason
./scripts/archive-project.sh active/old-project archived -r "Superseded by new-project"

# Update metadata
# 1. Update PROJECTS.md (move to archived section, add reason)
# 2. Update tags.json (status: "archived", reason, date)
```

### Generating Reports
```bash
# Get overview of all projects
./scripts/update-project-list.sh

# Can be used for:
# - Weekly status updates
# - Portfolio summaries
# - Repository health checks
```

## Troubleshooting

**Script not executable**
```bash
chmod +x scripts/script-name.sh
```

**sed compatibility issues (macOS)**
The scripts use `sed -i.bak` for compatibility with both GNU and BSD sed. Backup files (*.bak) are automatically removed.

**Path issues**
Run scripts from repository root:
```bash
# Correct
./scripts/new-project.sh active my-project

# Incorrect
cd scripts && ./new-project.sh active my-project  # Won't find templates
```

---

**Last Updated**: 2026-01-09
