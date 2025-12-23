# moq-relay Docker Image

This repository provides a Docker image for [moq-relay](https://github.com/moq-dev/moq/tree/main/rs/moq-relay), a Media over QUIC (MoQ) relay server.

It is designed to easily deploy `moq-relay` in containerized environments. The image is automatically built and published to the GitHub Container Registry (GHCR) whenever a new version tag is pushed to this repository.

## Upstream Project

This project is a wrapper around the excellent work done by the [moq-dev](https://github.com/moq-dev) team.
*   **Upstream Repository:** [https://github.com/moq-dev/moq](https://github.com/moq-dev/moq)
*   **Crate:** [moq-relay](https://crates.io/crates/moq-relay)

## Usage

### Prerequisites

You need to have a `config.toml` file ready for `moq-relay`. Please refer to the [upstream documentation](https://github.com/moq-dev/moq) for configuration options.

### Running the Container

The container requires the configuration file to be mounted at `/app/config.toml`.

```bash
docker run -d \
  --name moq-relay \
  -p 443:443/udp \
  -p 443:443/tcp \
  -v $(pwd)/config.toml:/app/config.toml \
  ghcr.io/einrobin/moq-relay-docker:latest
```

### Ports

*   **443/udp**: QUIC traffic
*   **443/tcp**: HTTP/Websocket traffic

### Volumes

*   `/app`: The working directory where `config.toml` is expected.

## License

This project is licensed under either the MIT License or the Apache License 2.0, matching the upstream project. See [LICENSE-MIT](LICENSE-MIT) and [LICENSE-APACHE](LICENSE-APACHE) for details.
