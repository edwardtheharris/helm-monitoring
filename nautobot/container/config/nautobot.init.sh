#!/bin/bash

set -x

cat /opt/.nautobot/resolv.conf >/etc/resolv.conf

chown -v nautobot:nautobot /opt/nautobot

sudo -u nautobot /opt/nautobot/bin/pip install --no-cache-dir -U pip

sudo -u nautobot /opt/nautobot/bin/pip install --no-cache-dir -r /opt/.nautobot/reqs

cat /opt/.nautobot/.bashrc >/opt/nautobot/.bashrc
cat /opt/.nautobot/uwsgi.ini >/opt/nautobot/uwsgi.ini

chown -v nautobot:nautobot /opt/nautobot/.bashrc
chown -v nautobot:nautobot /opt/nautobot/uwsgi.ini

NAUTOBOT_ROOT=/opt/nautobot

export NAUTOBOT_ROOT

sudo -E -u nautobot /opt/nautobot/bin/nautobot-server init

sudo -E -u nautobot /opt/nautobot/bin/nautobot-server migrate

sudo -E -u nautobot /opt/nautobot/bin/nautobot-server createsuperuser --email "${NAUTOBOT_SUPERUSER_EMAIL}" --username "${NAUTOBOT_SUPERUSER_USERNAME}" --noinput

sudo -E -u nautobot /opt/nautobot/bin/nautobot-server collectstatic

exit 0
