# registry

Docker private registry https://github.com/distribution/distribution, documents https://docs.docker.com/registry

## Create Account

```shell
sh account.sh admin Admin@69
```

Output:

```
Created: admin:$2y$05$Srsz08VZpkZC8Uvnk3a36OcP39di/scwPqDc29KrCZGDg1XnyH1c.
```

## Run

```shell
docker compose up
```

Host: [http://localhost:5000](http://localhost:5000)

## Login

```shell
docker login {DOMAIN_NAME} -u {USERNAME}

> password: 
Login Succeeded
```

Ex:

```shell
docker login localhost:5000 -u admin
```

## Logout

```shell
docker logout {DOMAIN_NAME}
```

Ex:

```shell
docker logout localhost:5000
```

## Images

[http://localhost:5000/v2/_catalog](http://localhost:5000/v2/_catalog)

## Test Push Image

- Tag image

```
docker image tag {OLD_NAME:TAG} {DOMAIN_NAME}/{NEW_NAME:TAG}
```

Ex:

```shell
docker image tag prongbang/wiremock:latest localhost:5000/prongbang/wiremock:2.3.3
```

- Push

```shell
docker image push {DOMAIN_NAME}/{NEW_NAME:TAG}
```

Ex:

```shell
docker image push localhost:5000/prongbang/wiremock:2.3.3
```

Output:

```
The push refers to repository [localhost:5000/prongbang/wiremock]
417afcbc9712: Pushed
2.3.3: digest: sha256:6fd4eacba3ea6728eeea3177af84d6a5834c671b6f2585cad4b47098f613d4cc size: 528
```

## View images

```shell
curl -u admin:Admin@69 http://localhost:5000/v2/_catalog
```

Output:

```
{"repositories":["prongbang/wiremock"]}
```

## Pull Image

```shell
docker image pull localhost:5000/prongbang/wiremock:2.3.3
```

## View Tag Image 

```
http://localhost:5000/v2/{IMAGE_NAME}/tags/list
```

Ex:

```shell
http://localhost:5000/v2/prongbang/wiremock/tags/list
```

Output:

```
{"name":"prongbang/wiremock","tags":["2.3.3"]}
```

## Delete Image

```
curl admin:Admin@69 -X DELETE http://localhost:5000/v2/{IMAGE_NAME}/manifests/{DIGEST}
```

