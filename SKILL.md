---
name: podcast-deep-dive
description: "Deep-dive analysis of podcast episodes: transcribe audio, extract community comments, and produce a structured review report. Use when user provides a podcast link (especially xiaoyuzhoufm/小宇宙) and wants a comprehensive breakdown. Covers: transcription → comment extraction → structured analysis with key arguments, golden quotes, blind spots, and community insights."
---

# Podcast Deep Dive

Produce a structured deep-dive report from a podcast episode link.

## Workflow

### Step 1: Transcribe

**小宇宙 (xiaoyuzhoufm) links:**
- Use `xiaoyuzhou-transcribe` skill: `python3 scripts/xiaoyuzhou_transcribe.py "<url>" --output-dir <workspace>/transcripts --model base --language zh`
- For episodes >2h, run in background (add timeout 7200+) to avoid SIGTERM
- Read the generated `.txt` file as primary content source

**Other platforms:**
- Try browser tools to extract audio or page content
- If audio available, transcribe with faster-whisper locally
- If text transcript/shownotes available on page, extract directly

### Step 2: Extract Comments & Metadata

**小宇宙:**
- Fetch episode page, parse `__NEXT_DATA__` JSON for shownotes + hot comments
- If `__NEXT_DATA__` unavailable, use browser snapshot to scrape comments
- Comments often contain higher signal than the show itself — prioritize quality over quantity

**Other platforms:**
- Use browser to visit comment section, extract top comments

### Step 3: Analyze & Write Report

Read the full transcript (may need multiple reads for long episodes — use offset/limit).
Produce report strictly following the template in [references/report-template.md](references/report-template.md).

Key principles:
- **Precision over summary**: restore exact arguments, evidence chains, and specific expressions
- **Golden quotes must be verbatim** from transcript, marked with quotation marks
- **Community insights matter**: comments often provide perspectives the hosts missed
- **Neutrality**: assess both strengths and blind spots objectively
- **No fabrication**: if transcript is unclear on a point, say so rather than guessing

### Step 4: Deliver

1. Output full report in chat
2. Save copy to `<workspace>/podcast-reviews/<podcast-name>-<episode-topic>.md`

## Tips

- For Chinese podcasts, always use `--language zh` for better transcription accuracy
- Use `base` model as default; `small` for shorter episodes needing higher accuracy
- Long transcriptions (>1h audio) should run as background exec with generous timeout
- If transcription fails mid-way, the `.mp3` is already downloaded — retry with `--audio-path`
- Shownotes provide time-stamped structure — use them to organize report sections even before full transcript is ready
