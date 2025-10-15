# syntax=docker/dockerfile:1

FROM docker.io/ubuntu:24.04

ARG GPU_DRIVER

ENV GPU_DRIVER=$GPU_DRIVER

USER root

RUN set -exu \
  && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -yq update \
  && apt-get -yq install \
    bash \
    curl \
    nano \
    wget \
    git \
    python3 \
    python3-venv \
    python3-pip \
    pipx \
    libgl1 \
    libglib2.0-0 \
    libtcmalloc-minimal4 \
    bc \
    pciutils \
  && apt-get -yq clean

RUN set -exu \
  && addgroup \
    --gid 1101 \
    comfyui \
  && adduser \
    --uid 1101 \
    --ingroup comfyui \
    --disabled-password \
    --gecos comfyui \
    comfyui

# comfyui repo assumed to have been cloned for us
COPY --chown=comfyui:comfyui ./comfyui /home/comfyui/comfyui
COPY ./entrypoint.sh /home/comfyui/entrypoint.sh

USER comfyui
WORKDIR /home/comfyui

RUN set -exu \
  && export DEBIAN_FRONTEND=noninteractive \
  && pipx install uv \
  && $HOME/.local/bin/uv venv --relocatable --prompt invoke --python 3.12 --python-preference only-managed .venv \
  && source .venv/bin/activate \
  && $HOME/.local/bin/uv pip install --upgrade torch torchvision torchaudio --python 3.12 --python-preference only-managed --torch-backend=$GPU_DRIVER --force-reinstall \
  && $HOME/.local/bin/uv pip install -r $HOME/comfyui/requirements.txt \
  && deactivate \
  && rm -rf $HOME/invokeai

ENTRYPOINT ["/bin/bash"]
CMD ["/home/comfyui/entrypoint.sh"]
