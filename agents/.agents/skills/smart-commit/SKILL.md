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

Confirm the change scope, write an appropriate commit message, and execute the
commit when the user explicitly requests it.

> **CRITICAL — never commit on your own initiative.** A commit must only happen
> when the user explicitly requests it. Do not auto-commit because the work
> appears complete, because the user thanked you, or because you think it should
> be saved.

## Trigger Recognition

Only execute a commit when the user explicitly asks for it. A single user
instruction must result in at most one commit. Do not split one request into
multiple automatic commits across multiple turns.

Treat the following as explicit commit requests:
- 提交 / commit / 保存 / save / push
- "提交一下" / "保存改动" / "commit changes"
- "选择合适的 commit msg 并提交"
- Any request to commit, stage, or push without explicit message instructions

**Do NOT commit when:**
- The user only asked to build, lint, test, or preview changes
- The user said "ok", "good", "thanks", or similar acknowledgments after a build/test
- The conversation naturally paused after a successful operation with no explicit commit request
- You are unsure whether the user wants to commit
- The user has not explicitly asked for a commit in the current turn
- You feel the changes "should be committed" — that is not a valid reason

When in doubt, ask for confirmation instead of guessing.

## Commit Lock Guard

To mitigate a permission bypass that can occur in yolo mode, this skill uses a
workspace lock file as a guard against accidental automatic commits.

**Lock file name:** `.AI-NEVER-COMMIT-ANY-CHANGES-UNLESS-USER-REMOVES-THIS-FILE`

The rest of this document refers to this file as "the lock file".

> **CRITICAL — the lock file must always be handled by the user.**
> You never remove it or proceed past it on user authorization. Your only
> allowed actions are: (1) check whether it exists, (2) tell the user to remove
> it manually, and (3) recreate it after a commit you were explicitly asked to
> perform.

Behavior:

- If the lock file exists in the repository root, **do not commit**. Tell the
  user the workspace is locked and instruct them to remove the lock file
  manually before proceeding. **You never remove the lock file**, even if the
  user explicitly asks or authorizes you to do so.
- After every successful commit triggered by this skill, recreate the lock file
  in the repository root so the next automatic commit attempt is blocked. Do
  this regardless of whether the working tree still contains other unrelated
  changes.
- Do not add the lock file to `.gitignore`; it must remain untracked so it does
  not get committed itself.

## Turn-Scoped Commit Permission

Permission to commit while the lock file is absent is single-use and expires at
the end of the turn. A request such as "commit now" in a previous turn does not
grant standing permission to commit in the current or any future turn.

**ATTENTION — apply these checks on every commit request:**

- At the start of every new conversation/session, assume the lock file should
  exist. If it is missing and the user has not explicitly asked you to skip
  creating it in the current turn, recreate it immediately.
- **You never remove the lock file.** Even if the user explicitly asks or
  authorizes you to remove it in the current turn, refuse and tell them to
  remove it manually.
- Never infer trust or standing permission from previous turns.
- **Never infer the lock file's existence from memory.** When the user requests
  a commit, always check the actual filesystem state (for example, `test -f` or
  `ls`) rather than relying on what you remember from earlier in the
  conversation.

## Step 1: Confirm Change Scope

Before writing the commit message, understand what changed:

1. Run `git status` to see modified, untracked, and staged files.
2. Run `git diff --stat` to see the magnitude of changes per file.
3. If the change scope is unclear from filenames alone, run `git diff` on the
   relevant files to understand the actual changes.
4. If changes span multiple unrelated concerns (for example, a frontend UI
   refactor plus a backend API change), ask the user whether to split into
   multiple commits.

### Scope Guidelines for This Project

| Scope | Description |
|-------|-------------|
| `frontend` | User interface and client-side code |
| `backend` | Server-side application logic and services |
| `api` | API contracts, protocol definitions, and interfaces |
| `db` | Database models, migrations, schema, and data access |
| `build` | Build system, packaging, CI/CD, and dependencies |
| `test` | Tests, test infrastructure, and fixtures |
| `docs` | Documentation, README, guides, and project metadata |
| `scripts` | Utility scripts and automation tooling |

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

- Use imperative mood (for example, "add", "fix", "move", not "added" or "fixes")
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

1. **Check the filesystem for the lock file** in the repository root. Do not
   rely on memory or assumptions from earlier turns. If the lock file exists,
   stop and tell the user: "Workspace is locked by
   `.AI-NEVER-COMMIT-ANY-CHANGES-UNLESS-USER-REMOVES-THIS-FILE`; remove it
   yourself before committing." Do not proceed, and **do not remove the lock
   file yourself**, even if the user asks or authorizes you to do so.
2. A single user instruction must result in exactly one commit. Do not create
   multiple commits from one request, and do not auto-commit later in the
   conversation unless the user asks again.
3. Stage only the files related to the commit scope. Use `git add <paths>`
   instead of `git add .` unless the user explicitly asks for an all-files commit.
4. Run `git commit -m "<message>"`.
5. If the commit succeeds, report the commit hash and message.
6. If there are unstaged changes left, mention them briefly.
7. After every successful commit, run
   `touch .AI-NEVER-COMMIT-ANY-CHANGES-UNLESS-USER-REMOVES-THIS-FILE` to restore
   the guard. Also recreate the lock file at the start of any new session if it
   is missing, unless the user has explicitly asked in that session to skip
   creating it. Do this regardless of whether the working tree still contains
   other unrelated changes.
8. **Never run `git push`** unless the user explicitly asks for it. Do not push
   as a side effect of a commit request. Pushing removes the chance to correct
   or amend the commit locally before sharing it.
