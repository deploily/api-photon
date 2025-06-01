# api-photon
API Komoot photon fo geocoding

More efficent solution for geocoding than nominatim, allows autocomplete.

## Local test 

```bash
docker build -t photon-test .
docker run  --name photon-test -p 2322:2322 photon-test
curl http://localhost:2322/api?q=temouchent
docker container rm  photon-test
```

# useful links

- [https://github.com/komoot/photon](https://github.com/komoot/photon)
