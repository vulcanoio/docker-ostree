FROM debian:jessie

RUN apt-get update \
	&& apt-get install -y  \
		autoconf \
		bison \
		build-essential \
		e2fslibs-dev \
		git \
		gtk-doc-tools \
		libarchive-dev \
		libattr1-dev \
		libcap-dev \
		libfuse-dev \
		libgirepository1.0-dev \
		libglib2.0-dev \
		libgpgme11-dev \
		liblzma-dev \
		libsoup2.4-dev \
		libsystemd-journal-dev \
		man

WORKDIR /usr/src/

ENV LIBGSYSTEM_VERSION v2015.1
RUN git clone git://git.gnome.org/libgsystem \
	&& cd libgsystem \
	&& git checkout $LIBGSYSTEM_VERSION \
	&& ./autogen.sh --prefix=/usr \
	&& make -j $(nproc) \
	&& make install

ENV OSTREE_VERSION v2016.3
RUN git clone git://git.gnome.org/ostree \
	&& cd ostree \
	&& git checkout $OSTREE_VERSION \
	&& ./autogen.sh --prefix=/usr --enable-gtk-doc \
	&& make -j $(nproc) \
	&& make install
