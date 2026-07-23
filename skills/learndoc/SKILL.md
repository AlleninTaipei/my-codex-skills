---
name: learndoc
description: Create or refresh a detailed Traditional Chinese LEARN.md that teaches the current software project in approachable, engaging language. Use when the user invokes $learndoc or asks for an educational project walkthrough covering architecture, repository structure, technical decisions, lessons, mistakes, fixes, pitfalls, engineering practices, and verification.
---

# Learndoc

Inspect the current project and write `LEARN.md` at its root.

## Workflow

1. Confirm the current directory is a project. Inspect its repository guidance, structure, manifests, key entry points, tests, configuration, and relevant history or existing documentation.
2. Explain the architecture, how the major parts connect, the technologies used, and the reasons behind observable technical decisions. Clearly label inferences when the repository does not establish the rationale.
3. Include lessons from errors and fixes that are evidenced by the repository or history. Also identify likely future pitfalls and practical ways to avoid them.
4. Teach the thinking patterns, workflow, and best practices an excellent engineer can learn from the project.
5. Write in Traditional Chinese with plain, engaging language. Use useful analogies and anecdotes where they improve understanding, without inventing project facts.
6. Make the document detailed enough to serve as a guided tour, while keeping its structure navigable.
7. Write or update `LEARN.md`. Preserve valuable existing material when refreshing it.
8. Verify that file paths, commands, and technical claims match the repository.

## Required header

Place this block immediately after the document title:

```markdown
## 文件產生資訊

本文件由 Codex 的 learndoc skill 產生.
使用模型: {實際生成當下所使用的模型名稱}.
產生日期: {實際生成當下的日期}.
```

Replace both placeholders with actual values. If the exact model name is unavailable, state `Codex, 目前介面未提供確切模型名稱`, rather than guessing.
