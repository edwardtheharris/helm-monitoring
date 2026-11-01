# syntax=docker/dockerfile:1
ARG PYTHON_VERSION='3.12'
FROM python:${PYTHON_VERSION}-alpine AS nautobot
ARG VERSION
ARG USER=nautobot
LABEL io.ghcr.edwardtheharris.helm-nautobot.editor="Xander Harris"
LABEL io.ghcr.edwardtheharris.helm-nautobot.name="nautobot"
LABEL io.ghcr.edwardtheharris.helm-nautobot.version="${VERSION}"
LABEL org.opencontainers.image.base.name="nautobot/nautobot"
LABEL org.opencontainers.image.description="Runs nautobot for nautobot on Kubernetes."
LABEL org.opencontainers.image.source="https://github.com/edwardtheharris/helm-monitoring"
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
  redis \
  shadow \
  sudo \
  wget \
  vim \
  xmlsec-dev \
  zlib-dev \
  && wget https://bootstrap.pypa.io/get-pip.py \
  && python get-pip.py \
  && groupadd nautobot \
  && useradd -s /bin/bash -m -d /opt/nautobot -u 1000 -g nautobot nautobot
COPY --chown=nautobot reqs /opt/nautobot/reqs
WORKDIR /opt/nautobot
RUN /usr/local/bin/python -m venv . \
  && /opt/nautobot/bin/pip install --no-cache-dir -U pip nautobot \
  && /opt/nautobot/bin/pip install --no-cache-dir -v -r /opt/nautobot/reqs \
  && rm -v /opt/nautobot/reqs
COPY --chown=nautobot local_requirements.txt /opt/nautobot/local_requirements.txt
RUN /opt/nautobot/bin/pip install --no-cache-dir -r /opt/nautobot/local_requirements.txt \
  && rm /opt/nautobot/local_requirements.txt
USER 1000
WORKDIR /opt/nautobot
EXPOSE 8000
CMD ["/opt/nautobot/bin/nautobot-server", "--config-path", "/opt/nautobot/.nautobot/nautobot_config.py", "runserver", "0.0.0.0:8000"]

FROM nautobot AS worker
LABEL org.opencontainers.image.source="https://github.com/edwardtheharris/helm-monitoring"
LABEL org.opencontainers.image.description="Celery Worker for Nautobot"
LABEL org.opencontainers.image.licenses=MIT
LABEL org.opencontainers.image.base.name="nautobot/worker"
EXPOSE 5672
COPY --chmod=+x worker-entrypoint.sh /bin/entrypoint.sh
CMD ["/bin/entrypoint.sh"]

FROM nautobot AS scheduler
LABEL org.opencontainers.image.source="https://github.com/edwardtheharris/helm-monitoring"
LABEL org.opencontainers.image.description="Celery Scheduler for Nautobot"
LABEL org.opencontainers.image.licenses=MIT
LABEL org.opencontainers.image.base.name="nautobot/scheduler"
EXPOSE 5673
CMD ["/opt/nautobot/bin/nautobot-server", "--config-path", "/opt/nautobot/.nautobot/nautobot_config.pyd", "celery", "beat"]

