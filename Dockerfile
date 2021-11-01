FROM alpine:latest

RUN apk add --no-cache \
  bash \
  python3 \
  py3-pip \
  ca-certificates \
  curl \
  jq

RUN pip3 install cloudinary-cli

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]