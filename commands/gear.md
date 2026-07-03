---
description: Launch the Gearbox model shifter
allowed-tools: Bash(powershell:*), Bash(swift:*), Bash(open:*)
---

Launch the Gearbox shifter for the user's platform, detached, so it keeps running independently of this session. The repo lives at the path in the user's `GEARBOX_DIR` environment variable; if that isn't set, ask the user for the repo path once.

**Windows** — launch the GUI, skipping if one is already open:

```
powershell -Command "if (Get-Process powershell -ErrorAction SilentlyContinue | Where-Object { $_.MainWindowTitle -eq 'MODEL SHIFT' }) { 'already running' } else { Start-Process powershell -ArgumentList '-sta','-WindowStyle','Hidden','-File',(Join-Path $env:GEARBOX_DIR 'shift-gui.ps1'); 'launched' }"
```

**macOS** — launch the Swift GUI in the background:

```
swift "$GEARBOX_DIR/gearbox-mac.swift" &
```

**Linux** — no GUI yet; tell the user `/model` and `/effort` are the gears in-session.

Report whether it launched or was already running, in one short line. Do nothing else.
