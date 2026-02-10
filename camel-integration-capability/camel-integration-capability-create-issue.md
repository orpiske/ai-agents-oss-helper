# Create Camel Integration Capability Issue

Create a new issue in the Camel Integration Capability GitHub repository.

## Usage

```
/camel-integration-capability-create-issue <title>
```

**Arguments:**
- `<title>` - Brief title for the issue (optional - will prompt if not provided)

## Instructions

### 1. Gather Issue Information

If title not provided, ask the user for:
- **Title** - Brief, descriptive title for the issue

Then ask for:
- **Type** - Bug, enhancement, feature request, documentation, etc.
- **Description** - Detailed description of the issue
- **Reproduction steps** (for bugs) - Steps to reproduce the problem
- **Expected behavior** - What should happen
- **Actual behavior** (for bugs) - What currently happens
- **Additional context** - Any other relevant information

### 2. Determine Labels

Based on the issue type, suggest appropriate labels:

| Type | Suggested Labels |
|------|-----------------|
| Bug | `bug` |
| Enhancement | `enhancement` |
| Feature request | `enhancement` |
| Documentation | `documentation` |
| Good first issue | `good first issue` |
| Help wanted | `help wanted` |

Ask the user to confirm or modify labels.

### 3. Format Issue Body

Structure the issue body using this template:

```markdown
## Description

<description>

## Steps to Reproduce (if bug)

1. <step 1>
2. <step 2>
3. <step 3>

## Expected Behavior

<expected>

## Actual Behavior (if bug)

<actual>

## Additional Context

<context>
```

### 4. Confirm with User

Before creating, show the user:
- Title
- Labels
- Full body content

Ask for confirmation to proceed.

### 5. Create the Issue

Use GitHub CLI to create the issue:

```bash
gh issue create --repo wanaku-ai/camel-integration-capability --title "<TITLE>" --label "<LABELS>" --body "$(cat <<'EOF'
<BODY_CONTENT>
EOF
)"
```

### 6. Report Result

After creation, display:
- Issue number
- Issue URL
- Confirmation message

Example output:
```
Issue created successfully!
Issue #123: https://github.com/wanaku-ai/camel-integration-capability/issues/123
```

### 7. Constraints

You MUST:
- Confirm all details with the user before creating
- Use clear, descriptive titles
- Include relevant labels
- Format the body properly with Markdown

You MUST NOT:
- Create issues without user confirmation
- Use vague or unclear titles
- Skip gathering necessary information
- Create duplicate issues without checking

### 8. Acceptance Criteria

- Issue is created in the Camel Integration Capability repository
- Issue has appropriate title and labels
- Issue body is well-formatted and informative
- User is provided with the issue URL
