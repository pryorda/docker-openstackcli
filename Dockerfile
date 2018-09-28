FROM alpine:latest

LABEL MAINTAINER="Daniel Pryor <daniel@pryorda.net>" 
LABEL DESCRIPTION="Provides openstack client" 
LABEL VERSION="0.1"

# Alpine-based installation
# #########################
RUN set -x ; apk add --no-cache \
  bash \
  python-dev \
  py-pip \
  py-setuptools \
  ca-certificates \
  gcc \
  musl-dev \
  linux-headers \
  libffi-dev \
  openssl \
  openssl-dev \
  && pip install --upgrade --no-cache-dir pip setuptools python-openstackclient \
  && apk del gcc musl-dev linux-headers libffi-dev openssl-dev\
  && rm -rf /var/cache/apk/* \
  && mkdir -p /openstack 

# Mount Scripts or RC files here
VOLUME ["/openstack"]

CMD [ "bash", "-c", "openstack" ]

