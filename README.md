# comfyui-containerized

thehonker's builds of comfyui

## Usage

### Image

#### Latest nightly build

[![ComfyUI - CPU - Nightly](https://github.com/thehonker/comfyui-build/actions/workflows/container-image-cpu-nightly.yml/badge.svg)](https://github.com/thehonker/comfyui-build/actions/workflows/container-image-cpu-nightly.yml) \
`ghcr.io/thehonker/comfyui:cpu-latest`

[![ComfyUI - CUDA 12.6.x - Nightly](https://github.com/thehonker/comfyui-build/actions/workflows/container-image-cu126-nightly.yml/badge.svg)](https://github.com/thehonker/comfyui-build/actions/workflows/container-image-cu126-nightly.yml) \
`ghcr.io/thehonker/comfyui:cu126-latest`

[![ComfyUI - CUDA 12.8.x - Nightly](https://github.com/thehonker/comfyui-build/actions/workflows/container-image-cu128-nightly.yml/badge.svg)](https://github.com/thehonker/comfyui-build/actions/workflows/container-image-cu128-nightly.yml) \
`ghcr.io/thehonker/comfyui:cu128-latest`

[![ComfyUI - CUDA 13.0.x - Nightly](https://github.com/thehonker/comfyui-build/actions/workflows/container-image-cu130-nightly.yml/badge.svg)](https://github.com/thehonker/comfyui-build/actions/workflows/container-image-cu130-nightly.yml) \
`ghcr.io/thehonker/comfyui:cu130-latest`

[![ComfyUI - ROCM 6.3 - Nightly](https://github.com/thehonker/comfyui-build/actions/workflows/container-image-rocm6.3-nightly.yml/badge.svg)](https://github.com/thehonker/comfyui-build/actions/workflows/container-image-rocm6.3-nightly.yml) \
`ghcr.io/thehonker/comfyui:rocm6.3-latest`

[![ComfyUI - XPU - Nightly](https://github.com/thehonker/comfyui-build/actions/workflows/container-image-xpu-nightly.yml/badge.svg)](https://github.com/thehonker/comfyui-build/actions/workflows/container-image-xpu-nightly.yml) \
`ghcr.io/thehonker/comfyui:xpu-latest`

#### Upstream Git Tags

[![ComfyUI - CPU - Stable](https://github.com/thehonker/comfyui-build/actions/workflows/container-image-cpu-stable.yml/badge.svg)](https://github.com/thehonker/comfyui-build/actions/workflows/container-image-cpu-stable.yml) \
`ghcr.io/thehonker/comfyui:cpu-stable`

[![ComfyUI - CUDA 12.6.x - Stable](https://github.com/thehonker/comfyui-build/actions/workflows/container-image-cu126-stable.yml/badge.svg)](https://github.com/thehonker/comfyui-build/actions/workflows/container-image-cu126-stable.yml) \
`ghcr.io/thehonker/comfyui:cu126-stable`

[![ComfyUI - CUDA 12.8.x - Stable](https://github.com/thehonker/comfyui-build/actions/workflows/container-image-cu128-stable.yml/badge.svg)](https://github.com/thehonker/comfyui-build/actions/workflows/container-image-cu128-stable.yml) \
`ghcr.io/thehonker/comfyui:cu128-stable`

[![ComfyUI - CUDA 13.0.x - Stable](https://github.com/thehonker/comfyui-build/actions/workflows/container-image-cu130-stable.yml/badge.svg)](https://github.com/thehonker/comfyui-build/actions/workflows/container-image-cu130-stable.yml) \
`ghcr.io/thehonker/comfyui:cu130-stable`

[![ComfyUI - ROCM 6.3 - Stable](https://github.com/thehonker/comfyui-build/actions/workflows/container-image-rocm6.3-stable.yml/badge.svg)](https://github.com/thehonker/comfyui-build/actions/workflows/container-image-rocm6.3-stable.yml) \
`ghcr.io/thehonker/comfyui:rocm6.3-stable`

[![ComfyUI - XPU - Stable](https://github.com/thehonker/comfyui-build/actions/workflows/container-image-xpu-stable.yml/badge.svg)](https://github.com/thehonker/comfyui-build/actions/workflows/container-image-xpu-stable.yml) \
`ghcr.io/thehonker/comfyui:xpu-stable`

### Storage

We do not set any configuration envvars ourselves. \
We do not request any docker volumes ourselves. \
Mount storage to where you need it.

### Configuration

All args to `/entrypoint.sh` are passed to `comfyui`, as are all envvars.
