# syntax=docker/dockerfile:1
ARG VARIANT="ubuntu-24.04"
# https://hub.docker.com/r/microsoft/devcontainers-cpp
FROM mcr.microsoft.com/vscode/devcontainers/cpp:1-${VARIANT}

USER root

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y --no-install-recommends \
    usbutils python-is-python3 python3-pip && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*

USER vscode
WORKDIR /home/vscode

ARG ARDUINO_CLI_VERSION="1.3.1"
ENV SHELL="/bin/zsh"
ENV PATH="/home/vscode/bin:${PATH}"

RUN curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh \
    | sh -s ${ARDUINO_CLI_VERSION}

RUN mkdir -p /home/vscode/.arduino15
COPY --chmod=755 --chown=vscode:vscode /scripts/init_arduino-cli.sh /home/vscode/.config/init_arduino-cli.sh
