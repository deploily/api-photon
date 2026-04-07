FROM openjdk:17-ea-33-slim-buster

ARG PHOTON_VERSION
ENV PHOTON_VERSION=$PHOTON_VERSION

ARG PHOTON="photon-${PHOTON_VERSION}.jar"

RUN apt-get update && apt-get install -y wget bzip2 tar curl

WORKDIR /var/data/
RUN wget https://download1.graphhopper.com/public/extracts/by-country-code/dz/photon-db-dz-latest.tar.bz2

RUN tar -xf  photon-db-dz-latest.tar.bz2 
RUN rm photon-db-dz-latest.tar.bz2

WORKDIR /www
RUN wget https://github.com/komoot/photon/releases/download/${PHOTON_VERSION}/photon-${PHOTON_VERSION}.jar -O app.jar

ENTRYPOINT [ "java", "-jar", "app.jar","-data-dir","/var/data","-cors-any"]