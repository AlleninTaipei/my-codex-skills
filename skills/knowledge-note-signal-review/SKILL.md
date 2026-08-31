---
name: knowledge-note-signal-review
description: Review an existing knowledge note after ingestion and recommend whether to keep it, skim it, skip it for now, or retry the review. Use when managing a knowledge base's signal-to-noise ratio based on source accountability, evidence, actionability, and novelty. Do not use to summarize the original source or silently delete, move, or rewrite notes.
---

# Knowledge Note Signal Review

Evaluate the value of an already-created knowledge note without redoing its source conversion. The decision concerns whether the note deserves the user's attention and a place in the main knowledge base now, not whether the source has permanent or universal worth.

## Inputs

Read the target Markdown note completely. When a repository or knowledge-base directory is in scope, also inspect its index and only the existing notes needed to assess overlap and missing coverage. Do not browse the original source unless the user requests verification or the note lacks enough source metadata for a reliable review.

Read [references/review-rubric.md](references/review-rubric.md) before evaluating a note.

## Decision boundaries

Keep source quality and note quality separate. A faithful note can still have low acquisition value. An official source can be authoritative about its own implementation while remaining promotional about superiority or market predictions.

Use one of four decisions:

- `keep`: Add meaningful, trustworthy knowledge to the main collection.
- `skim`: Useful foundation or reference material, but not worth deep attention.
- `skip-for-now`: Low current marginal value because it is abstract, derivative, weakly evidenced, or redundant.
- `retry-review`: Missing source identity, content basis, repository context, or another input prevents a reliable judgment.

Do not collapse the decision into a numerical score. Apply the rubric's hard gates first, use scores to make reasoning consistent, and then exercise judgment about the user's current knowledge base and goals.

## Output

Lead with the decision, confidence, and a concise explanation. Include:

- source type and accountability;
- strongest evidence present;
- missing evidence or important limitations;
- actionability;
- overlap and net-new value relative to the knowledge base;
- recommended handling, including whether it merits an index entry or recommendation marker.

Make source-derived observations distinguishable from reviewer inference. Cite the target note with local file links when available. Keep the explanation proportional to the decision; do not produce a second summary of the entire source.

## Mutation constraints

Review is read-only by default. Do not delete, archive, move, rewrite, index, star, commit, or push a note unless the user separately authorizes that action. When authorized to apply the recommendation, preserve unrelated changes and report exactly what changed.
