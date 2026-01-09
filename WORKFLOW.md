# Personal Development Workflow

This document outlines my personal workflow for managing projects in this repository.

## Daily Workflow

### Starting a Work Session

1. **Review Context**
   - Check `PROJECTS.md` for current priorities
   - Review relevant `process-notes.md` from last session
   - Read project `README.md` and `ARCHITECTURE.md` if needed

2. **Set Session Goals**
   - Identify specific tasks to accomplish
   - Create branch if starting new feature
   - Update project status in `PROJECTS.md` if needed

3. **Work with Documentation**
   - Keep `process-notes.md` open for logging decisions
   - Use `/project-docs:process-notes` when hitting key milestones
   - Document blockers and decisions as they happen

### During Development

1. **Make Incremental Progress**
   - Commit early and often with clear messages
   - Keep commits focused on single logical changes
   - Write tests alongside code when applicable

2. **Document as You Go**
   - Update README when adding user-facing features
   - Update ARCHITECTURE when changing design patterns
   - Log important decisions in process-notes

3. **Handle Context Window Limits**
   - Use `/project-docs:process-notes` before context fills
   - Summarize current progress and next steps
   - Note any important details that might be lost

### Ending a Work Session

1. **Update Documentation**
   - Run `/project-docs:process-notes` to capture session summary
   - Update `PROJECTS.md` with current status
   - Note any blockers or next steps

2. **Clean Up**
   - Commit all work-in-progress changes
   - Push branch to remote for backup
   - Update tags.json if project status changed

3. **Plan Next Session**
   - Write clear next steps in process-notes
   - Leave breadcrumbs for future self
   - Note any context that will be important

## Project Lifecycle

### Starting a New Project

1. **Choose Category**
   - `active/` - Main project with regular development
   - `experiments/` - Quick POC or technical spike
   - `learning/` - Tutorial or learning exercise

2. **Create Structure**
   ```bash
   ./scripts/new-project.sh <category> <project-name>
   ```
   Or manually:
   - Create project directory
   - Copy templates from `templates/`
   - Initialize git if separate repo

3. **Set Up Documentation**
   - Fill in README.md with project goals
   - Create ARCHITECTURE.md for design notes
   - Add entry to `PROJECTS.md`
   - Add metadata to `tags.json`

4. **Initialize Development**
   - Set up development environment
   - Install dependencies
   - Create initial commit
   - Document setup steps in README

### During Project Development

1. **Regular Updates**
   - Daily: Update process-notes.md
   - Weekly: Review and update PROJECTS.md status
   - On major changes: Update README and ARCHITECTURE
   - Before context limit: Run process-notes command

2. **Branching Strategy**
   - `main` - Stable, working code
   - `feature/*` - New features
   - `fix/*` - Bug fixes
   - `experiment/*` - Exploratory work

3. **Documentation Triggers**
   - New feature → Update README (usage) + process-notes (decisions)
   - Architecture change → Update ARCHITECTURE.md
   - Deployment change → Update README (setup/deploy)
   - Bug fix → Update process-notes (what/why)
   - Pattern established → Update ARCHITECTURE.md

### Completing a Project

1. **Final Documentation**
   - Ensure README is complete and accurate
   - Final ARCHITECTURE.md update
   - Last process-notes entry with summary
   - Add any lessons learned

2. **Clean Up**
   - Remove temporary files
   - Archive scratch notes
   - Ensure all branches merged
   - Tag final version

3. **Move to Completed**
   ```bash
   ./scripts/archive-project.sh <project-name> completed
   ```
   Or manually:
   - Move from `active/` to `completed/`
   - Update `PROJECTS.md` status
   - Update `tags.json`
   - Add completion date

4. **Post-Project Review**
   - What went well?
   - What would I do differently?
   - New skills learned?
   - Patterns to reuse?

### Archiving a Project

For projects that are paused, deprecated, or no longer relevant:

