#!/bin/bash

PATH="/opt/nautobot/bin:$PATH"

export PATH

cp -v /opt/nautobot/.nautobot/nautobot_config.py /opt/nautobot/nautobot_config.py
cp -v /opt/nautobot/.nautobot/uwsgi.ini /opt/nautobot/uwsgi.ini

/usr/local/bin/nautobot-server migrate
/usr/local/bin/nautobot-server collectstatic
exec /usr/local/bin/nautobot-server start --config /opt/nautobot/nautobot_config.py --ini /opt/nautobot/uwsgi.ini -v 3
