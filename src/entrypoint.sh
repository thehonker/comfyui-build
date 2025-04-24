#!/bin/bash

echo "entrypoint.sh start"

echo "activating venv at ${HOME}/comfyui"

cd "${HOME}/comfyui/" || exit 1

. "${HOME}/comfyui/bin/activate"

echo "launching comfyui with args: $@"

exec python3 "${HOME}/comfyui/main.py" "$@"
