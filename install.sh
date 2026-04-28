#!/usr/bin/env bash
set -euo pipefail

# ─── Config ───
REPO="https://github.com/wfles/podcast-deep-dive.git"
SKILL_NAME="podcast-deep-dive"
OPENCLAW_DIR="${HOME}/.qclaw/skills"
CLAUDE_GLOBAL="${HOME}/.claude/CLAUDE.md"
TMP_DIR=$(mktemp -d)

cleanup() { rm -rf "$TMP_DIR"; }
trap cleanup EXIT

echo "🎙️  Installing podcast-deep-dive skill..."
echo ""

# ─── 1. Clone ───
echo "⬇️  Cloning from GitHub..."
git clone --depth 1 "$REPO" "${TMP_DIR}/${SKILL_NAME}" 2>/dev/null || {
  echo "❌ git clone failed. Check your network or try manual install:"
  echo "   git clone ${REPO} && cp -r ${SKILL_NAME} ~/.qclaw/skills/"
  exit 1
}
SRC="${TMP_DIR}/${SKILL_NAME}"

# ─── 2. Install for OpenClaw ───
mkdir -p "$OPENCLAW_DIR"
DST="${OPENCLAW_DIR}/${SKILL_NAME}"
rm -rf "$DST"
cp -r "$SRC" "$DST"
# Remove git metadata from skill dir
rm -rf "${DST}/.git" "${DST}/install.sh"
echo "✅ OpenClaw: skill installed → ${DST}"

# ─── 3. Install for Claude Code ───
CLAUDE_SKILL_DIR="${HOME}/.claude/skills"
mkdir -p "$CLAUDE_SKILL_DIR"
CLAUDE_DST="${CLAUDE_SKILL_DIR}/${SKILL_NAME}"
rm -rf "$CLAUDE_DST"
cp -r "$SRC" "$CLAUDE_DST"
rm -rf "${CLAUDE_DST}/.git" "${CLAUDE_DST}/install.sh"
echo "✅ Claude Code: skill installed → ${CLAUDE_DST}"

# Add reference to CLAUDE.md if not already there
MARKER="podcast-deep-dive skill"
if [ -f "$CLAUDE_GLOBAL" ] && grep -q "$MARKER" "$CLAUDE_GLOBAL" 2>/dev/null; then
  echo "✅ Claude Code: CLAUDE.md already references this skill"
else
  cat >> "$CLAUDE_GLOBAL" <<'SKILL_EOF'

## 🎙️ podcast-deep-dive skill

When the user provides a podcast link and wants analysis, follow the skill at `~/.claude/skills/podcast-deep-dive/SKILL.md`.
Read the SKILL.md first, then the report template at `~/.claude/skills/podcast-deep-dive/references/report-template.md`.
SKILL_EOF
  echo "✅ Claude Code: added skill reference → ${CLAUDE_GLOBAL}"
fi

# ─── 4. Check dependencies ───
echo ""
echo "🔍 Checking dependencies..."

if python3 -c "import faster_whisper" 2>/dev/null; then
  echo "✅ faster-whisper: installed"
else
  echo "⚠️  faster-whisper: not found → run:  pip install -U faster-whisper"
fi

if command -v ffmpeg &>/dev/null; then
  echo "✅ ffmpeg: installed"
else
  echo "⚠️  ffmpeg: not found → run:  brew install ffmpeg  (or apt install ffmpeg)"
fi

echo ""
echo "🎉 Done! Send any podcast link to get a deep-dive report."
