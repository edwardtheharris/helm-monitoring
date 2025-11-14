# syntax=docker/dockerfile:1
ARG PYTHON_VERSION='3.12'
FROM python:${PYTHON_VERSION}-alpine AS nautobot
ARG VERSION
LABEL io.ghcr.edwardtheharris.helm-nautobot.editor="Xander Harris"
LABEL io.ghcr.edwardtheharris.helm-nautobot.name="nautobot"
LABEL org.opencontainers.image.source="https://github.com/edwardtheharris/helm-monitoring"
LABEL org.opencontainers.image.description="Runs nautobot on Kubernetes."
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
  && groupadd nautobot \
  && useradd -s /bin/bash -m -d /opt/nautobot -g nautobot nautobot
WORKDIR /opt/nautobot
USER nautobot
RUN python -m venv . \
  && /opt/nautobot/bin/pip install --no-cache-dir -U pip nautobot
COPY config/nautobot.bashrc /opt/nautobot/.bashrc
COPY config/nautobot.init.sh /bin/init.sh
COPY config/reqs /opt/nautobot/reqs
COPY config/uwsgi.ini /opt/nautobot/uwsgi.ini
RUN bin/pip install --no-cache-dir -v -r reqs \
  && rm -v reqs
ENV NAUTOBOT_ROOT=/opt/nautobot
CMD ["/bin/bash", "/bin/init.sh"]

FROM nautobot AS worker
USER root
COPY config/celery.bashrc /opt/nautobot/.bashrc
COPY config/celery.init.sh /bin/init.sh
RUN chmod +x /bin/init.sh
CMD ["tail", "-f", "/dev/null"]
