FROM alpine:latest

RUN apk add --no-cache gcc make musl-dev

WORKDIR /apps
COPY ./vinge ./vinge
COPY ./wosh ./wosh

WORKDIR /apps/vinge
RUN make && cp .build/vinge /usr/local/bin/vinge

WORKDIR /apps/wosh
RUN make && cp .build/wosh /usr/local/bin/wosh

RUN make

CMD ["/usr/local/bin/wosh"]
