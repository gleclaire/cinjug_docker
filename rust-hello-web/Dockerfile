FROM rust:1.54-slim as builder
WORKDIR /usr/src/myapp
COPY . .
RUN cargo install --path .

FROM debian:buster-slim

RUN apt-get update -y && \
	apt-get install -y curl && \
	apt-get clean -y

WORKDIR /usr/local/bin

COPY --from=builder /usr/local/cargo/bin/rust-hello-web /usr/local/bin/rust-hello-web

EXPOSE 3000

CMD ["/usr/local/bin/rust-hello-web"]
