#!/usr/bin/env bash

iclaude(){
    # npm install -g @anthropic-ai/claude-code
    curl -fsSL https://claude.ai/install.sh | bash
}

igemini(){
    npm install -g @google/gemini-cli
}

# cclaude(){
#     iclaude
#     claude
# }

cld(){
    claude
}

gem(){
    gemini
}
