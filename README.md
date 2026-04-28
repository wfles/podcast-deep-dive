# Podcast Deep Dive 🎙️

**English** | [中文](#中文说明)

An [OpenClaw](https://github.com/nicepkg/openclaw) / [Claude Code](https://docs.anthropic.com/en/docs/claude-code) skill that produces structured deep-dive reports from podcast episodes.

Give it a podcast link → get a full breakdown with key arguments, golden quotes, blind-spot analysis, and community insights.

## Quick Install

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/wfles/podcast-deep-dive/main/install.sh)
```

That's it. One command installs for **both OpenClaw and Claude Code** automatically.

> If `curl` fails on your network, try: `git clone https://github.com/wfles/podcast-deep-dive.git && cd podcast-deep-dive && bash install.sh`

### What the installer does

| Step | OpenClaw | Claude Code |
|------|----------|-------------|
| Copy skill files | `~/.qclaw/skills/podcast-deep-dive/` | `~/.claude/skills/podcast-deep-dive/` |
| Register | Auto-detected by OpenClaw | Appends reference to `~/.claude/CLAUDE.md` |

### Dependencies

The installer checks for these; install if missing:

- [faster-whisper](https://github.com/SYSTRAN/faster-whisper): `pip install -U faster-whisper`
- ffmpeg: `brew install ffmpeg` (macOS) / `apt install ffmpeg` (Linux)

## Usage

Just send a podcast link to your assistant:

```
帮我分析这期播客：https://www.xiaoyuzhoufm.com/episode/xxxxx
```

Or in English:

```
Analyze this podcast: https://www.xiaoyuzhoufm.com/episode/xxxxx
```

The skill auto-triggers and runs the full pipeline.

## What It Does

1. **Transcribe** — Downloads audio and runs faster-whisper locally (小宇宙 links supported out of the box; other platforms via browser extraction)
2. **Extract Comments & Metadata** — Pulls shownotes, time-stamped sections, and top comments
3. **Analyze** — Produces a structured report:
   - 📋 Episode info
   - 📝 Section-by-section breakdown (core stance → evidence → verbatim golden quotes)
   - 🌟 Highlights & blind spots
   - 💬 Community insights (fact checks, deeper takes, controversies)
   - 🎯 Summary (emotion vs. information ratio, core contribution, ideal audience)
4. **Deliver** — Outputs in chat + saves to `podcast-reviews/`

## Report Template

See [references/report-template.md](references/report-template.md) for the full output structure.

## Supported Platforms

| Platform | Transcription | Comments | Notes |
|----------|--------------|----------|-------|
| 小宇宙 (xiaoyuzhoufm) | ✅ faster-whisper via xiaoyuzhou-transcribe | ✅ via `__NEXT_DATA__` | Best supported |
| Other (generic URL) | ⚠️ Browser extraction or local whisper | ⚠️ Browser scraping | May require manual steps |

## License

MIT

---

# 中文说明

一个 [OpenClaw](https://github.com/nicepkg/openclaw) / [Claude Code](https://docs.anthropic.com/en/docs/claude-code) 技能（Skill），用于对播客节目进行结构化深度复盘。

发一个播客链接 → 自动转录 → 提取评论 → 输出包含核心论点、金句摘录、盲区分析和社区洞察的完整报告。

## 一键安装

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/wfles/podcast-deep-dive/main/install.sh)
```

一条命令，**OpenClaw 和 Claude Code 同时装好**。

> 如果网络不好 curl 失败，可以用：`git clone https://github.com/wfles/podcast-deep-dive.git && cd podcast-deep-dive && bash install.sh`

### 安装脚本做了什么

| 步骤 | OpenClaw | Claude Code |
|------|----------|-------------|
| 复制技能文件 | `~/.qclaw/skills/podcast-deep-dive/` | `~/.claude/skills/podcast-deep-dive/` |
| 注册 | OpenClaw 自动检测 | 自动追加引用到 `~/.claude/CLAUDE.md` |

### 依赖

安装脚本会自动检测以下依赖，缺了会提示安装命令：

- [faster-whisper](https://github.com/SYSTRAN/faster-whisper)：`pip install -U faster-whisper`
- ffmpeg：`brew install ffmpeg`（macOS）/ `apt install ffmpeg`（Linux）

## 使用方式

直接把播客链接发给你的助手：

```
帮我分析这期播客：https://www.xiaoyuzhoufm.com/episode/xxxxx
```

技能会自动触发，跑完整个流程。

## 功能概览

1. **转录** — 下载音频并用 faster-whisper 本地转录（小宇宙链接开箱即用，其他平台通过浏览器提取）
2. **提取评论与元数据** — 从节目页面抓取 shownotes、时间戳分段和热门评论
3. **深度分析** — 按模板输出结构化报告：
   - 📋 节目信息
   - 📝 分板块内容概要（核心立场 → 论据细节 → 原文金句）
   - 🌟 亮点与增量 / 观察与省思
   - 💬 评论区高光（事实补充/反证、思维跃迁、舆论共鸣与冲突）
   - 🎯 总结（情绪价值 vs 信息价值占比、核心贡献、适合场景）
4. **交付** — 聊天中直接输出 + 保存到 `podcast-reviews/` 目录

## 报告模板

完整输出结构见 [references/report-template.md](references/report-template.md)。

## 支持平台

| 平台 | 转录 | 评论 | 备注 |
|------|------|------|------|
| 小宇宙 (xiaoyuzhoufm) | ✅ faster-whisper via xiaoyuzhou-transcribe | ✅ via `__NEXT_DATA__` | 支持最好 |
| 其他（通用 URL） | ⚠️ 浏览器提取或本地 whisper | ⚠️ 浏览器抓取 | 可能需要手动操作 |

## 许可证

MIT
