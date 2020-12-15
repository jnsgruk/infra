FROM alpine:latest
ENV TAG=v1.0.3
RUN cd /usr/local/bin && \
  wget -qO - https://github.com/w4/bin/releases/download/$TAG/bin-$TAG-x86_64-unknown-linux-musl.tar.gz | tar xvz
RUN adduser --system --uid 8000 --disabled-password --no-create-home binuser
USER binuser
EXPOSE 8000
ENTRYPOINT ["/usr/local/bin/bin"]