# Project Templates

Starter templates for creating new projects with consistent structure and documentation.

## Available Templates

### README-template.md
Comprehensive README template with sections for:
- Overview and features
- Installation and configuration
- Usage examples
- Development setup
- API documentation
- Troubleshooting

**Usage**: Copy to your project as `README.md` and fill in the sections.

### ARCHITECTURE-template.md
Technical design documentation template covering:
- System architecture and components
- Data models and database schema
- API design and conventions
- Infrastructure and deployment
- Design patterns and conventions
- Security and performance
- Testing strategy

**Usage**: Copy to your project as `ARCHITECTURE.md` and document design decisions.

### gitignore-template
Basic .gitignore with common patterns for:
- OS files
- Editor/IDE files
- Environment variables and secrets
- Dependencies
- Build outputs
- Logs

**Usage**: Copy to your project as `.gitignore` and customize for your tech stack.

## Using Templates

### Manual Copy
```bash
cp templates/README-template.md active/my-project/README.md
cp templates/ARCHITECTURE-template.md active/my-project/ARCHITECTURE.md
cp templates/gitignore-template active/my-project/.gitignore
```

### Using new-project.sh Script
```bash
./scripts/new-project.sh active my-project
```

This automatically:
- Creates project directory
- Copies all templates
- Initializes git (optional)
- Adds entry to PROJECTS.md

## Customizing Templates

These templates are starting points. Customize them based on:
- Project type (web app, CLI tool, library, etc.)
- Technology stack
- Team conventions
- Documentation requirements

Feel free to:
- Add sections relevant to your domain
- Remove sections that don't apply
- Create specialized templates for different project types

## Creating New Templates

To add a new template:
1. Create the template file in this directory
2. Use placeholders: `[Project Name]`, `[description]`, etc.
3. Add comments explaining each section
4. Update this README with template description
5. Update `new-project.sh` script if needed

---

**Last Updated**: 2026-01-09
