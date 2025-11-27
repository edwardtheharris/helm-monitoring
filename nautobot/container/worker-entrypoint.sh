#!/bin/bash

cp -v /opt/nautobot/.nautobot/nautobot_config.py /opt/nautobot/nautobot_config.py

exec /opt/nautobot/bin/nautobot-server --config /opt/nautobot/nautobot_config.py celery worker
