FROM debian:stretch

LABEL maintainer="Alexis Pereda <alexis@pereda.fr>"
LABEL version="1.0"
LABEL description="Docker with goaccess"

RUN apt update \
	&& apt install --no-install-recommends --no-install-suggests -y \
		gcc make libncurses5-dev libncursesw5-dev libmaxminddb-dev \
	&& rm -rf /var/lib/apt/lists/*

COPY ./goaccess-1.2 /opt/goaccess-1.2

WORKDIR /opt/goaccess-1.2

RUN ./configure --enable-utf8 --enable-geoip=mmdb
RUN make
RUN make install

WORKDIR /

RUN apt purge -y gcc make
RUN apt autoremove -y
