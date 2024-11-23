FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update \
  && apt install -y curl wget \
  && curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh \
  && bash nodesource_setup.sh \
  && apt install -y nodejs \
  && apt install -y build-essential \
  && apt install -y openjdk-8-jre \
  && apt install -y graphviz \
  && apt install -y imagemagick \
  && npx playwright install-deps \
  && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
  && apt install -y ./google-chrome-stable_current_amd64.deb \
  && rm -rf google-chrome-stable_current_amd64.deb \
  && rm -rf /var/lib/apt/lists/*
