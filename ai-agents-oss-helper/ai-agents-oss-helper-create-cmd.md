# Create New Command

Create a new command file for the AI Agents OSS Helper project.

## Usage

```
/ai-agents-oss-helper-create-cmd <name> <description>
```

**Arguments:**
- `<name>` - Command name (e.g., `project-foo-fix-issues`)
- `<description>` - What the command does and relevant details (project URL, issue tracker, etc.)

**Examples:**
```
/ai-agents-oss-helper-create-cmd project-foo-fix-issues "fixes issues on project foo, found at https://github.com/org/foo/issues"

/ai-agents-oss-helper-create-cmd myproject-find-task "helps find tasks to contribute to MyProject, issues at https://issues.example.com"
```

## Instructions

### 1. Parse Input

Extract from arguments:
- **Command name** - First word (e.g., `project-foo-fix-issues`)
- **Description** - Everything after the name

### 2. Determine Project Directory

Based on the command name prefix:
- Extract project name from command (e.g., `project-foo` from `project-foo-fix-issues`)
- Create directory if it doesn't exist: `<project-name>/`

### 3. Analyze Description

From the description, identify:
- **Purpose** - What the command does (fix issues, find tasks, etc.)
- **Issue tracker** - GitHub, Jira, GitLab, etc.
- **Project URL** - Where to find issues/tasks
- **Special requirements** - Any mentioned workflows or constraints

### 4. Create Command File

Create the file at: `<project-name>/<command-name>.md`

Use this template structure:

```markdown
# <Title>

<Brief description of what the command does>

## Usage

\`\`\`
/<command-name> <arguments>
\`\`\`

**Arguments:**
- `<arg>` - Description

## Instructions

### 1. <First Step>

<Instructions for this step>

### 2. <Second Step>

<Instructions for this step>

### N. Workflow

1. **Branch**: Create from main
   \`\`\`bash
   git checkout main && git pull && git checkout -b ci-issue-<ID>
   \`\`\`

2. **Implement**: Make necessary changes

3. **Test**: Run tests
   \`\`\`bash
   <test command>
   \`\`\`

4. **Commit**: Use descriptive message
   \`\`\`bash
   git commit -m "<prefix>: <description>"
   \`\`\`

5. **Push**: Push branch to origin

### Constraints

You MUST:
- <constraint 1>
- <constraint 2>

You MUST NOT:
- <constraint 1>
- <constraint 2>

### Acceptance Criteria

- All tests must pass
- <criteria 2>
```

### 5. Adapt Based on Command Type

#### For "fix-issue" commands:
- Include issue retrieval (API call to issue tracker)
- Include issue parsing (ID or URL input)
- Include implementation workflow

#### For "find-task" commands:
- Include experience-level questions
- Include search by labels/filters
- Direct to corresponding fix-issue command

#### For other commands:
- Analyze the description to determine appropriate structure
- Follow patterns from existing commands

### 6. Update Project Files

After creating the command file:

1. **Update install.sh** - Add the new file to `COMMAND_FILES` array:
   ```bash
   # Add to COMMAND_FILES array
   "<project-name>/<command-name>.md"
   ```

2. **Update README.md** - Add to appropriate section or create new project section:
   - Add to commands table
   - Add usage example
   - Update project structure

### 7. Constraints

You MUST:
- Follow existing command structure patterns
- Include all standard sections (Usage, Instructions, Workflow, Constraints, Acceptance Criteria)
- Update install.sh and README.md
- Use consistent formatting

You MUST NOT:
- Create commands that modify external systems without user consent
- Skip updating install.sh and README.md
- Create duplicate commands

### 8. Reference Commands

Use these existing commands as templates:

| Type | Reference |
|------|-----------|
| Fix GitHub issues | `wanaku/wanaku-fix-issue.md` |
| Fix Jira issues | `camel-core/camel-core-fix-jira-issue.md` |
| Find tasks | `wanaku/wanaku-find-task.md` or `camel-core/camel-core-find-task.md` |
| Fix SonarCloud | `camel-core/camel-fix-sonarcloud.md` |

### 9. Output

After creating the command, confirm:
- File path created
- Changes made to install.sh
- Changes made to README.md
- How to use the new command
