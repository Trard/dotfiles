FROM debian:13

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8

# Base CLI/build tools + Python + build toolchains.
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash ca-certificates curl wget gnupg dirmngr git unzip zip \
    ripgrep fd-find jq \
    python3 python3-pip python3-venv \
    gcc g++ clang make cmake \
    golang-go rustc cargo \
    ffmpeg \
    sqlite3 postgresql-client default-mysql-client redis-tools \
    maven gradle \
 && ln -sf /usr/bin/fdfind /usr/local/bin/fd \
 && rm -rf /var/lib/apt/lists/*

# Java 24 (Temurin) for Debian 13 (trixie).
RUN wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public \
    | gpg --dearmor -o /usr/share/keyrings/adoptium.gpg \
 && echo "deb [signed-by=/usr/share/keyrings/adoptium.gpg] https://packages.adoptium.net/artifactory/deb trixie main" \
    > /etc/apt/sources.list.d/adoptium.list \
 && apt-get update \
 && apt-get install -y --no-install-recommends temurin-24-jdk \
 && rm -rf /var/lib/apt/lists/*

# Node.js 22.
RUN mkdir -p /etc/apt/keyrings \
 && curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key \
    | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
 && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_22.x nodistro main" \
    > /etc/apt/sources.list.d/nodesource.list \
 && apt-get update \
 && apt-get install -y --no-install-recommends nodejs \
 && rm -rf /var/lib/apt/lists/*

# yq (v4, Mike Farah).
ARG YQ_VERSION=v4.44.2
RUN curl -fsSL "https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64" \
    -o /usr/local/bin/yq \
 && chmod +x /usr/local/bin/yq

# Codex CLI + uv (installed in isolated venv to satisfy PEP 668).
RUN npm i -g @openai/codex \
 && python3 -m venv /opt/uv \
 && /opt/uv/bin/pip install --no-cache-dir uv \
 && ln -sf /opt/uv/bin/uv /usr/local/bin/uv \
 && useradd -m -s /bin/bash codex

# Build-time verification for requested toolchain.
RUN java -version \
 && mvn -version \
 && gradle -v \
 && gcc --version \
 && g++ --version \
 && clang --version \
 && make --version \
 && cmake --version \
 && go version \
 && rustc --version \
 && cargo --version \
 && ffmpeg -version \
 && sqlite3 --version \
 && psql --version \
 && mysql --version \
 && redis-cli --version \
 && node -v \
 && npm -v \
 && uv --version \
 && yq --version \
 && jq --version \
 && rg --version \
 && python3 --version

USER codex
WORKDIR /workspace
ENTRYPOINT ["codex"]
