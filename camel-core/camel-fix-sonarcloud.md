# Fix SonarCloud Issues

Fix SonarCloud issues in the Apache Camel codebase.

## Usage

```
/camel-fix-sonarcloud <rule> [options]
```

**Arguments:**
- `<rule>` - SonarCloud rule ID (e.g., `S3776`, `S6126`, `java:S1192`)

**Options (optional, space-separated after rule):**
- `branch=<name>` - Custom branch name (default: `ci-camel-4-sonarcloud-<rule>`)
- `module=<path>` - Limit to specific module (e.g., `components/camel-jms`)
- `limit=<n>` - Max issues to process (default: all)

## Instructions

### 1. Gather Context

#### A. Fetch Open Issues

Retrieve issues from SonarCloud API:

```bash
curl "https://sonarcloud.io/api/issues/search?componentKeys=apache_camel&rules=java%3A<rule>&issueStatuses=OPEN%2CCONFIRMED&ps=100"
```

The response `issues` array contains:
- `component` - Full file path
- `line` / `textRange` - Affected location
- `message` - Description of what's wrong
- `effort` - Estimated fix effort
- `type` - BUG, VULNERABILITY, CODE_SMELL

#### B. Fetch Rule Details

Get the rule description and remediation guidance:

```bash
curl "https://sonarcloud.io/api/rules/show?key=java:<rule>"
```

The response contains:
- `rule.name` - Human-readable rule name
- `rule.htmlDesc` - Full description with examples
- `rule.type` - Issue category

**Use the rule description to understand the expected fix pattern.** The `htmlDesc` typically includes "Noncompliant" and "Compliant" code examples.

### 2. Apply Fixes

For each issue:

1. **Read the affected file** at the reported line(s)
2. **Understand the violation** from the issue `message` and rule description
3. **Apply the fix** following the compliant pattern from the rule
4. **Preserve behavior** - fixes must be semantically equivalent

### 3. Constraints

When fixing issues, you MUST:

- **Limit changes to reported issues** - Do not refactor unrelated code
- **Maintain backwards compatibility** - Do not change public API signatures
- **Preserve existing behavior** - Fixes must be functionally equivalent
- **Respect code style** - Match surrounding code conventions

You MUST NOT:

- Use Records or Lombok (unless already present)
- Add new dependencies
- Modify code outside the flagged lines unless necessary for the fix
- Change method visibility or signatures of public/protected members

### 4. Workflow

1. **Branch**: Create from main
   ```bash
   git checkout main && git checkout -b <branch-name>
   ```

2. **For each affected module**:
   - Apply fixes to all issues in that module
   - Run formatting: `cd <module> && mvn -DskipTests install`
   - Run tests: `mvn verify`
   - **If tests pass**: Commit with message `(chores): fix SonarCloud <rule> in <component>`
   - **If tests fail**: Run `notify-pushover 'SonarCloud fix failed for <module>'`, skip commit, continue to next module

3. **Push**: After all modules processed
   ```bash
   git push -u origin <branch-name>
   ```

### 5. General Guidelines

- Tests MUST pass before committing (`mvn verify`)
- Do NOT reformat files manually - use `mvn -DskipTests install`
- Include auto-formatting changes in commit
- GPG signing not required
- Do NOT parallelize Maven jobs (resource intensive)
- Always run `mvn` in the module directory
- One commit per module

### 6. Acceptance Criteria

- Every affected module MUST pass integration tests (`mvn verify`)
- Fixes must address the specific SonarCloud rule violation
- No regressions in functionality
