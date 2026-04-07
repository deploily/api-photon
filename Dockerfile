FROM eclipse-temurin:17-jre-noble

ARG VERSION="0.7.0"
ARG PHOTON="photon-${VERSION}.jar"
# FROM openjdk:${VERSION}

RUN apt-get update && apt-get install -y wget bzip2 tar curl pbzip2

WORKDIR /var/data/
RUN wget --progress=dot:giga -O - https://download1.graphhopper.com/public/extracts/by-country-code/dz/photon-db-dz-250720.tar.bz2 | pbzip2 -cd | tar x 

WORKDIR /www
RUN wget https://github.com/komoot/photon/releases/download/${VERSION}/photon-${VERSION}.jar -O app.jar

ENTRYPOINT [ "java", "-jar", "app.jar","-data-dir","/var/data","-cors-any"]