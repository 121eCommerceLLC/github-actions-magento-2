How to publish an image on Docker Hub.

Go to folder `<repository>/php-compatibility/docker`

Build an image from a Dockerfile:
```shell
docker build --platform linux/amd64 . < Dockerfile
```

Find the Image ID, usually it is the first in the list:
```shell
docker images
```

Add a tag:
```shell
docker tag <IMAGE ID> dmitryfurs/github-action-magento-php-compatibility:latest
```

Push to Docker Hub:
```shell
docker push dmitryfurs/github-action-magento-php-compatibility:latest
```

Check the published image:
https://hub.docker.com/repository/docker/dmitryfurs/github-action-magento-php-compatibility/tags
