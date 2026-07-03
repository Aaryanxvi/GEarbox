# 🏎️ Gearbox — shift gears on Claude Code

A little racing dashboard that sits on your screen and lets you **switch Claude Code's model with a gear stick** instead of typing commands. Drag the shifter into a gate and it swaps the model for you. It also shows you a **fuel gauge** (how much context/memory you have left), your **usage limits**, and a **nitro button** for fast mode.

> Works fully on **Windows**. Mac and Linux get a simpler terminal version (`gear.sh`).

---

## What it does

| Part | What it's for |
|------|---------------|
| 🕹️ **The gear stick** | Drag it into a gate (1–5 or R) to switch Claude's model — Haiku, Sonnet, Opus, Fable. |
| ⛽ **Fuel gauge** | How much of Claude's memory (context window) is still free. Full tank = fresh chat. |
| 🔧 **Effort levers** (left) | Set how hard Claude thinks: LOW / MED / HIGH / XHI. |
| 💨 **NOS bottle** | Toggles Claude Code's fast mode on/off. |
| 📊 **5H / WK bars** (right) | Your usage limits — how much you've used in the last 5 hours and this week. |

---

## Before you start — what you need

1. **A Windows PC.** (PowerShell is already built in — you don't install anything.)
2. **Claude Code** installed and working. If you can open a terminal and type `claude` and it runs, you're good. If not, get it here: https://claude.com/claude-code

That's it. No downloads to install, no accounts, no setup.

---

## Step 1 — Download Gearbox

**Easiest way (no tools needed):**

1. Go to the GitHub page: https://github.com/Aaryanxvi/GEarbox
2. Click the green **`< > Code`** button.
3. Click **Download ZIP**.
4. Find the ZIP in your Downloads folder, right-click it → **Extract All**.
5. You now have a folder called `GEarbox` (or `Gearbox-main`). Remember where it is — for example `C:\Users\YourName\Downloads\Gearbox-main`.

---

## Step 2 — Run it

1. Open the Gearbox folder in File Explorer.
2. Click the address bar at the top (where the folder path shows), type `powershell`, and press **Enter**. A blue/black window opens.
3. Copy-paste this line and press **Enter**:

   ```powershell
   powershell -sta -File shift-gui.ps1
   ```

The dashboard pops up and floats on top of your screen. 🎉

> **If Windows says the script is "blocked" or won't run**, paste this line first, press Enter, then try step 3 again:
> ```powershell
> Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
> ```
> This only allows scripts for that one window — it changes nothing permanently.

---

## Step 3 — Use it

1. **Click on your Claude Code terminal window once.** Gearbox automatically "locks on" to the last window you clicked — you'll see its name at the top under **TARGET**.
2. **Drag the gear stick** into any gate. The moment you drop it, Gearbox types the model-switch command into your Claude terminal for you.
3. That's the whole thing. Switch gears whenever you want a different model.

The gauges update on their own — fuel every few seconds, usage limits every 5 minutes.

---

## The gears

| Gate | Model | Good for |
|------|-------|----------|
| **1** | Haiku 4.5 | Quick, cheap, simple stuff |
| **2** | Sonnet 5 | Everyday driving |
| **3** | Sonnet 5 (1M) | Same, but huge memory for big projects |
| **4** | Opus 4.8 | Heavy lifting |
| **5** | Fable 5 | Maximum power |
| **R** | Default | Back to your default model |

---

## Bonus: launch it with `/gear` inside Claude Code

If you don't want to open PowerShell every time, you can make Claude launch it for you by typing `/gear`.

1. Copy the file `commands/gear.md` from the Gearbox folder into `C:\Users\YourName\.claude\commands\` (create the `commands` folder if it isn't there).
2. Open that copied `gear.md` in Notepad and change the path to point at your `shift-gui.ps1`.
3. Restart Claude Code. Now typing `/gear` launches the dashboard.

---

## Mac / Linux

The floating dashboard is Windows-only, but there's a terminal version:

```bash
chmod +x gear.sh      # one-time: make it runnable
./gear.sh             # pick a gear from a menu
./gear.sh 3           # jump straight into gear 3
./gear.sh 5 xhigh     # gear 5, max effort
```

Inside a running Claude session, `/model` and `/effort` do the same job by hand.

---

## Common questions

**Is it safe? Does it send my data anywhere?**
No. Everything runs on your own computer. The fuel gauge reads Claude Code's own local files; the usage bars use the same login token Claude Code already has. Nothing is uploaded.

**It says "NO TARGET SET" / nothing happens when I shift.**
Click on your Claude terminal window once so Gearbox knows where to type. Its name should appear under TARGET.

**The effort levers start blank every time.**
That's normal — Gearbox can't read your current effort setting, only set it. Click one to set it.

**How do I close it?**
Just close the dashboard window like any other window.

---

## License

MIT — free to use, change, and share. See [LICENSE](LICENSE).
