# Find a Task to Contribute

Help users find an issue to contribute to Camel Integration Capability.

## Usage

```
/camel-integration-capability-find-task
```

## Instructions

### 1. Understand the User's Experience

Ask the user about their experience level:

**Questions to ask:**
- Is this your first time contributing to Camel Integration Capability?
- Are you familiar with the codebase?
- Are you looking for something quick or a larger task?

Based on responses, categorize as:
- **Beginner** - First-time contributor, wants something approachable
- **Experienced** - Familiar with the project, ready for more complex work

### 2. Search for Issues

Use the appropriate search based on experience level.

#### For Beginners: Good First Issues

```bash
gh issue list --repo wanaku-ai/camel-integration-capability --label "good first issue" --state open --limit 10 --json number,title,labels
```

Or via API:

```bash
curl -s "https://api.github.com/repos/wanaku-ai/camel-integration-capability/issues?labels=good%20first%20issue&state=open&per_page=10" | jq '.[] | {number: .number, title: .title, labels: [.labels[].name]}'
```

#### For Experienced: Help Wanted

```bash
gh issue list --repo wanaku-ai/camel-integration-capability --label "help wanted" --state open --limit 10 --json number,title,labels
```

Or via API:

```bash
curl -s "https://api.github.com/repos/wanaku-ai/camel-integration-capability/issues?labels=help%20wanted&state=open&per_page=10" | jq '.[] | {number: .number, title: .title, labels: [.labels[].name]}'
```

### 3. Rate Limiting

**Be a good net citizen:**
- Make only ONE search request per interaction
- Do NOT poll or refresh repeatedly
- GitHub API has rate limits - respect them

### 4. Present Results

For each issue found, present:
- **Issue Number** (e.g., #42)
- **Title** - Brief description
- **Labels** - Additional context

Format as a numbered list for easy selection.

Example:
```
1. #42 - Add support for new Camel component (Labels: help wanted, enhancement)
2. #51 - Fix typo in documentation (Labels: good first issue, docs)
3. #67 - Improve error messages (Labels: good first issue)
```

### 5. Help User Choose

After presenting options:
- Ask which issue interests them
- Provide a brief explanation of what the issue involves
- Mention any prerequisites or context needed

### 6. Next Steps

Once the user selects an issue, instruct them:

```
To work on this issue, use:

/camel-integration-capability-fix-issue <ISSUE_NUMBER>

For example:
/camel-integration-capability-fix-issue 42
```

### 7. Constraints

You MUST:
- Ask about experience before searching
- Make only ONE API request to find issues
- Present results clearly with issue numbers
- Direct users to `/camel-integration-capability-fix-issue` for implementation

You MUST NOT:
- Make multiple API requests
- Modify any GitHub issues
- Start implementing without user confirmation
- Overwhelm users with too many options (limit to 10)

### 8. Quick Reference

| Experience | Label | Best For |
|------------|-------|----------|
| Beginner | `good first issue` | First-time contributors |
| Experienced | `help wanted` | Community needs help |
