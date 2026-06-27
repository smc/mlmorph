# Match the CI base (debian:trixie) so the dev environment doesn't drift
# from what builds and tests on GitLab.
FROM mcr.microsoft.com/devcontainers/base:trixie

# Core build dependencies:
#   make, sfst   -> compile *.fst lexicon/rules into *.a automata
#   hfst         -> optional alternate FST compiler (FSTC=hfst)
#   locales      -> tests run under LC_ALL=ml_IN.UTF-8
#   build-essential, pkg-config -> needed by the Rust `sfst` crate / native deps
RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y --no-install-recommends \
        make \
        sfst \
        locales \
        build-essential \
        pkg-config \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Generate the Malayalam locale the test suite depends on.
RUN sed -i 's/^# *\(ml_IN.UTF-8\)/\1/' /etc/locale.gen \
    && locale-gen ml_IN.UTF-8
