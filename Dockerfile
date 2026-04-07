FROM openjdk:25-ea-33-slim-bookworm

ARG PHOTON_VERSION
ENV PHOTON_VERSION=$PHOTON_VERSION

ARG PHOTON="photon-${PHOTON_VERSION}.jar"

RUN apt-get update && apt-get install -y wget pbzip2 tar curl zstd

WORKDIR /www

RUN wget --progress=dot:giga https://github.com/komoot/photon/releases/download/${PHOTON_VERSION}/photon-${PHOTON_VERSION}.jar -O app.jar

RUN wget --progress=dot:giga -O - https://download1.graphhopper.com/public/africa/northern-africa/photon-dump-northern-africa-1.0-latest.jsonl.zst \
    | zstd -d --stdout \
    | java -jar app.jar import -import-file -

ENTRYPOINT ["java", "-Xms2g", "-Xmx6g", "-jar", "app.jar", "serve", "-data-dir", "/www", "-cors-any", "-listen-ip", "0.0.0.0"]