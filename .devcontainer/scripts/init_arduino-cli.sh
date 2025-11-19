#!/usr/bin/env bash

CONFIG_PATH="/home/vscode/.arduino15/arduino-cli.yaml"

if [ ! -f "$CONFIG_PATH" ]; then
    echo "[Init] Creating initial Arduino CLI config..."
    arduino-cli config init

    arduino-cli config set directories.user /workspace
    arduino-cli config set build_cache.path /home/vscode/.arduino15/BUILD_CACHE

#    arduino-cli config add board_manager.additional_urls \
#      https://espressif.github.io/arduino-esp32/package_esp32_index.json

    echo "[Init] Arduino CLI config generated."
else
    echo "[Init] arduino-cli.yaml already exists. Skipping init."
fi
