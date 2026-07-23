---
name: video-to-editable-slides
description: Reconstruct presentation-style videos as structured, editable PowerPoint decks. Use when Codex receives a YouTube URL or local video and needs to extract metadata, captions, chapters, representative frames, slide transitions, visual style, and narration; consolidate incremental animation states; decide what to redraw versus preserve as screenshots; create a 16:9 .pptx; or validate a reconstructed slide deck.
---

# Video to Editable Slides

Rebuild the information structure and visual language of a presentation-style video as an editable deck. Preserve meaning and attribution; do not claim access to the creator's original source file.

## Workflow

1. Confirm the source is authorized and accessible. Treat downloaded media as temporary analysis material.
2. Inspect metadata, captions, chapters, formats, and duration. Run `scripts/inspect_video.py` for a URL.
3. Obtain the video and captions with an available downloader. Prefer the highest practical resolution and preserve timestamps.
4. Extract representative frames and contact sheets with `scripts/extract_frames.py`. Start with 15–30 second sampling; add denser samples around visual changes.
5. Read `references/reconstruction-strategy.md`. Identify slide families, incremental animation states, screenshots, diagrams, code blocks, and speaker-only sections.
6. Produce a slide specification JSON before generating the deck. Keep one completed idea per slide; merge animation fragments that form one final composition.
7. Build the editable `.pptx` with `scripts/build_pptx.py`. Use native text, shapes, connectors, and tables wherever practical.
8. Read `references/quality-checklist.md`. Validate the package with `scripts/validate_pptx.py`, then visually inspect rendered slides when a renderer is available.
9. Deliver the deck with a concise reconstruction note: source, slide count, editable elements, screenshot-based elements, and known limitations.

## Reconstruction Modes

- **Faithful:** Match the source layout, palette, typography, and slide rhythm as closely as practical.
- **Professional remake:** Preserve content and sequence while improving density, hierarchy, consistency, and readability. Use this by default when the user does not specify.
- **Outline only:** Produce slide titles, bullets, and speaker notes without attempting visual reconstruction.

## Required Judgment

- Merge progressive animation states instead of creating many nearly empty slides.
- Separate narration from on-slide copy; slides should not become transcript dumps.
- Rebuild text and simple diagrams as editable objects.
- Use screenshots for complex third-party interfaces, photos, or assets that cannot be recreated faithfully and legally.
- Recreate charts only when values are legible or recoverable; otherwise label them as approximate.
- Preserve source attribution and avoid redistributing copyrighted media beyond what is necessary for the user's reconstruction task.

## Slide Specification

Use the JSON schema documented in `references/reconstruction-strategy.md`. At minimum provide `title`, `subtitle`, `section`, `layout`, and `elements` for every slide. Pass the file to:

```powershell
python scripts/build_pptx.py slide-spec.json output.pptx
```

The generic builder supports title slides, bullet slides, cards, comparison layouts, process flows, quotes, and image placements. Extend the builder only when source-specific visuals materially require it.

## Dependencies and Fallbacks

- Prefer `yt-dlp` for public video metadata, captions, thumbnails, and media.
- Use OpenCV and Pillow for sampling and contact sheets.
- Use `python-pptx` for editable PowerPoint generation.
- If a required dependency is missing, request permission to install it. If the source cannot be downloaded, ask the user to attach the video and caption files.
- If ffmpeg is unavailable, use a video-only stream for frame analysis; audio is unnecessary when captions are present.

## Validation

Run:

```powershell
python scripts/validate_pptx.py output.pptx
```

Treat package integrity and slide dimensions as minimum checks. Prefer visual rendering for final QA; package validation cannot detect poor line breaks, clipping, or collisions.
