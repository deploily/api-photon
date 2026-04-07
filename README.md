# api-photon
API Komoot photon fo geocoding

More efficent solution for geocoding than nominatim, allows autocomplete.

## Local test 

```bash
docker build --build-arg PHOTON_VERSION=1.0.1 -t photon-test .
docker run -e JAVA_TOOL_OPTIONS="-Xms2g -Xmx8g" --name photon-test -p 2322:2322 photon-test

curl http://localhost:2322/api?q=temouchent

docker container stop photon-test && docker container rm photon-test && docker image rm photon-test
```

For debugging, replace the entrypoint with `ENTRYPOINT ["sleep", "infinity"]`
```bash
docker run --name photon-test -p 2322:2322 photon-test
# In another terminal run
docker container exec -it photon-test bash
java -Xms2g -Xmx8g -jar app.jar serve -data-dir /www -cors-any -listen-ip 0.0.0.0
```

# useful links

- [https://github.com/komoot/photon](https://github.com/komoot/photon)
- [https://download1.graphhopper.com/public/index.html](https://download1.graphhopper.com/public/index.html)
