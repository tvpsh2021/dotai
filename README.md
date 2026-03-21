# dotai

Personal AI tool configuration and rules, managed from a single source of truth.

## Overview

All AI rule definitions live in `~/.codex/AGENTS.md`. Each AI tool is configured
to load this file using its native mechanism, keeping rules consistent across tools.

## File Structure

```
~/.codex/
  AGENTS.md                         # source of truth for all AI rules

~/.gemini/
  AGENTS.md -> ~/.codex/AGENTS.md   # symlink

~/.cursor/
  hooks.json
  hooks/
    load-agents-rules.sh

~/.claude/
  CLAUDE.md                         # references AGENTS.md via @import
```

## Supported Tools

### Codex

Reads `~/.codex/AGENTS.md` natively. No additional setup required.

### Gemini CLI

A symlink points `~/.gemini/AGENTS.md` to the source file:

```bash
ln -s ~/.codex/AGENTS.md ~/.gemini/AGENTS.md
```

### Cursor

Uses a session hook to inject the file as additional context on session start.

Copy `cursor/hooks.json` to `~/.cursor/hooks.json` and `cursor/hooks/` to `~/.cursor/hooks/`:

```bash
cp cursor/hooks.json ~/.cursor/hooks.json
cp -r cursor/hooks ~/.cursor/hooks
chmod +x ~/.cursor/hooks/load-agents-rules.sh
```

### Claude Code

Add the following line to `~/.claude/CLAUDE.md`:

```
@/Users/your-username/.codex/AGENTS.md
```

## Setup (all at once)

```bash
# Clone
git clone https://github.com/tvpsh2021/dotai.git ~/repos/dotai

# AGENTS.md
cp ~/repos/dotai/AGENTS.md ~/.codex/AGENTS.md

# Gemini symlink
ln -s ~/.codex/AGENTS.md ~/.gemini/AGENTS.md

# Cursor
cp ~/repos/dotai/cursor/hooks.json ~/.cursor/hooks.json
cp -r ~/repos/dotai/cursor/hooks ~/.cursor/hooks
chmod +x ~/.cursor/hooks/load-agents-rules.sh

# Claude Code — add this line to ~/.claude/CLAUDE.md
echo "@$HOME/.codex/AGENTS.md" >> ~/.claude/CLAUDE.md
```
