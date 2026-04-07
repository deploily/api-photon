# api-photon
API Komoot photon fo geocoding

More efficent solution for geocoding than nominatim, allows autocomplete.

## Local test 

```bash
docker build --build-arg PHOTON_VERSION=1.0.1 -t photon-test .
docker run  --name photon-test -p 2322:2322 photon-test

curl http://localhost:2322/api?q=temouchent

docker container stop photon-test && docker container rm photon-test && docker image rm photon-test
```

# useful links

- [https://github.com/komoot/photon](https://github.com/komoot/photon)
