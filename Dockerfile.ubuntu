FROM ubuntu:24.04
LABEL Author="cesar.ballardini@gmail.com"

# pgModeler version to use
ARG ARG_PGMODELER_VERSION=1.1.3
ENV PGMODELER_VERSION=$ARG_PGMODELER_VERSION

# Add universe repository
RUN apt-get update && apt-get install -y software-properties-common \
  && add-apt-repository universe

# Install dependencies
RUN BUILD_PKGS="qt6-base-dev libqt6svg6-dev qmake6 g++ build-essential libxml2-dev libpq-dev pkg-config cmake git" \
  && RUNTIME_PKGS="libqt6core6 libqt6svg6 qt6-tools-dev postgresql-server-dev-all qt6-base-dev libqt6svg6-dev libxext-dev" \
  && SECURITY_PKGS="ca-certificates" \
  && DEBIAN_FRONTEND=noninteractive \
  && apt-get update \
  && apt-get -y install --no-install-recommends ${BUILD_PKGS} ${RUNTIME_PKGS} ${SECURITY_PKGS}

ADD https://github.com/pgmodeler/pgmodeler/archive/v${PGMODELER_VERSION}.tar.gz /usr/local/src/ 
WORKDIR /usr/local/src/

# Compile pgmodeler
RUN tar xvzf v${PGMODELER_VERSION}.tar.gz \
  && cd pgmodeler-${PGMODELER_VERSION} \
  && mkdir -p /usr/local/lib/pgmodeler/plugins \
  && chmod 777 /usr/local/lib/pgmodeler/plugins \
  && qmake6 pgmodeler.pro \
  && make && make install

# Clean unnecessary packages
RUN apt-get remove --purge -y $BUILD_PKGS \
  && rm -rf /var/lib/apt/lists/*

# Run pgModeler
ENTRYPOINT ["/usr/local/bin/pgmodeler"]

