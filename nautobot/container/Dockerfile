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
COPY ./config/nautobot.init.sh /bin/init.sh
RUN chmod +x /bin/init.sh
USER nautobot
WORKDIR /opt/nautobot
RUN python -m venv . \
  && bin/pip install -U pip nautobot
COPY config/nautobot.bashrc /opt/nautobot/.bashrc
COPY config/reqs /opt/nautobot/reqs
COPY ./config/uwsgi.ini /opt/nautobot/uwsgi.ini
RUN bin/pip install -r reqs \
  rm -v reqs
CMD ["tail", "-f", "/dev/null"]

FROM nautobot AS worker
USER root
COPY config/celery.bashrc /opt/nautobot/.bashrc
COPY config/celery.init.sh /bin/init.sh
RUN chmod +x /bin/init.sh
USER nautobot
CMD ["tail", "-f", "/dev/null"]
