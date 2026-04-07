FROM eclipse-temurin:17-jre-noble

ARG PHOTON_VERSION
ENV PHOTON_VERSION=$PHOTON_VERSION

RUN apt-get update && apt-get install -y wget pbzip2 tar curl && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash photon

WORKDIR /var/data/
RUN wget --progress=dot:giga -O - https://download1.graphhopper.com/public/extracts/by-country-code/dz/photon-db-dz-250720.tar.bz2 | pbzip2 -cd | tar x && \
    chown -R photon:photon /var/data

WORKDIR /www
RUN wget --progress=dot:giga https://github.com/komoot/photon/releases/download/${PHOTON_VERSION}/photon-${PHOTON_VERSION}.jar -O app.jar && \
    chown -R photon:photon /www

COPY --chown=photon:photon entrypoint.sh /www/entrypoint.sh
RUN chmod +x /www/entrypoint.sh

USER photon

ENTRYPOINT ["/www/entrypoint.sh"]