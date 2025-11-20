#!/bin/bash

PATH="/opt/nautobot/bin:$PATH"

export PATH

cp -v /opt/nautobot/.nautobot/nautobot_config.py /opt/nautobot/nautobot_config.py
cp -v /opt/nautobot/.nautobot/uwsgi.ini /opt/nautobot/uwsgi.ini

/opt/nautobot/bin/nautobot-server migrate
/opt/nautobot/bin/nautobot-server collectstatic

exec /opt/nautobot/bin/nautobot-server start --ini /opt/nautobot/uwsgi.ini
