# Podcast Deep Dive 🎙️

An [OpenClaw](https://github.com/nicepkg/openclaw) skill that produces structured deep-dive reports from podcast episodes.

Give it a podcast link → get a full breakdown with key arguments, golden quotes, blind-spot analysis, and community insights.

## What It Does

1. **Transcribe** — Downloads audio and runs [faster-whisper](https://github.com/SYSTRAN/faster-whisper) locally (小宇宙/xiaoyuzhou links supported out of the box; other platforms via browser extraction)
2. **Extract Comments & Metadata** — Pulls shownotes, time-stamped sections, and top comments from the episode page
3. **Analyze** — Produces a structured report following the template:
   - 📋 Episode info
   - 📝 Section-by-section breakdown (core stance → evidence → verbatim golden quotes)
   - 🌟 Highlights & blind spots
   - 💬 Community insights (fact checks, deeper takes, controversies)
   - 🎯 Summary (emotion vs. information ratio, core contribution, ideal audience)
4. **Deliver** — Outputs the report in chat + saves to `podcast-reviews/`

## Installation

### Option A: SkillHub (recommended)

```
openclaw skills install podcast-deep-dive
```

### Option B: Manual

1. Clone or download this repo
2. Copy the `podcast-deep-dive/` folder to your OpenClaw skills directory:
   - Default: `~/.qclaw/skills/`
   - Or: `~/.openclaw/workspace/skills/`

### Dependencies

- [faster-whisper](https://github.com/SYSTRAN/faster-whisper): `pip install -U faster-whisper`
- [xiaoyuzhou-transcribe](https://github.com/nicepkg/openclaw) skill (bundled with OpenClaw) — for 小宇宙 episode transcription

## Usage

Just send a podcast link to your OpenClaw assistant:

```
帮我分析这期播客：https://www.xiaoyuzhoufm.com/episode/xxxxx
```

The skill auto-triggers and runs the full pipeline.

## Report Template

See [references/report-template.md](references/report-template.md) for the full output structure.

## Supported Platforms

| Platform | Transcription | Comments | Notes |
|----------|--------------|----------|-------|
| 小宇宙 (xiaoyuzhoufm) | ✅ faster-whisper via xiaoyuzhou-transcribe | ✅ via `__NEXT_DATA__` | Best supported |
| Other (generic URL) | ⚠️ Browser extraction or local whisper | ⚠️ Browser scraping | May require manual steps |

## License

MIT
