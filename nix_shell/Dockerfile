# Reuse a base image made for devcontainers.
#source code of the base image
# https://github.com/devcontainers/images/tree/main/src/base-debian
# https://github.com/docker-library/buildpack-deps/blob/d0ecd4b7313e9bc6b00d9a4fe62ad5787bc197ae/debian/bullseye/curl/Dockerfile
FROM mcr.microsoft.com/vscode/devcontainers/base:bullseye

ENV USER=vscode
ARG NIX_INSTALL_SCRIPT=https://nixos.org/nix/install

WORKDIR /app

# These dependencies are required by Nix.
RUN apt update -y && \
    apt -y install --no-install-recommends curl xz-utils sudo 

# Install Nix newest release
RUN   curl -L ${NIX_INSTALL_SCRIPT} | sudo -u vscode sh

COPY  shell.nix \
      nix_in_docker.sh /app/

USER vscode
# Make port 8888 available to the world outside this container
EXPOSE 8888
#RUN bash ./nix_in_docker.sh to acvitate env when using classical container

# Rebuilding the container should not throw the Nix store away so we make /nix
# a volume. See `devcontainer.json` later.
#VOLUME /nix