# Project Tracker

Master list of all projects with current status and metadata.

**Last Updated**: 2026-01-09

---

## Summary Statistics

- **Active Projects**: 0
- **Completed Projects**: 0
- **Experiments**: 0
- **Learning Projects**: 0
- **Archived Projects**: 0
- **Total Projects**: 0

---

## Active Projects

Currently under development with regular updates.

| Project | Description | Started | Tech Stack | Status | Next Steps |
|---------|-------------|---------|------------|--------|------------|
| _(none)_ | | | | | |

---

## Completed Projects

Successfully finished and delivered.

| Project | Description | Completed | Tech Stack | Outcome | Links |
|---------|-------------|-----------|------------|---------|-------|
| _(none)_ | | | | | |

---

## Experiments

Quick POCs and technical explorations.

| Project | Purpose | Started | Status | Findings |
|---------|---------|---------|--------|----------|
| _(none)_ | | | | |

---

## Learning Projects

Tutorials, courses, and skill development.

| Project | Topic | Started | Status | Key Learnings |
|---------|-------|---------|--------|---------------|
| _(none)_ | | | | |

---

## Archived Projects

Paused or deprecated projects kept for reference.

| Project | Reason for Archiving | Archived Date | Status at Archive |
|---------|---------------------|---------------|-------------------|
| _(none)_ | | | |

---

## Project Details Template

When adding a new project, include:

### [Project Name]

**Location**: `category/project-name/`
**Status**: [Active | Completed | In Progress | On Hold]
**Started**: YYYY-MM-DD
**Completed**: YYYY-MM-DD _(if applicable)_

**Description**: Brief overview of what this project is and its purpose.

**Technologies**:
- List main technologies, frameworks, languages

**Goals**:
- Primary objectives and success criteria

**Current Status**:
- What's working
- What's in progress
- Any blockers

**Links**:
- [Repository](#)
- [Documentation](#)
- [Live Demo](#) _(if applicable)_

**Related Projects**: References to related work

---

## How to Update This File

### Adding a New Project

1. Add row to appropriate category table with basic info
2. Update summary statistics
3. Optionally add detailed section at bottom
4. Update tags.json with metadata

### Updating Project Status

1. Modify status column in table
2. Update "Next Steps" or relevant fields
3. Update last modified date at top

### Moving Between Categories

1. Remove from current category table
2. Add to new category table
3. Update summary statistics
4. Update tags.json

### Archiving a Project

1. Move from current table to Archived table
2. Document reason for archiving
3. Update summary statistics
4. Move files to `archived/` directory
5. Update tags.json

---

## Status Definitions

- **Planning**: Project scoped, not yet started
- **In Progress**: Actively being developed
- **Active**: Ongoing maintenance/updates
- **On Hold**: Temporarily paused
- **Completed**: Finished and delivered
- **Archived**: No longer maintained
- **Blocked**: Waiting on external dependencies

---

## Tags and Categories

Common tags used in tags.json:

**Languages**: python, javascript, typescript, go, rust, java, etc.

**Domains**: web, mobile, cli, data, ml, devops, etc.

**Types**: library, application, tool, api, service, etc.

**Status**: active, completed, archived, learning, experiment, etc.

---

**Note**: Run `./scripts/update-project-list.sh` to auto-generate project summaries from filesystem and tags.json.
