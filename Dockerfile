FROM debian:stretch

LABEL maintainer="Alexis Pereda <alexis@pereda.fr>"
LABEL version="1.0"
LABEL description="Docker with goaccess"

RUN apt update \
	&& apt install --no-install-recommends --no-install-suggests -y \
		ca-certificates gnupg wget

RUN echo>/etc/apt/sources.list.d/goaccess.list "deb http://deb.goaccess.io/ stretch main"
RUN wget -O- https://deb.goaccess.io/gnugpg.key|apt-key add -

RUN apt update \
	&& apt install --no-install-recommends --no-install-suggests -y \
		goaccess \
	&& rm -rf /var/lib/apt/lists/*
