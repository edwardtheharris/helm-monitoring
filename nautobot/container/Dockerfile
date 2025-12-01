# syntax=docker/dockerfile:1
ARG PYTHON_VERSION='3.12'
FROM python:${PYTHON_VERSION}-alpine AS nautobot
ARG VERSION
ARG USER=nautobot
LABEL io.ghcr.edwardtheharris.helm-nautobot.editor="Xander Harris"
LABEL io.ghcr.edwardtheharris.helm-nautobot.name="${USER}"
LABEL io.ghcr.edwardtheharris.helm-nautobot.version="${VERSION}"
LABEL org.opencontainers.image.base.name="nautobot/nautobot"
LABEL org.opencontainers.image.description="Runs ${USER} for nautobot on Kubernetes."
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
  && groupadd ${USER} \
  && useradd -s /bin/bash -m -d /opt/${USER} -g ${USER} ${USER}
COPY reqs /opt/nautobot/reqs
RUN /usr/local/bin/pip install --no-cache-dir -v -r /opt/nautobot/reqs \
  && /usr/local/bin/pip install --no-cache-dir -U pip nautobot \
  && rm -v /opt/nautobot/reqs
COPY local_requirements.txt /opt/nautobot/local_requirements.txt
COPY thw04.json.gpg /opt/nautobot/thw04.json.gpg
RUN /usr/local/bin/pip install --no-cache-dir -r /opt/nautobot/local_requirements.txt \
  && rm /opt/nautobot/local_requirements.txt
USER nautobot
WORKDIR /opt/nautobot
EXPOSE 8000
COPY --chmod=+x nautobot-entrypoint.sh /bin/entrypoint.sh
CMD ["/bin/entrypoint.sh"]

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
COPY --chmod=+x scheduler-entrypoint.sh /bin/entrypoint.sh
CMD ["/bin/entrypoint.sh"]

