#!/bin/bash

set -exu

cd $HOME || exit 1

export GPU_DRIVER=$1

export DEBIAN_FRONTEND=noninteractive

case $GPU_DRIVER in
  rocm6.3)
    TORCH_INDEX_URL=https://download.pytorch.org/whl/rocm6.3
    ;;
  *)
    echo "Unsupported GPU driver: $GPU_DRIVER"
    exit 1
    ;;
esac

# Install uv
curl -LsSf https://astral.sh/uv/install.sh | sh
export PATH="$HOME/.local/bin:$PATH"

# Create venv — use system Python 3.12
uv venv --relocatable --prompt comfyui --python 3.12 $HOME/.venv

. $HOME/.venv/bin/activate

uv pip install \
  --index-url "${TORCH_INDEX_URL}" \
  torch \
  torchvision \
  torchaudio

uv pip install -r $HOME/comfyui/requirements.txt

uv pip install -r $HOME/comfyui/manager_requirements.txt

deactivate
