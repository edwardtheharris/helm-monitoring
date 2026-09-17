.PHONY : all

CACHE=
VERSION:=$(shell python -m version_query -i ../..)

nautobot :
		printf "%s" "${VERSION}"
		docker build ${CACHE} -t ghcr.io/edwardtheharris/helm-monitoring/nautobot/nautobot:${VERSION} --progress plain --push --target nautobot .
		touch nautobot

worker : nautobot
		docker build -t ghcr.io/edwardtheharris/helm-monitoring/nautobot/worker:$(VERSION)  --progress plain --push --target worker .
		touch worker

scheduler : worker
		docker build ${CACHE} -t ghcr.io/edwardtheharris/helm-monitoring/nautobot/scheduler:$(VERSION)  --progress plain --push --target scheduler .
		touch scheduler

clean:
		rm -fv nautobot worker scheduler

all: clean scheduler
