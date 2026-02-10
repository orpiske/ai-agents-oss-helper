# Find a Task to Contribute

Help users find an issue to contribute to Apache Camel.

## Usage

```
/camel-core-find-task
```

## Instructions

### 1. Understand the User's Experience

Ask the user about their experience level to recommend appropriate issues:

**Questions to ask:**
- Is this your first time contributing to Apache Camel?
- Are you familiar with the Camel codebase?
- Do you have experience with Java and integration patterns?
- Are you looking for something quick or a larger task?

Based on responses, categorize as:
- **Beginner** - First-time contributor, unfamiliar with codebase
- **Intermediate** - Some experience, comfortable with Java
- **Experienced** - Familiar with Camel, looking for meaningful work

### 2. Search for Issues

Use the appropriate search based on experience level.

#### For Beginners: Good First Issues

```bash
curl -s "https://issues.apache.org/jira/rest/api/2/search?jql=project%20%3D%20CAMEL%20AND%20status%20%3D%20Open%20AND%20labels%20%3D%20good-first-issue&maxResults=10" | jq '.issues[] | {key: .key, summary: .fields.summary, priority: .fields.priority.name, components: [.fields.components[].name]}'
```

#### For Intermediate: Easy Issues

```bash
curl -s "https://issues.apache.org/jira/rest/api/2/filter/12352792" | jq -r '.searchUrl' | xargs -I {} curl -s "{}&maxResults=10" | jq '.issues[] | {key: .key, summary: .fields.summary, priority: .fields.priority.name, components: [.fields.components[].name]}'
```

Or use the filter's JQL directly if known.

#### For Experienced: Help Wanted

```bash
curl -s "https://issues.apache.org/jira/rest/api/2/search?jql=project%20%3D%20CAMEL%20AND%20status%20%3D%20Open%20AND%20labels%20%3D%20help-wanted&maxResults=10" | jq '.issues[] | {key: .key, summary: .fields.summary, priority: .fields.priority.name, components: [.fields.components[].name]}'
```

### 3. Rate Limiting

**Be a good net citizen:**
- Make only ONE search request per interaction
- Do NOT poll or refresh repeatedly
- Cache results within the conversation

### 4. Present Results

For each issue found, present:
- **Issue ID** (e.g., CAMEL-20410)
- **Summary** - Brief description
- **Priority** - Helps gauge urgency
- **Components** - Affected areas of the codebase

Format as a numbered list for easy selection.

Example:
```
1. CAMEL-20410 - Fix NPE in HTTP component (Priority: Major, Components: camel-http)
2. CAMEL-22326 - Add retry support to FTP (Priority: Minor, Components: camel-ftp)
```

### 5. Help User Choose

After presenting options:
- Ask which issue interests them
- Provide a brief explanation of what the issue involves
- Mention any prerequisites or skills needed

### 6. Next Steps

Once the user selects an issue, instruct them:

```
To work on this issue, use:

/camel-core-fix-jira-issue <ISSUE_ID>

For example:
/camel-core-fix-jira-issue CAMEL-20410
```

### 7. Constraints

You MUST:
- Ask about experience before searching
- Make only ONE API request to find issues
- Present results clearly with issue IDs
- Direct users to `/camel-core-fix-jira-issue` for implementation

You MUST NOT:
- Make multiple API requests
- Modify any Jira issues
- Start implementing without user confirmation
- Overwhelm users with too many options (limit to 10)

### 8. Quick Reference

| Experience | Label/Filter | Best For |
|------------|--------------|----------|
| Beginner | `good-first-issue` | First-time contributors |
| Intermediate | Filter 12352792 (easy) | Some Java experience |
| Experienced | `help-wanted` | Familiar with Camel |
