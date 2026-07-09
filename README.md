# comfyui-containerized

Containerized builds of [ComfyUI](https://github.com/comfyanonymous/ComfyUI) for AMD ROCm 6.3.

Images are built from the `rocm/dev-ubuntu-24.04:6.3` base, with PyTorch ROCm wheels installed via `uv`. ComfyUI runs inside a Python 3.12 venv under an unprivileged `comfyui` user (uid/gid 1101, member of `render` and `video` groups).

## Images

### Nightly

Built daily from the ComfyUI `master` branch.

[![ComfyUI - ROCm 6.3 - Nightly](https://github.com/thehonker/comfyui-build/actions/workflows/container-image-rocm6.3-nightly.yml/badge.svg)](https://github.com/thehonker/comfyui-build/actions/workflows/container-image-rocm6.3-nightly.yml)

```
ghcr.io/thehonker/comfyui:rocm6.3-latest
```

Nightly: [`6cc8144`](https://github.com/comfyanonymous/ComfyUI/commit/6cc814437f1da529cc949146775f0a5fd1f7e418) (2026-07-09)

### Stable

Built weekly from the latest upstream git tag.

[![ComfyUI - ROCm 6.3 - Stable](https://github.com/thehonker/comfyui-build/actions/workflows/container-image-rocm6.3-stable.yml/badge.svg)](https://github.com/thehonker/comfyui-build/actions/workflows/container-image-rocm6.3-stable.yml)

```
ghcr.io/thehonker/comfyui:rocm6.3-stable
```

Stable: `v0.27.0` (2026-07-05)

### Tags

Each build also gets a datestamp tag (e.g. `rocm6.3-20260608`) and a ref tag (e.g. `rocm6.3-a3f7c2d` for nightlies, `rocm6.3-v0.2.4` for stable).

## Running

```bash
docker run --device /dev/kfd --device /dev/dri \
  --group-add render --group-add video \
  -p 8188:8188 \
  -v /path/to/models:/home/comfyui/comfyui/models:ro \
  -v /path/to/output:/home/comfyui/comfyui/output \
  ghcr.io/thehonker/comfyui:rocm6.3-latest
```

All arguments passed to `docker run` after the image name are forwarded to ComfyUI. All environment variables are passed through.

### Volumes

| Path | Purpose |
|------|---------|
| `/home/comfyui/comfyui/models` | Model checkpoints, VAEs, LoRAs, etc. |
| `/home/comfyui/comfyui/output` | Generated images |
| `/home/comfyui/comfyui/custom_nodes` | Custom nodes |

No volumes or envvars are set by the image — mount what you need.

### Udev

If your host doesn't already grant group access to `/dev/kfd` and `/dev/dri`, install the provided udev rule:

```
sudo cp deploy/udev/90-amdgpu.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules && sudo udevadm trigger
```

This sets `MODE="0666"` on AMD GPU devices so the container's `render`/`video` groups can access them.

## Patches

Drop `*.patch` files into `patches/rocm6.3/` and they'll be automatically applied to the ComfyUI source before build. Patches are applied with `git apply` in order.

## Building locally

```bash
git clone https://github.com/comfyanonymous/ComfyUI.git src/comfyui
docker build -t comfyui:local -f src/Dockerfile.rocm6.3 src/
```
