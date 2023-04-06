FROM nvidia/cuda:11.8.0-devel-ubuntu22.04
#FROM python:3.7-slim

WORKDIR /app
COPY . .

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y python3-pip wget && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    pip install -r requirements.txt && \
    pip cache purge && \
    python setup.py install

