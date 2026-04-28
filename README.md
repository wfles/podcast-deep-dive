# Podcast Deep Dive 🎙️

**English** | [中文](#中文说明)

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

Or in English:

```
Analyze this podcast: https://www.xiaoyuzhoufm.com/episode/xxxxx
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

---

# 中文说明

一个 [OpenClaw](https://github.com/nicepkg/openclaw) 技能（Skill），用于对播客节目进行结构化深度复盘。

发一个播客链接 → 自动转录 → 提取评论 → 输出包含核心论点、金句摘录、盲区分析和社区洞察的完整报告。

## 功能概览

1. **转录** — 下载音频并用 [faster-whisper](https://github.com/SYSTRAN/faster-whisper) 本地转录（小宇宙链接开箱即用，其他平台通过浏览器提取）
2. **提取评论与元数据** — 从节目页面抓取 shownotes、时间戳分段和热门评论
3. **深度分析** — 按模板输出结构化报告：
   - 📋 节目信息
   - 📝 分板块内容概要（核心立场 → 论据细节 → 原文金句）
   - 🌟 亮点与增量 / 观察与省思
   - 💬 评论区高光（事实补充/反证、思维跃迁、舆论共鸣与冲突）
   - 🎯 总结（情绪价值 vs 信息价值占比、核心贡献、适合场景）
4. **交付** — 聊天中直接输出 + 保存到 `podcast-reviews/` 目录

## 安装

### 方式一：SkillHub（推荐）

```
openclaw skills install podcast-deep-dive
```

### 方式二：手动安装

1. 克隆或下载本仓库
2. 将 `podcast-deep-dive/` 文件夹复制到你的 OpenClaw skills 目录：
   - 默认路径：`~/.qclaw/skills/`
   - 或：`~/.openclaw/workspace/skills/`

### 依赖

- [faster-whisper](https://github.com/SYSTRAN/faster-whisper)：`pip install -U faster-whisper`
- [xiaoyuzhou-transcribe](https://github.com/nicepkg/openclaw) 技能（OpenClaw 内置）— 用于小宇宙节目转录

## 使用方式

直接把播客链接发给你的 OpenClaw 助手：

```
帮我分析这期播客：https://www.xiaoyuzhoufm.com/episode/xxxxx
```

技能会自动触发，跑完整个流程。

## 报告模板

完整输出结构见 [references/report-template.md](references/report-template.md)。

## 支持平台

| 平台 | 转录 | 评论 | 备注 |
|------|------|------|------|
| 小宇宙 (xiaoyuzhoufm) | ✅ faster-whisper via xiaoyuzhou-transcribe | ✅ via `__NEXT_DATA__` | 支持最好 |
| 其他（通用 URL） | ⚠️ 浏览器提取或本地 whisper | ⚠️ 浏览器抓取 | 可能需要手动操作 |

## 许可证

MIT
