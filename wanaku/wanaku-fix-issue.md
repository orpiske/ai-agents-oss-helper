# Fix Wanaku Issue

Fix an issue from the Wanaku GitHub repository.

## Usage

```
/wanaku-fix-issue <issue>
```

**Arguments:**
- `<issue>` - GitHub issue number (e.g., `42`) or full URL (e.g., `https://github.com/wanaku-ai/wanaku/issues/42`)

## Instructions

### 1. Parse Input

Extract the issue number from the argument:
- If full URL: extract number from path (e.g., `42` from `https://github.com/wanaku-ai/wanaku/issues/42`)
- If number only: use as-is

### 2. Retrieve Issue Details

Fetch issue information using GitHub CLI:

```bash
gh issue view <ISSUE_NUMBER> --repo wanaku-ai/wanaku --json number,title,body,state,labels,assignees,milestone
```

Or via API:

```bash
curl -s "https://api.github.com/repos/wanaku-ai/wanaku/issues/<ISSUE_NUMBER>" | jq '{
  number: .number,
  title: .title,
  body: .body,
  state: .state,
  labels: [.labels[].name],
  assignee: .assignee.login,
  created_at: .created_at
}'
```

### 3. Analyze the Issue

From the retrieved information:

1. **Understand the problem** - Read the title and body carefully
2. **Check labels** - May indicate type (bug, enhancement, etc.)
3. **Review comments** - May contain additional context or discussion
4. **Check for linked PRs** - Avoid duplicating work

### 4. Locate Relevant Code

Based on the issue description:

1. Search for relevant files in the codebase
2. Understand the existing implementation
3. Identify the root cause or area to modify

### 5. Implement the Fix

Apply changes following these principles:

- **Clean code** - Write clear, readable, self-documenting code
- **Concise** - Avoid over-engineering, keep it simple
- **Maintainable** - Future developers should understand your changes easily
- **Tested** - All changes must have appropriate test coverage
- **Minimal** - Fix only what's needed for this issue

### 6. Constraints

You MUST:
- Limit changes to what's necessary for the fix
- Include tests for the fix
- Keep code clean and maintainable
- Include auto-formatting changes in commits

You MUST NOT:
- Refactor unrelated code
- Add unnecessary complexity
- Skip testing
- Make unrelated changes

### 7. Workflow

1. **Branch**: Create from main
   ```bash
   git checkout main && git pull && git checkout -b ci-issue-<ISSUE_NUMBER>
   ```

2. **Implement**: Make necessary code changes

3. **Build & Test**: Run the build (includes auto-formatting)
   ```bash
   mvn verify
   ```

4. **Commit**: Include formatting changes, use issue number in message
   ```bash
   git add -A
   git commit -m "Fix #<ISSUE_NUMBER>: <brief description>"
   ```

5. **Push**: Push branch to origin
   ```bash
   git push -u origin ci-issue-<ISSUE_NUMBER>
   ```

6. **PR** (optional): Create pull request if requested
   ```bash
   gh pr create --title "Fix #<ISSUE_NUMBER>: <description>" --body "Fixes #<ISSUE_NUMBER>"
   ```

### 8. General Guidelines

- Tests MUST pass before committing (`mvn verify`)
- Build auto-formats code - include these changes in commit
- Do NOT manually format files
- Branch must be created from `main`
- Keep commits focused and atomic

### 9. Acceptance Criteria

- All tests MUST pass (`mvn verify`)
- Fix must address the issue described on GitHub
- No regressions in functionality
- Tests added for the fix
- Code is clean, concise, and maintainable
