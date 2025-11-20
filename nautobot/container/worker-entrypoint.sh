#!/bin/bash

PATH="/opt/nautobot/bin:$PATH"

export PATH

cp -v /opt/nautobot/.nautobot/nautobot_config.py /opt/nautobot/nautobot_config.py

exec /opt/nautobot/bin/nautobot-server celery worker
