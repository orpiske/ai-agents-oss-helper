# AI Agents OSS Helper

Custom commands for AI coding agents (Claude, Bob) to help contribute to open source projects.

## Installation

### Quick Install (Both Agents)

```bash
curl -fsSL https://raw.githubusercontent.com/orpiske/ai-agents-oss-helper/main/install.sh | bash
```

### Selective Install

```bash
# Clone the repository
git clone https://github.com/orpiske/ai-agents-oss-helper.git
cd ai-agents-oss-helper

# Install for specific agent
./install.sh claude    # Claude only
./install.sh bob       # Bob only
./install.sh           # Both
```

### Manual Install

Copy command files to your agent's commands directory:

```bash
cp camel-core/*.md ~/.claude/commands/
cp camel-core/*.md ~/.bob/commands/
```

## Available Commands

### Apache Camel

| Command | Description |
|---------|-------------|
| `/camel-core-find-task` | Find an issue to contribute based on experience |
| `/camel-core-fix-jira-issue <issue>` | Fix a Jira issue from ASF tracker |
| `/camel-fix-sonarcloud <rule>` | Fix SonarCloud issues for any rule |

### Wanaku

| Command | Description |
|---------|-------------|
| `/wanaku-find-task` | Find an issue to contribute based on experience |
| `/wanaku-fix-issue <issue>` | Fix a GitHub issue from Wanaku repository |

## Usage Examples

### Fix SonarCloud Issues (Camel)

```bash
# Fix cognitive complexity issues
/camel-fix-sonarcloud S3776

# Fix pattern matching for instanceof
/camel-fix-sonarcloud S6201

# Fix issues in a specific module only
/camel-fix-sonarcloud S3457 module=components/camel-jms

# Limit number of issues to process
/camel-fix-sonarcloud S6126 limit=10
```

### Find a Wanaku Task

```bash
# Interactive - asks about your experience level
/wanaku-find-task
```

The command will:
1. Ask about your experience level
2. Search for issues (good first issue or help wanted)
3. Present a list of options
4. Guide you to use `/wanaku-fix-issue` to implement

### Fix Wanaku Issues

```bash
# Using issue number
/wanaku-fix-issue 42

# Using full URL
/wanaku-fix-issue https://github.com/wanaku-ai/wanaku/issues/42
```

### Find a Task to Contribute

```bash
# Interactive - asks about your experience level
/camel-core-find-task
```

The command will:
1. Ask about your experience level
2. Search for appropriate issues (good-first-issue, easy, help-wanted)
3. Present a list of options
4. Guide you to use `/camel-core-fix-jira-issue` to implement

### Fix Jira Issues

```bash
# Using issue ID
/camel-core-fix-jira-issue CAMEL-20410

# Using full URL
/camel-core-fix-jira-issue https://issues.apache.org/jira/browse/CAMEL-22326
```

## Command Structure

Commands are Markdown files with:
- **Usage** section describing arguments and options
- **Instructions** for the agent to follow
- **Constraints** to ensure safe modifications
- **Workflow** for branching, testing, and committing

## Adding New Commands

1. Create a `.md` file in the appropriate directory (e.g., `camel-core/`)
2. Follow the existing command structure
3. Add the file path to `COMMAND_FILES` array in `install.sh`

## Project Structure

```
ai-agents-oss-helper/
├── install.sh              # Installation script
├── README.md
├── camel-core/             # Apache Camel commands
│   ├── camel-core-find-task.md
│   ├── camel-core-fix-jira-issue.md
│   └── camel-fix-sonarcloud.md
└── wanaku/                 # Wanaku commands
    ├── wanaku-find-task.md
    └── wanaku-fix-issue.md
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Add or modify commands
4. Update `install.sh` if adding new files
5. Submit a pull request

## License

Apache License 2.0

---

[GitHub Repository](https://github.com/orpiske/ai-agents-oss-helper)
