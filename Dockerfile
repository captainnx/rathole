FROM alpine:3.12.0 AS temp

ARG TARGETPLATFORM
ARG VERSION
WORKDIR /tmp
RUN apk --no-cache add curl unzip
RUN echo $TARGETPLATFORM
RUN case "$TARGETPLATFORM" in \
  "linux/arm64") ARCH=aarch64-unknown-linux-musl ;; \
  "linux/amd64") ARCH=x86_64-unknown-linux-musl ;; \
  *) exit 1 ;; \
  esac && \
  URL=https://github.com/rapiz1/rathole/releases/download/v${VERSION}/rathole-${ARCH}.zip && \
  echo $URL && \
  curl -L $URL -o rathole.zip && \
  unzip rathole.zip

FROM alpine:3.12.0
WORKDIR /app
COPY --from=temp /tmp/rathole .
USER 1000:1000
ENTRYPOINT ["./rathole"]
