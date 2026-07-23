---
name: md2course
description: Convert a Markdown notes or documentation file into a polished, responsive, self-contained interactive HTML learning course with inline CSS and JavaScript, light and dark themes, visual teaching components, and no external resources. Use when the user invokes $md2course or asks to turn a .md file into an interactive single-page course.
---

# Markdown to Interactive Course

Convert the Markdown file supplied by the user into an HTML file beside it, using the same basename.

Before generating anything, read [references/course-spec.md](references/course-spec.md) completely. Follow its document shell, component vocabulary, syntax highlighting, interaction patterns, and quality rules.

## Workflow

1. Require one existing Markdown input path. Stop with a clear error if it is missing or invalid.
2. Analyze its title, H2 sections, H3 concepts, code, comparisons, sequences, parameters, and scope distinctions.
3. Choose at least one fitting visual or interactive component for every H2 section.
4. Produce one self-contained HTML file with inline CSS and a single JavaScript block. Do not load external assets or libraries.
5. Keep the source language unless the user requests another language.
6. Verify the HTML structure, referenced element IDs, JavaScript function names, responsive behavior, and light/dark toggle.
7. Report the output path, section count, component used for each section, and any source content that could not be visualized interactively.
