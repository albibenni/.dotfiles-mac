#!/usr/bin/env zsh


addToPathzsh() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$PATH:$1
    fi
}

addToPathFrontzsh() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}
