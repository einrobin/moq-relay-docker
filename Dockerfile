FROM rust:alpine AS builder

WORKDIR /app

# Install build dependencies
RUN apk add --no-cache build-base git

ARG VERSION
# Install moq-relay
RUN cargo install moq-relay --version ${VERSION}

FROM alpine:latest

WORKDIR /app

# Copy binary from builder
COPY --from=builder /usr/local/cargo/bin/moq-relay /usr/local/bin/moq-relay

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose ports
# QUIC uses UDP
EXPOSE 443/udp
# HTTP/Websocket uses TCP
EXPOSE 443/tcp

# Define volume for configuration
VOLUME ["/app"]

ENTRYPOINT ["/entrypoint.sh"]
