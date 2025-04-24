#!/bin/bash

echo "entrypoint.sh start"

cd "${HOME}/comfyui/" || exit 1

. "${HOME}/comfyui/bin/activate"

exec python3 "${HOME}/comfyui/main.py" "$@"
