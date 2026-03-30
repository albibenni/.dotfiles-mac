#!/usr/bin/env bash

iclaude(){
    # npm install -g @anthropic-ai/claude-code
    curl -fsSL https://claude.ai/install.sh | bash
}

igemini(){
    npm install -g @google/gemini-cli
}

icodex(){
    npm i -g @openai/codex
}

cdx(){
    codex
}

cld(){
    claude
}

gem(){
    gemini
}
