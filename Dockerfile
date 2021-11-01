FROM alpine:latest

RUN apk add --no-cache \
  bash \
  python3 \
  pip3 \
  cloudinary-cli \
  ca-certificates \
  curl \
  jq

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]