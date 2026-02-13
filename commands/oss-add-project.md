# Add New Project

Register a new project with the AI Agents OSS Helper by adding its configuration to the rule files.

## Usage

```
/oss-add-project <name> <description>
```

**Arguments:**
- `<name>` - Short project name (e.g., `my-project`)
- `<description>` - What the project is and relevant details (repo URL, issue tracker type, build tool, etc.)

**Examples:**
```
/oss-add-project my-project "Java project at https://github.com/org/my-project, uses Maven, GitHub issues"
/oss-add-project my-jira-project "Java project at https://github.com/apache/my-project, uses Jira at https://issues.apache.org/jira, SonarCloud key: apache_my-project"
```

## Instructions

### 1. Parse Input

Extract from arguments:
- **Project name** - First word
- **Description** - Everything after the name

### 2. Analyze Description

From the description, identify:
- **GitHub repository** (e.g., `org/my-project`)
- **Issue tracker type** (GitHub or Jira)
- **Issue tracker URL** (if Jira)
- **Build tool** (Maven, Gradle, etc.)
- **SonarCloud component key** (if any)
- **Related repositories** (if any)

Ask the user to confirm or provide any missing details.

### 3. Update Rule Files

Add a new section for the project in each of the three rule files:

#### A. `rules/project-info.md`
Add a new H2 section with:
- Remote pattern
- GitHub repo
- Issue tracker type and URL
- Issue ID format
- SonarCloud component key
- Documentation URL
- Related repositories
- Create-issue support

#### B. `rules/project-standards.md`
Add a new H2 section with:
- Build tool
- Build/test/format commands
- Module-specific build rules
- Parallelized Maven flag
- Code style restrictions

#### C. `rules/project-guidelines.md`
Add a new H2 section with:
- Branch naming patterns
- Commit message formats
- PR creation policy
- Find-task labels/JQL
- Scope-too-large redirect

### 4. Update install.sh

If the project introduces new commands or changes, update the install script accordingly.

### 5. Update README.md

Add the new project to the supported projects table in README.md.

### 6. Constraints

You MUST:
- Follow the existing format of each rule file exactly
- Confirm all details with the user before making changes
- Update all three rule files consistently

You MUST NOT:
- Create per-project command files (all commands are generic)
- Modify existing project sections without user consent
- Skip updating any of the three rule files

### 7. Output

After adding the project, confirm:
- Files updated
- How to use the project with existing commands (e.g., `cd my-project && /oss-fix-issue 42`)
