#!/bin/bash

echo "entrypoint.sh start"

cd "${HOME}/comfyui/" || exit 1

exec python3 "${HOME}/comfyui/main.py" "$@"
