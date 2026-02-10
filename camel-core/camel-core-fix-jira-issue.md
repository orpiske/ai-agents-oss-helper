# Fix Jira Issue

Fix an issue from the Apache Camel Jira tracker.

## Usage

```
/camel-core-fix-jira-issue <issue>
```

**Arguments:**
- `<issue>` - Jira issue ID (e.g., `CAMEL-20410`) or full URL (e.g., `https://issues.apache.org/jira/browse/CAMEL-20410`)

## Instructions

### 1. Parse Input

Extract the issue ID from the argument:
- If full URL: extract ID from path (e.g., `CAMEL-20410` from `https://issues.apache.org/jira/browse/CAMEL-20410`)
- If ID only: use as-is

### 2. Retrieve Issue Details

Fetch issue information from ASF Jira REST API:

```bash
curl -s "https://issues.apache.org/jira/rest/api/2/issue/<ISSUE_ID>" | jq '{
  key: .key,
  summary: .fields.summary,
  description: .fields.description,
  status: .fields.status.name,
  priority: .fields.priority.name,
  type: .fields.issuetype.name,
  components: [.fields.components[].name],
  labels: .fields.labels,
  fixVersions: [.fields.fixVersions[].name],
  created: .fields.created,
  updated: .fields.updated
}'
```

**Rate Limiting:** This is a public instance. Make ONE request only. Do NOT poll or make repeated requests.

### 3. Analyze the Issue

From the retrieved information:

1. **Understand the problem** - Read the summary and description carefully
2. **Identify affected components** - Check the `components` field
3. **Check priority** - Higher priority issues may need more careful handling
4. **Review any linked PRs or patches** - May be mentioned in description

### 4. Locate Relevant Code

Based on the issue description and components:

1. Search for relevant files in the codebase
2. Understand the existing implementation
3. Identify the root cause of the issue

### 5. Implement the Fix

Apply the necessary changes following these principles:

- **Minimal changes** - Fix only what's needed for this issue
- **Preserve behavior** - Don't introduce unrelated changes
- **Add tests** - New functionality or bug fixes should have test coverage
- **Update docs** - If behavior changes, update relevant documentation

### 6. Constraints

You MUST:
- Limit changes to what's necessary for the fix
- Maintain backwards compatibility for public APIs
- Follow existing code style and patterns
- Include tests for the fix

You MUST NOT:
- Modify the Jira issue (read-only access)
- Make multiple API requests to Jira
- Refactor unrelated code
- Change public method signatures without justification

### 7. Workflow

1. **Branch**: Create from main
   ```bash
   git checkout main && git checkout -b ci-issue-<ISSUE_ID>
   ```

2. **Implement**: Make necessary code changes

3. **Format**: Run auto-formatting
   ```bash
   cd <module> && mvn -DskipTests install
   ```

4. **Test**: Verify changes
   ```bash
   mvn verify
   ```

5. **Commit**: Use the issue ID in the message
   ```bash
   git commit -m "<ISSUE_ID>: <brief description of fix>"
   ```

6. **Push**: Push branch to origin
   ```bash
   git push -u origin ci-issue-<ISSUE_ID>
   ```

### 8. General Guidelines

- Tests MUST pass before committing (`mvn verify`)
- Do NOT reformat files manually - use `mvn -DskipTests install`
- Include auto-formatting changes in commit
- GPG signing not required
- Do NOT parallelize Maven jobs (resource intensive)
- Always run `mvn` in the module directory where changes occurred
- Branch must be created from `main`

### 9. Acceptance Criteria

- All affected modules MUST pass integration tests (`mvn verify`)
- Fix must address the issue described in Jira
- No regressions in functionality
- Tests added for the fix where applicable
