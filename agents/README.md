# Agent Skills

This directory stores AI agent skills for the current user. It is managed with
[Vercel Skills](https://skills.sh), a skill package manager for AI coding agents.

## Directory layout

```text
agents/
├── README.md                 # this file
└── .agents/
    ├── .skill-lock.json      # lock file for third-party skills
    └── skills/
        ├── smart-commit/     # user-defined skill
        └── tech-doc-polish/  # user-defined skill
```

- `.agents/skills/` contains skills maintained in this repository.
- `.agents/.skill-lock.json` tracks third-party skills installed via `npx skills`.

## Quick start

### Install a third-party skill

```sh
npx skills add <source> -g -y
```

Examples:

```sh
# Install Lark skills globally
npx skills add larksuite/cli -g -y

# Install from a GitHub repository
npx skills add vercel-labs/agent-skills -g -y
```

`-g` installs to the user directory (`~/.agents/skills/`). Omit `-g` to install
into the current project (`./.agents/skills/`).

### Update installed skills

```sh
npx skills update -y
```

This reads `.skill-lock.json` and updates all tracked skills.

### List installed skills

```sh
npx skills list
```

### Remove a skill

```sh
npx skills remove <skill-name>
```

## Adding your own skill

Create a directory under `.agents/skills/<skill-name>/` with a `SKILL.md` file:

```sh
mkdir -p .agents/skills/my-skill
cat > .agents/skills/my-skill/SKILL.md <<'EOF'
---
name: my-skill
description: What this skill does and when to use it
---

# My Skill

Instructions for the agent.
EOF
```

Commit the new skill directory to git.

## Syncing skills across machines

1. Clone this repository.
2. Run `npx skills update -y` to restore third-party skills from
   `.skill-lock.json`.
3. Your own skills are already present because they are committed to git.

## Notes

- Do not commit third-party skill files. Only `.skill-lock.json` should be
  tracked for them.
- Keep `.skill-lock.json` in git so all environments share the same skill set.
