# Knowledge note signal review rubric

Use this rubric after reading the target note and the minimum repository context needed to judge novelty.

## Hard gates

A note is normally eligible for `keep` when at least one condition holds:

- The speaker or author designed, operated, maintained, or was accountable for the system discussed.
- The content contains inspectable implementation details, architecture, code, data, incidents, traces, evaluations, or reproducible procedures.
- It is an authoritative specification or first-party explanation of product behavior.
- It is accurate foundational teaching that fills a clearly identified knowledge gap.

Strong signals for `skip-for-now` are:

- It merely retells another article, announcement, or source without adding evidence.
- It consists mainly of abstract claims, trends, or predictions.
- It promises practice but provides no concrete system, case, number, procedure, or tradeoff.
- The source identity or basis cannot be established.
- It substantially duplicates a stronger existing note without adding evidence, a useful counterexample, or a distinct operational perspective.

Do not use a hard gate mechanically. A note may be `skim` when it is a clear and accurate introduction despite lacking production evidence.

## Source classes

Classify the source before scoring:

| Class | Description | Typical weight |
| --- | --- | --- |
| First-party design | The team explains a system or product it built | High for internal behavior, lower for superiority claims |
| Production owner | A person accountable for operating the system shares results, failures, or tradeoffs | High |
| Direct practitioner | A third party presents implementation evidence or reproducible work | Medium to high |
| Foundational educator | Structured and technically accurate teaching | Medium, depending on knowledge gap |
| Commentary or digest | KOL opinion, news recap, or derivative summary | Low unless it adds verifiable analysis |

Accountability is a useful proxy, not proof. Ask whether errors in the described system would create professional, operational, financial, or reputational consequences for the speaker.

## Scoring aid

Score each dimension from 0 to 2. The score supports reasoning but does not override the hard gates or novelty check.

| Dimension | 0 | 1 | 2 |
| --- | --- | --- | --- |
| First-hand proximity | Retelling | Indirect participation | Designer, operator, or accountable owner |
| Accountability | No visible consequence | Professional reputation | Direct responsibility for outcomes |
| Specificity | Abstract claims | Examples | Architecture, workflow, code, or concrete system |
| Evidence | None | Anecdote | Metrics, trace, evaluation, incident, or reproducible result |
| Failure information | Success only | Mentions limitations | Explains failure, cause, correction, and residual risk |
| Tradeoffs | Declares a best answer | Compares choices | States costs, sacrificed properties, and boundaries |
| Actionability | No usable action | General principle | Procedure, checklist, decision rule, or test |
| Net-new value | Duplicates stronger notes | Adds a small angle | Fills a gap or materially improves existing knowledge |

Interpret totals as a starting point:

- 13 to 16: Usually `keep`.
- 9 to 12: Usually `keep` or `skim`, depending on novelty and current goals.
- 6 to 8: Usually `skim` or `skip-for-now`.
- 0 to 5: Usually `skip-for-now`.

For `keep`, normally require either first-hand proximity or evidence to score 2. The foundational-teaching exception applies only when the note fills a real gap and is sufficiently accurate and structured.

## Repository comparison

Judge marginal value, not isolated quality. Identify:

- the existing note with the greatest topical overlap;
- what the candidate adds that the existing note lacks;
- whether the candidate is more authoritative, concrete, current, or actionable;
- whether it supplies a useful contradiction, failure case, or boundary condition;
- whether keeping both improves navigation or only increases repetition.

A good note can still be `skip-for-now` when a stronger note already covers the same material. Conversely, a narrow note may be `keep` when it fills an important gap.

## Recommended handling

Map the decision to a recommendation without applying it automatically:

| Decision | Suggested handling |
| --- | --- |
| `keep` | Retain in the main collection, add to the index, consider a recommendation marker only for exceptional value |
| `skim` | Retain as supporting or foundational material, index without a recommendation marker when discoverability helps |
| `skip-for-now` | Do not add to the main index; leave in a candidate area or propose archival handling |
| `retry-review` | Record the missing input and reassess when it becomes available |

Recommendation markers must remain scarce. Reserve them for notes combining strong source accountability, dense evidence or operational detail, clear actionability, and substantial net-new value.

## Review response template

Use the smallest structure that remains clear:

```markdown
# Review decision

- Decision: keep | skim | skip-for-now | retry-review
- Confidence: high | medium | low
- Source class: ...
- Net-new value: high | medium | low

## Why

1. ...
2. ...

## Evidence and limitations

- Strongest evidence: ...
- Important gap: ...
- Reviewer inference: ...

## Recommended handling

...
```

Do not create this as a separate file unless the user requests a durable review artifact.
