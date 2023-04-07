FROM nvidia/cuda:11.8.0-devel-ubuntu22.04
#FROM python:3.10-slim

WORKDIR /app
COPY . .

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y && \
    apt-get install -y python3-pip git gcc && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu117 && \
    pip install -e . && \
    pip install git+https://github.com/152334H/BigVGAN.git
