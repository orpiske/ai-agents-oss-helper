# Fix Issue

Fix an issue from the current project's issue tracker.

## Usage

```
/oss-fix-issue <issue>
```

**Arguments:**
- `<issue>` - Issue identifier: numeric ID (e.g., `42`), alphanumeric ID (e.g., `CAMEL-20410`), or full URL

## Instructions

### 1. Detect Project

Determine the current project by running:

```bash
git remote get-url origin
```

Match the output against the remote patterns in `project-info.md`:
- `wanaku-ai/wanaku` -> Wanaku
- `wanaku-ai/wanaku-capabilities-java-sdk` -> Wanaku Capabilities Java SDK
- `wanaku-ai/camel-integration-capability` -> Camel Integration Capability
- `apache/camel` -> Apache Camel (camel-core)
- `orpiske/ai-agents-oss-helper` -> AI Agents OSS Helper

If no match is found, stop and tell the user: "This project is not configured. Use `/oss-add-project` to register it."

### 2. Parse Input

Extract the issue ID from the argument based on the project's issue tracker type (from `project-info.md`):

**GitHub projects:**
- If full URL (e.g., `https://github.com/wanaku-ai/wanaku/issues/42`): extract the number from the path
- If number only: use as-is

**Jira projects:**
- If full URL (e.g., `https://issues.apache.org/jira/browse/CAMEL-20410`): extract the ID from the path
- If ID only (e.g., `CAMEL-20410`): use as-is

### 3. Retrieve Issue Details

**GitHub projects** - Fetch via GitHub CLI:

```bash
gh issue view <ISSUE_NUMBER> --repo <GITHUB_REPO> --json number,title,body,state,labels,assignees,milestone
```

**Jira projects** - Fetch via Jira REST API:

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

**Rate Limiting:** For Jira, make ONE request only. Do NOT poll or make repeated requests.

### 4. Analyze the Issue

From the retrieved information:

1. **Understand the problem** - Read the title/summary and body/description carefully
2. **Check labels/components** - May indicate type (bug, enhancement, etc.) or affected areas
3. **Review comments** - May contain additional context or discussion
4. **Check for linked PRs** - Avoid duplicating work

### 5. Locate Relevant Code

Based on the issue description:

1. Search for relevant files in the codebase
2. Understand the existing implementation
3. Identify the root cause or area to modify

### 6. Implement the Fix

Apply changes following these principles:

- **Clean code** - Write clear, readable, self-documenting code
- **Concise** - Avoid over-engineering, keep it simple
- **Maintainable** - Future developers should understand your changes easily
- **Tested** - All changes must have appropriate test coverage
- **Minimal** - Fix only what's needed for this issue

Read `project-standards.md` for project-specific build constraints (e.g., no Records/Lombok for camel-core, module-specific builds, etc.).

### 7. Constraints

You MUST:
- Limit changes to what's necessary for the fix
- Include tests for the fix
- Keep code clean and maintainable
- Include auto-formatting changes in commits
- Follow the code style restrictions from `project-standards.md`

You MUST NOT:
- Refactor unrelated code
- Add unnecessary complexity
- Skip testing
- Make unrelated changes
- For Jira projects: modify the Jira issue or make multiple API requests
- For camel-core: change public method signatures without justification

### 8. Workflow

Read branch naming and commit format from `project-guidelines.md`.

1. **Branch**: Create from main
   ```bash
   git checkout main && git pull && git checkout -b <BRANCH_NAME>
   ```
   Use the branch naming pattern from `project-guidelines.md` (e.g., `ci-issue-<ISSUE_ID>`).

2. **Implement**: Make necessary code changes

3. **Format & Build**: Run the build commands from `project-standards.md`
   - For projects with module-specific builds (camel-core): run formatting in the module directory first, then test
   - For other projects: run `mvn verify` from root

4. **Commit**: Use the commit format from `project-guidelines.md`
   ```bash
   git add -A
   git commit -m "<COMMIT_MESSAGE>"
   ```
   - GitHub projects: `Fix #<ISSUE_NUMBER>: <brief description>`
   - Jira projects: `<ISSUE_ID>: <brief description of fix>`

5. **Push**: Push branch to origin
   ```bash
   git push -u origin <BRANCH_NAME>
   ```

6. **PR** (based on `project-guidelines.md`):
   - If PR creation is specified as "always" or user requests it:
     ```bash
     gh pr create --title "<COMMIT_MESSAGE>" --body "<description>"
     ```

### 9. General Guidelines

- Tests MUST pass before committing
- Build auto-formats code - include these changes in commit
- Do NOT manually format files
- Branch must be created from `main`
- Keep commits focused and atomic
- For camel-core: do NOT parallelize Maven jobs; always run `mvn` in the module directory
- GPG signing not required

### 10. Acceptance Criteria

- All tests MUST pass
- Fix must address the issue described in the tracker
- No regressions in functionality
- Tests added for the fix where applicable
- Code is clean, concise, and maintainable
