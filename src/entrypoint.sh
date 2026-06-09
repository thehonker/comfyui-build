#!/bin/bash
set -eu

echo "Activate venv at ${HOME}/.venv"
cd "${HOME}" || exit 1
. $HOME/.bashrc
. "${HOME}/.venv/bin/activate"

echo "launching comfyui with:"
echo "exec python3 ${HOME}/comfyui/main.py ${*}"

exec python3 "${HOME}/comfyui/main.py" "${@}"
