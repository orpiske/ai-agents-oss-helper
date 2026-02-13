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

### 3. Create Rule Files

Create a new subdirectory under `rules/` named after the project (e.g., `rules/my-project/`) and add three rule files:

#### A. `rules/<project>/project-info.md`
Create with:
- H1 heading: `# Project Information`
- Intro paragraph (same as other project-info files)
- Remote pattern
- GitHub repo
- Issue tracker type and URL
- Issue ID format
- SonarCloud component key
- Documentation URL
- Related repositories
- Create-issue support

#### B. `rules/<project>/project-standards.md`
Create with:
- H1 heading: `# Project Standards`
- Intro paragraph (same as other project-standards files)
- Build tool
- Build/test/format commands
- Module-specific build rules
- Parallelized Maven flag
- Code style restrictions

#### C. `rules/<project>/project-guidelines.md`
Create with:
- H1 heading: `# Project Guidelines`
- Intro paragraph (same as other project-guidelines files)
- Branch naming patterns
- Commit message formats
- PR creation policy
- Find-task labels/JQL
- Scope-too-large redirect

Use existing project files (e.g., `rules/wanaku/`) as a template for the format.

### 4. Update install.sh

Add the three new rule file paths to the `RULE_FILES` array in `install.sh`:
```
"rules/<project>/project-info.md"
"rules/<project>/project-standards.md"
"rules/<project>/project-guidelines.md"
```

### 5. Update Command Files

Add the new remote pattern -> project directory mapping to the "Detect Project" section in all command files under `commands/`.

### 6. Update README.md

Add the new project to the supported projects table in README.md.

### 7. Constraints

You MUST:
- Follow the existing format of each rule file exactly (use other project directories as templates)
- Confirm all details with the user before making changes
- Create all three rule files in the new subdirectory
- Update install.sh with the new file paths
- Update the remote pattern mapping in all command files

You MUST NOT:
- Create per-project command files (all commands are generic)
- Modify existing project directories without user consent
- Skip creating any of the three rule files

### 8. Output

After adding the project, confirm:
- Files updated
- How to use the project with existing commands (e.g., `cd my-project && /oss-fix-issue 42`)
