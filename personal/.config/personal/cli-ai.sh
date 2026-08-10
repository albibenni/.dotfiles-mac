#!/usr/bin/env bash

igpt() {
    npm i -g @openai/codex
}

iclaude() {
    curl -fsSL https://claude.ai/install.sh | bash
}
cld() {
    claude
}

gem() {
    gemini
}

igem() {
    npm install -g @google/gemini-cli
}

# Antigravity CLI (Successor to Gemini CLI)
agy() {
    if command -v agy >/dev/null 2>&1; then
        command agy "$@"
    else
        echo "Antigravity CLI (agy) not found. Run 'install-agy' to install."
    fi
}

install-agy() {
    curl -fsSL https://antigravity.google/cli/install.sh | bash
}

# AI Tracker Launcher
iai-tracker() {
    # echo "Starting AI Tracker on http://localhost:14832... (Press Ctrl+C to stop)"
    #
    # # Open the browser in the background after a 2 second delay to let the server boot
    # (sleep 2 && open http://localhost:14832) &
    #
    # # Navigate to the project directory and start the Next.js dev server in the foreground
    # cd /Users/benni/benni-projects/ai-tracker && npm run dev
    pnpm add -g ai-tracker
}
