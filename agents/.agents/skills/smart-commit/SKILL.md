---
name: smart-commit
description: >
  Automated git commit workflow for this project. Use when the user says brief
  commit triggers like '提交', 'commit', 'save changes', '保存一下', 'push',
  or any variation asking to commit current work. Also triggers when the user
  asks to stage, commit, or push code changes without explicit instructions on
  commit message or scope.
---

# Smart Commit Workflow

Handle git commit requests automatically by confirming the change scope,
selecting an appropriate commit message, and executing the commit.

## Trigger Recognition

Only treat the following as a commit request:
- 提交 / commit / 保存 / save / push
- "提交一下" / "保存改动" / "commit changes"
- "选择合适的 commit msg 并提交"
- Any request to commit, stage, or push without explicit message instructions

**Do NOT commit when:**
- The user only asked to build, lint, test, or preview changes
- The user said "ok", "good", "thanks", or similar acknowledgments after a build/test
- The conversation naturally paused after a successful operation with no explicit commit request
- You are unsure whether the user wants to commit

When in doubt, ask for confirmation instead of guessing.

## Step 1: Confirm Change Scope

Before writing the commit message, understand what changed:

1. Run `git status` to see modified, untracked, and staged files.
2. Run `git diff --stat` to see the magnitude of changes per file.
3. If the change scope is unclear from filenames alone, run `git diff` on the
   relevant files to understand the actual changes.
4. If changes span multiple unrelated concerns (e.g., frontend UI refactor +
   backend API change), ask the user whether to split into multiple commits.

### Scope Guidelines for This Project

| Scope | Description |
|-------|-------------|
| `frontend` | Vue/TypeScript changes in `web/timecrack-web/` |
| `backend` | Go changes in `internal/`, `cmd/`, `gen/` |
| `api` | Protobuf definitions in `proto/` |
| `db` | Database models, migrations, DAL changes |
| `build` | `Makefile`, `Dockerfile`, build scripts |
| `test` | Test files and testing infrastructure |
| `docs` | `README.md`, `AGENTS.md`, documentation |
| `scripts` | Python scripts in `scripts/` |

Use the most specific scope. If multiple scopes are equally relevant, choose
`frontend` or `backend` based on where most changes live. For cross-cutting
changes, use a single scope or omit it.

## Step 2: Write Commit Message

Follow Conventional Commits format:

```
type(scope): subject
```

### Types

| Type | Use when |
|------|----------|
| `feat` | Adding a new feature or capability |
| `fix` | Fixing a bug |
| `refactor` | Restructuring code without behavior change |
| `style` | Formatting, whitespace, semicolons (no logic change) |
| `docs` | Documentation-only changes |
| `test` | Adding or updating tests |
| `build` | Build system, dependencies, tooling |
| `chore` | Routine maintenance, config updates |

### Subject Rules

- Use imperative mood (e.g., "add", "fix", "move", not "added" or "fixes")
- Start with a lowercase letter
- No trailing period
- Keep under 72 characters when possible
- Describe WHAT changed, not HOW

### Examples

```
feat(frontend): add target mind map panel to hub view
refactor(backend): extract session validation into middleware
fix(frontend): prevent timeline header wrapping on 30d mode
docs: update API endpoint list in AGENTS.md
```

If the user previously provided a specific commit message or style preference
in the conversation, honor that over these defaults.

## Step 3: Execute Commit

1. Stage only the files related to the commit scope. Use `git add <paths>`
   instead of `git add .` unless the user explicitly asks for an all-files commit.
2. Run `git commit -m "<message>"`.
3. If the commit succeeds, report the commit hash and message.
4. If there are unstaged changes left, mention them briefly.
5. Never run `git push` unless the user explicitly asks for it.
