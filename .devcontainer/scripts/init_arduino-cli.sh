#!/usr/bin/env bash

CONFIG_PATH="/home/vscode/.arduino15/arduino-cli.yaml"
ZSH_COMP_DIR="/home/vscode/.zsh/completion"

if [ ! -f "$CONFIG_PATH" ]; then
    echo "[Init] Creating initial Arduino CLI config..."
    arduino-cli config init

    arduino-cli config set directories.user /workspace
    arduino-cli config set build_cache.path /home/vscode/.arduino15/BUILD_CACHE

    echo "[Init] Arduino CLI config generated."
else
    echo "[Init] arduino-cli.yaml already exists. Skipping init."
fi

echo "[Init] Setting up zsh autocompletion..."
mkdir -p "$ZSH_COMP_DIR"
arduino-cli completion zsh > "$ZSH_COMP_DIR/_arduino-cli"

if ! grep -q "fpath=(~/.zsh/completion \$fpath)" ~/.zshrc; then
    echo 'fpath=(~/.zsh/completion $fpath)' >> ~/.zshrc
    echo 'autoload -Uz compinit && compinit' >> ~/.zshrc
fi
