FROM postgres:9.6


RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y wget git ca-certificates  && rm -rf /var/lib/apt/lists/*

ENV GO_VERSION=1.9.2.linux-amd64

RUN wget -P /tmp/ https://dl.google.com/go/go${GO_VERSION}.tar.gz && \
    tar -xvzf /tmp/go${GO_VERSION}.tar.gz -C /usr/local/ && \
    rm  /tmp/go${GO_VERSION}.tar.gz

ENV PATH=$PATH:/usr/local/go/bin
COPY . /stolon
RUN /stolon/build

RUN cp /stolon/bin/* /usr/local/bin/


CMD ['$@']