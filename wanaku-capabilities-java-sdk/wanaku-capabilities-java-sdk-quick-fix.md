# Quick Fix for Wanaku Capabilities Java SDK

Apply a quick fix to the Wanaku Capabilities Java SDK codebase without requiring a tracked issue. Intended for small changes such as CI fixes, documentation fixes, dependency upgrades, and other minor improvements.

## Usage

```
/wanaku-capabilities-java-sdk-quick-fix <description>
```

**Arguments:**
- `<description>` - A brief description of the quick fix to apply (e.g., `"upgrade dependency version"`, `"fix typo in README"`)

**Examples:**
```
/wanaku-capabilities-java-sdk-quick-fix upgrade parent BOM version
/wanaku-capabilities-java-sdk-quick-fix fix broken link in README
/wanaku-capabilities-java-sdk-quick-fix update GitHub Actions workflow
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

If the change is too large or complex (e.g., new features, architectural changes, refactoring), stop and suggest creating an issue with `/wanaku-capabilities-java-sdk-create-issue` instead.

### 3. Locate Relevant Files

Based on the description:

1. Search for relevant files in the codebase
2. Understand what needs to change
3. Confirm the change is minimal and low-risk

### 4. Implement the Fix

Apply changes following these principles:

- **Minimal** - Change only what is strictly necessary
- **Safe** - Do not alter existing behavior or APIs
- **Clean** - Keep code readable and consistent with surrounding style
- **Tested** - If the change touches code (not docs/CI), verify tests still pass

### 5. Workflow

1. **Branch**: Create from main with a descriptive name
   ```bash
   git checkout main && git pull && git checkout -b quick-fix/<short-slug>
   ```
   Use a short slug derived from the description (e.g., `quick-fix/upgrade-bom`, `quick-fix/fix-readme-link`).

2. **Implement**: Make the necessary changes

3. **Build & Test**: Run the build to verify nothing is broken
   ```bash
   mvn verify
   ```
   For documentation-only changes, the build step may be skipped if no code was modified.

4. **Commit**: Use a clear, descriptive message
   ```bash
   git add <changed-files>
   git commit -m "chore: <brief description>"
   ```

5. **Push**: Push the branch to origin
   ```bash
   git push -u origin quick-fix/<short-slug>
   ```

6. **Pull Request**: Create a pull request
   ```bash
   gh pr create --title "chore: <brief description>" --body "<short explanation of what was changed and why>"
   ```

### 6. Constraints

You MUST:
- Work on a dedicated branch (never commit to `main`)
- Create a pull request after pushing
- Keep changes small and focused
- Include formatting changes from the build in your commit

You MUST NOT:
- Make large or behavioral changes without an issue
- Refactor unrelated code
- Skip the build for code changes
- Combine multiple unrelated fixes in a single quick fix
- Push directly to `main`

### 7. Acceptance Criteria

- All tests pass (`mvn verify`) for code changes
- Changes are minimal and match the described fix
- A pull request has been created with a clear title and description
- Work is done on a branch, not on `main`
