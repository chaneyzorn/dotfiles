---
name: read-opensource
description: >
  When you need to read the source code of an open-source project in depth,
  clone it into references/opensources/ and read locally instead of relying on
  web snippets or fetched pages.
---

# Read Open-Source Code Locally

When a task requires understanding the implementation of an open-source project,
prefer cloning the repository locally and reading the code from disk.

## When to use

- Investigating a bug or unexpected behavior in a dependency
- Understanding how a library or framework implements a feature
- Reviewing code paths that online documentation does not cover
- Comparing versions or checking recent changes in upstream code

## Workflow

1. Check whether the project is already cloned under `references/opensources/`.
2. If not, create the directory and clone the repository:
   ```sh
   mkdir -p references/opensources
   git clone --depth 1 <repository-url> references/opensources/<project-name>
   ```
   Use `--depth 1` for a shallow clone when full history is not needed.
3. Read the relevant source files locally.
4. If the cloned code is no longer needed, remove it to save space.

## Notes

- Do not modify code under `references/opensources/`; treat it as read-only.
- Avoid committing third-party code to the main repository.
- Respect the project's license when reading or referencing its code.
