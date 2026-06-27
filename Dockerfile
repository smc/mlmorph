FROM alpine:3.21

# System packages:
#   build-base, cmake, flex, bison, readline-dev -> build SFST from source
#   bash         -> Makefile.inc sets SHELL := /bin/bash
#   git          -> setuptools-scm derives the package version from git tags
#   python3, py3-pip, python3-dev -> python package + sfst musllinux wheel
#   uv           -> project dependency tooling (uv.lock)
#   nodejs, npm  -> build web frontend (docs:build via make docs)
#   rustup       -> Rust toolchain; Cargo.toml needs edition 2024 (Rust >= 1.85),
#                   newer than Alpine's packaged rust
RUN apk add --no-cache \
        build-base \
        cmake \
        flex \
        bison \
        readline-dev \
        bash \
        git \
        python3 \
        py3-pip \
        python3-dev \
        uv \
        nodejs \
        npm \
        rustup

# Alpine's system Python is PEP 668 "externally managed", but the project
# Makefile runs `pip install -e` directly, so allow system-level pip installs.
RUN rm -f /usr/lib/python3*/EXTERNALLY-MANAGED

# Rust toolchain via rustup (stable >= 1.85 for edition 2024).
ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH
RUN rustup-init -y --no-modify-path --profile minimal --default-toolchain stable

# Build and install SFST from source — the Debian package is outdated.
# Installs fst-compiler-utf8 (used by Makefile.inc) to /usr/local/bin and
# libsfst to /usr/local/lib (on musl's default library search path).
RUN git clone --depth 1 https://github.com/santhoshtr/sfst.git /tmp/sfst \
    && cmake -S /tmp/sfst -B /tmp/sfst/build -DCMAKE_BUILD_TYPE=Release \
    && cmake --build /tmp/sfst/build --parallel \
    && cmake --install /tmp/sfst/build \
    && rm -rf /tmp/sfst

WORKDIR /app
COPY . /app

EXPOSE 8000
CMD ["make", "webserver"]
