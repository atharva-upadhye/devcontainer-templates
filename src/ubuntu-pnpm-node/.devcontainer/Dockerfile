ARG UBUNTU_VERSION
ARG PNPM_VERSION
ARG NODE_VERSION
# these will be evaluated using shell parameter expression since Dockerfile cannot run shell script

FROM mcr.microsoft.com/devcontainers/base:ubuntu${UBUNTU_VERSION:+-}${UBUNTU_VERSION}
ARG USER=vscode

RUN usermod -s /usr/bin/zsh ${USER}

USER ${USER}

ARG HOME=/home/${USER}

WORKDIR ${HOME}

ARG PNPM_HOME=${HOME}/.local/share/pnpm

ENV PATH="${PNPM_HOME}:$PATH"

RUN <<EOT
    wget -qO- https://get.pnpm.io/install.sh | PNPM_VERSION=${PNPM_VERSION} ENV="${HOME}/.zshrc" SHELL=/bin/zsh sh -
    pnpm env use -g ${NODE_VERSION:-lts}
    # pnpm env use -g lts
EOT

ARG ZSH_HOME=${HOME}/.zshrc