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
  && /usr/local/bin/python -m venv /opt/nautobot \
  && /opt/nautobot/bin/pip install -U pip nautobot \
  && /opt/nautobot/bin/pip install -r reqs \
  && rm -v /opt/nautobot/reqs
USER nautobot
WORKDIR /opt/nautobot
EXPOSE 8000
COPY --chmod=+x nautobot-entrypoint.sh /bin/entrypoint.sh
CMD ["/bin/entrypoint.sh"]

FROM nautobot AS worker
USER nautobot
EXPOSE 5672
COPY --chmod=+x worker-entrypoint.sh /bin/entrypoint.sh
CMD ["/bin/entrypoint.sh"]

FROM worker AS scheduler
EXPOSE 5673
COPY --chmod=+x scheduler-entrypoint.sh /bin/entrypoint.sh
CMD ["/bin/entrypoint.sh"]

