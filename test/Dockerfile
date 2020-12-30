FROM debian:buster-slim

RUN apt update \
 && apt-get install -y parallel git ash \
 && mkdir -p ~/.parallel && touch ~/.parallel/will-cite \
 && git clone https://github.com/bats-core/bats-core.git /opt/bats \
 && ln -s /opt/bats/bin/bats /bin/bats

WORKDIR /code/

ENTRYPOINT ["bash", "bats"]

