# Projects

A centralized repository for tracking all my work, projects, and learning activities.

## Purpose

This repository serves as:
- **Project Portfolio**: Showcase of completed and ongoing work
- **Work Tracker**: Organized documentation of development progress
- **Learning Log**: Record of experiments, courses, and technical growth
- **Knowledge Base**: Centralized documentation and resources

## Repository Structure

```
Projects/
├── active/              # Currently active projects
├── completed/           # Finished projects
├── experiments/         # Quick experiments and POCs
├── learning/           # Learning projects and tutorials
├── archived/           # Inactive or deprecated projects
├── templates/          # Project starter templates
├── resources/          # Learning resources and bookmarks
├── scripts/            # Utility scripts for project management
├── project-docs/       # Documentation plugin (git submodule)
├── PROJECTS.md         # Master project tracker
├── process-notes.md    # High-level work log
├── tags.json           # Project metadata and categorization
└── WORKFLOW.md         # Personal development workflow
```

## Quick Start

### Setting Up a New Project

1. Choose the appropriate directory (`active/`, `experiments/`, or `learning/`)
2. Create project directory with descriptive name
3. Copy template files from `templates/`
4. Update `PROJECTS.md` with project details
5. Initialize documentation using project-docs plugin

### Using the Project-Docs Plugin

The `project-docs/` submodule provides Claude Code commands for maintaining documentation:

**Installation** (if not already installed):
```bash
claude plugins add teresa-torres-plugins/project-docs
```

**Key Commands**:
- `/project-docs:readme` - Update project README with setup/usage info
- `/project-docs:architecture` - Document system design and patterns
- `/project-docs:process-notes` - Log work history and decisions
- `/project-docs:ab-test <name>` - Document A/B tests and experiments

**When to Use**:
- Start of each work session: Review existing docs
- During development: Log key decisions and blockers
- End of session: Update process-notes with progress
- Before context fills: Capture important details
- After major changes: Update architecture/README

### Tracking Work

- **Daily**: Update `process-notes.md` with session progress
- **Per Project**: Maintain individual `README.md` and `ARCHITECTURE.md`
- **Weekly**: Review and update `PROJECTS.md` status
- **Monthly**: Archive completed projects, update learning goals

## Project Categories

### Active Projects
Currently under development with regular updates.

### Completed Projects
Finished projects that are deployed or delivered.

### Experiments
Quick proofs-of-concept, spikes, and technical explorations.

### Learning
Tutorial projects, course work, and skill development.

### Archived
Deprecated, paused, or superseded projects kept for reference.

## Documentation Standards

Each project should include:
- `README.md` - What it is, how to use it, setup instructions
- `ARCHITECTURE.md` - Design decisions, patterns, system overview
- `process-notes.md` - Development history and decisions (gitignored)
- Tests, if applicable
- Deployment/build instructions

## Naming Conventions

- **Projects**: `kebab-case-descriptive-name`
- **Branches**: `feature/description` or `fix/description`
- **Commits**: Imperative mood ("Add feature" not "Added feature")

## Git Workflow

1. Create feature branch from main: `git checkout -b feature/name`
2. Make changes and commit regularly
3. Update documentation before committing code
4. Push and create PR when ready
5. Merge to main after review

## Resources

See `resources/` directory for:
- Curated bookmarks and articles
- Course materials and notes
- Technical references
- Tools and utilities

## Tools & Scripts

The `scripts/` directory contains utilities for:
- Scaffolding new projects
- Generating project summaries
- Archiving completed work
- Updating project metadata

Run `./scripts/new-project.sh --help` for usage information.

## Status Overview

For current project status and statistics, see [PROJECTS.md](./PROJECTS.md).

## License

See [LICENSE](./LICENSE) for details.

---

**Last Updated**: 2026-01-09