```bash
./scripts/archive-project.sh <project-name> archived
```

Or manually:
- Move to `archived/` directory
- Update `PROJECTS.md` with reason for archiving
- Update `tags.json` status
- Add archive date

## Naming Conventions

### Projects
- Use `kebab-case-names`
- Be descriptive but concise
- Include tech stack if ambiguous: `python-data-analyzer`
- Include purpose if needed: `learning-rust-basics`

### Git Branches
- `feature/add-authentication`
- `fix/memory-leak-in-parser`
- `experiment/try-new-algorithm`
- `docs/update-architecture`

### Git Commits
- Use imperative mood: "Add feature" not "Added feature"
- Start with verb: Add, Update, Fix, Remove, Refactor
- Keep first line under 72 characters
- Add details in body if needed

Examples:

- `Add user authentication with JWT`
- `Fix memory leak in data parser`
- `Update README with installation instructions`
- `Refactor database queries for performance`

### Files
- `README.md` - Project overview and usage
- `ARCHITECTURE.md` - Design and technical details
- `process-notes.md` - Work log (gitignored)
- `CHANGELOG.md` - Version history (if applicable)
- `CONTRIBUTING.md` - Contribution guidelines (if open source)

## Using the Project-Docs Plugin

### When to Use Each Command

#### `/project-docs:readme`

Use when:

- Starting a new project
- Adding user-facing features
- Changing setup/installation process
- Modifying deployment procedures
- Adding configuration options

#### `/project-docs:architecture`

Use when:

- Designing initial system architecture
- Adding new infrastructure components
- Establishing new patterns or conventions
- Changing data models
- Modifying API structure
- Making architectural decisions

#### `/project-docs:process-notes`

Use when:

- End of work session
- Context window approaching limit (~90%)
- Completing a major feature or milestone
- Making important decisions
- Encountering and solving difficult bugs
- Discovering dead ends or failed approaches
- Learning something significant

#### `/project-docs:ab-test`

Use when:

- Planning experiments or comparisons
- Testing multiple approaches
- Measuring feature impact
- Running actual A/B tests

### Agent Usage

#### `/project-docs:plan-review`

Use before implementing complex features:

- After creating implementation plan
- Before writing significant code
- To check consistency with ARCHITECTURE.md
- To identify duplicate code or unnecessary complexity

## Metadata Management

### tags.json Structure

Keep `tags.json` updated with:

- Project name and location
- Current status (active, completed, archived, paused)
- Technology tags
- Start/completion dates
- Brief description
- Related projects

Update when:

- Creating new project
- Changing project status
- Moving project directories
- Adding new technologies

## Tools and Scripts

### new-project.sh

Creates new project with template files:

```bash
./scripts/new-project.sh <category> <project-name>
```

### archive-project.sh

Moves project to completed or archived:

```bash
./scripts/archive-project.sh <project-name> <destination>
```

### update-project-list.sh

Regenerates project summaries in PROJECTS.md:

```bash
./scripts/update-project-list.sh
```

## Tips and Best Practices

### Documentation
- Write for your future self - you'll forget context
- Document the "why" not just the "what"
- Capture dead ends to avoid repeating mistakes
- Keep docs close to code they describe

### Git Practices
- Commit before trying risky changes
- One logical change per commit
- Write commit messages that explain why
- Push regularly for backup

### Context Management
- Save important details before they scroll away
- Use process-notes proactively, not reactively
- Include file paths in notes for easy navigation
- Link related decisions together

### Project Organization
- Start simple, add structure as needed
- Prefer real organization over metadata
- Keep related things together
- Archive liberally - disk space is cheap

### Learning Projects
- Document learnings as you go
- Compare with previous approaches
- Note resources and references
- Extract reusable patterns

---

**Note**: This workflow is a living document. Update it as practices evolve and new patterns emerge.

**Last Updated**: 2026-01-09
