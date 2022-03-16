FROM rust:1-slim AS builder
ARG TAG="v2.0.0"

RUN apt-get update && \
    apt-get install -y libclang-dev git && \
    git clone -b "$TAG" https://github.com/w4/bin /tmp/bin

WORKDIR /tmp/bin

RUN cargo build --release && \
    chown nobody:nogroup /tmp/bin/target/release/bin

FROM debian:bullseye-slim
COPY --from=builder /tmp/bin/target/release/bin /pastebin
USER nobody
EXPOSE 8000
ENTRYPOINT ["/pastebin", "0.0.0.0:8000"]