# syntax=docker/dockerfile:1
ARG PYTHON_VERSION='3.12'
FROM python:${PYTHON_VERSION}-alpine AS nautobot
ARG VERSION
ARG USER=nautobot
LABEL io.ghcr.edwardtheharris.helm-nautobot.editor="Xander Harris"
LABEL io.ghcr.edwardtheharris.helm-nautobot.name="${USER}"
LABEL org.opencontainers.image.source="https://github.com/edwardtheharris/helm-monitoring"
LABEL org.opencontainers.image.description="Runs ${USER} for nautobot on Kubernetes."
LABEL io.ghcr.edwardtheharris.helm-nautobot.version="${VERSION}"
VOLUME ["/opt/nautobot"]
RUN apk add --no-cache \
  alpine-sdk \
  bash \
  git \
  iputils-ping \
  libxml2-dev \
  jpeg-dev \
  mailcap \
  nmap \
  pkgconfig \
  python3-dev \
  shadow \
  sudo \
  vim \
  xmlsec-dev \
  zlib-dev \
  && groupadd ${USER} \
  && useradd -s /bin/bash -m -d /opt/${USER} -g ${USER} ${USER}
USER nautobot
WORKDIR /opt/nautobot
RUN python -m venv . \
  && bin/pip install -U pip nautobot
COPY reqs /opt/nautobot/reqs
RUN bin/pip install -v -r reqs \
  && rm -v reqs
EXPOSE 8000
CMD ["/opt/nautobot/bin/nautobot-server", "start", "--ini", "/opt/nautobot/uwsgi.ini"]

FROM nautobot AS worker
USER nautobot
CMD ["/opt/nautobot/bin/nautobot-server", "celery", "worker", "--loglevel", "DEBUG"]

FROM worker AS scheduler
CMD ["/opt/nautobot/bin/nautobot-server", "celery", "beat", "--loglevel", "DEBUG"]

