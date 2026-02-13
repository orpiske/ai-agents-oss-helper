# Quick Fix for Apache Camel

Apply a quick fix to the Apache Camel codebase without requiring a tracked issue. Intended for small changes such as CI fixes, documentation fixes, dependency upgrades, and other minor improvements.

## Usage

```
/camel-core-quick-fix <description>
```

**Arguments:**
- `<description>` - A brief description of the quick fix to apply (e.g., `"fix typo in camel-jms docs"`, `"update test dependency version"`)

**Examples:**
```
/camel-core-quick-fix fix typo in camel-jms component documentation
/camel-core-quick-fix update Maven plugin version in parent POM
/camel-core-quick-fix fix broken link in CONTRIBUTING.md
```

## Instructions

### 1. Parse Input

Extract the description from the argument. This describes the quick fix to apply.

### 2. Validate Scope

Before proceeding, verify the change qualifies as a quick fix. Acceptable changes include:

- **CI/CD fixes** - GitHub Actions workflows, build scripts
- **Documentation fixes** - Typos, broken links, outdated instructions
- **Dependency upgrades** - Version bumps in `pom.xml` or other build files
- **Minor code fixes** - Trivial corrections that don't alter behavior
- **Configuration changes** - Small updates to project configuration

If the change is too large or complex (e.g., new features, architectural changes, refactoring), stop and suggest creating a Jira issue instead.

### 3. Locate Relevant Files

Based on the description:

1. Search for relevant files in the codebase
2. Understand what needs to change
3. Confirm the change is minimal and low-risk

### 4. Implement the Fix

Apply changes following these principles:

- **Minimal** - Change only what is strictly necessary
- **Safe** - Do not alter existing behavior or public APIs
- **Clean** - Keep code readable and consistent with surrounding style
- **Tested** - If the change touches code (not docs/CI), verify tests still pass

### 5. Workflow

1. **Branch**: Create from main with a descriptive name
   ```bash
   git checkout main && git pull && git checkout -b quick-fix/<short-slug>
   ```
   Use a short slug derived from the description (e.g., `quick-fix/fix-jms-docs-typo`, `quick-fix/update-maven-plugin`).

2. **Implement**: Make the necessary changes

3. **Format**: Run auto-formatting in the affected module
   ```bash
   cd <module> && mvn -DskipTests install
   ```

4. **Test**: Verify changes in the affected module
   ```bash
   mvn verify
   ```
   For documentation-only changes, the build step may be skipped if no code was modified.

5. **Commit**: Use a clear, descriptive message
   ```bash
   git add <changed-files>
   git commit -m "chore: <brief description>"
   ```

6. **Push**: Push the branch to origin
   ```bash
   git push -u origin quick-fix/<short-slug>
   ```

7. **Pull Request**: Create a pull request
   ```bash
   gh pr create --title "chore: <brief description>" --body "<short explanation of what was changed and why>"
   ```

### 6. Constraints

You MUST:
- Work on a dedicated branch (never commit to `main`)
- Create a pull request after pushing
- Keep changes small and focused
- Include formatting changes from the build in your commit
- Always run `mvn` in the module directory where changes occurred
- Do NOT parallelize Maven jobs (resource intensive)

You MUST NOT:
- Make large or behavioral changes without a Jira issue
- Refactor unrelated code
- Skip the build for code changes
- Combine multiple unrelated fixes in a single quick fix
- Push directly to `main`
- Change public method signatures

### 7. Acceptance Criteria

- All affected modules pass tests (`mvn verify`) for code changes
- Changes are minimal and match the described fix
- A pull request has been created with a clear title and description
- Work is done on a branch, not on `main`
