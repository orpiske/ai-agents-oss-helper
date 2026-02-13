# Project Guidelines

This rule file contains branching, commit, PR, and task-finding conventions for each project. Commands read this file to determine how to name branches, format commits, and search for tasks.

## Wanaku

- **Fix-issue branch:** `ci-issue-<ISSUE_NUMBER>`
- **Quick-fix branch:** `quick-fix/<short-slug>`
- **SonarCloud branch:** _(not configured)_
- **Commit format (fix-issue):** `Fix #<ISSUE_NUMBER>: <brief description>`
- **Commit format (quick-fix):** `chore: <brief description>`
- **PR creation:** optional for fix-issue, always for quick-fix
- **Find-task source:** GitHub labels
- **Find-task beginner label:** `good first issue`
- **Find-task experienced label:** `help wanted`
- **Find-task intermediate:** _(none)_
- **Scope-too-large redirect:** `/oss-create-issue`

## Wanaku Capabilities Java SDK

- **Fix-issue branch:** `ci-issue-<ISSUE_NUMBER>`
- **Quick-fix branch:** `quick-fix/<short-slug>`
- **SonarCloud branch:** _(not configured)_
- **Commit format (fix-issue):** `Fix #<ISSUE_NUMBER>: <brief description>`
- **Commit format (quick-fix):** `chore: <brief description>`
- **PR creation:** optional for fix-issue, always for quick-fix
- **Find-task source:** GitHub labels
- **Find-task beginner label:** `good first issue`
- **Find-task experienced label:** `help wanted`
- **Find-task intermediate:** _(none)_
- **Scope-too-large redirect:** `/oss-create-issue`

## Camel Integration Capability

- **Fix-issue branch:** `ci-issue-<ISSUE_NUMBER>`
- **Quick-fix branch:** `quick-fix/<short-slug>`
- **SonarCloud branch:** _(not configured)_
- **Commit format (fix-issue):** `Fix #<ISSUE_NUMBER>: <brief description>`
- **Commit format (quick-fix):** `chore: <brief description>`
- **PR creation:** optional for fix-issue, always for quick-fix
- **Find-task source:** GitHub labels
- **Find-task beginner label:** `good first issue`
- **Find-task experienced label:** `help wanted`
- **Find-task intermediate:** _(none)_
- **Scope-too-large redirect:** `/oss-create-issue`

## Apache Camel (camel-core)

- **Fix-issue branch:** `ci-issue-<ISSUE_ID>`
- **Quick-fix branch:** `quick-fix/<short-slug>`
- **SonarCloud branch:** `ci-camel-4-sonarcloud-<rule>` (customizable via `branch=<name>` option)
- **Commit format (fix-issue):** `<ISSUE_ID>: <brief description of fix>`
- **Commit format (quick-fix):** `chore: <brief description>`
- **Commit format (sonarcloud):** `(chores): fix SonarCloud <rule> in <component>`
- **PR creation:** not created automatically for fix-issue, always for quick-fix
- **Find-task source:** Jira
- **Find-task beginner JQL:** `project = CAMEL AND status = Open AND labels = good-first-issue` (maxResults=10)
- **Find-task intermediate:** Filter 12352792 (easy issues)
- **Find-task experienced JQL:** `project = CAMEL AND status = Open AND labels = help-wanted` (maxResults=10)
- **Scope-too-large redirect:** create a Jira issue directly

## AI Agents OSS Helper

- **Fix-issue branch:** `ci-issue-<ISSUE_NUMBER>`
- **Quick-fix branch:** `quick-fix/<short-slug>`
- **SonarCloud branch:** _(not configured)_
- **Commit format (fix-issue):** `Fix #<ISSUE_NUMBER>: <brief description>`
- **Commit format (quick-fix):** `chore: <brief description>`
- **PR creation:** optional for fix-issue, always for quick-fix
- **Find-task source:** GitHub labels
- **Find-task beginner label:** `good first issue`
- **Find-task experienced label:** `help wanted`
- **Find-task intermediate:** _(none)_
- **Scope-too-large redirect:** `/oss-create-issue`
