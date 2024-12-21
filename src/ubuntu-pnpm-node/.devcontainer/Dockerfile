ARG UBUNTU_VERSION
ARG PNPM_VERSION
ARG NODE_VERSION

ARG BASE_IMAGE=ubuntu${UBUNTU_VERSION:+-}${UBUNTU_VERSION}
FROM mcr.microsoft.com/devcontainers/base:${BASE_IMAGE}

ARG USER=vscode
RUN usermod -s /usr/bin/zsh ${USER}

USER ${USER}

ARG HOME=/home/${USER}
WORKDIR ${HOME}

ARG PNPM_HOME=${HOME}/.local/share/pnpm
ENV PATH="${PNPM_HOME}:$PATH"

RUN wget -qO- https://get.pnpm.io/install.sh | PNPM_VERSION=${PNPM_VERSION}  SHELL=/bin/zsh sh -

ARG NODE_VERSION_FOR_PNPM=${NODE_VERSION:-lts}
RUN pnpm env use -g ${NODE_VERSION_FOR_PNPM}

# References
# - https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
# - https://mcr.microsoft.com/en-us/artifact/mar/devcontainers/base/about
# - https://pnpm.io/installation#in-a-docker-container
