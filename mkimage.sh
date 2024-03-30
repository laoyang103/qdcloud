#!/bin/bash

imgrepo="registry.jxit.net.cn:5000"
confpath="src/main/resources/tangyuan-configuration.xml"

git checkout $confpath

mvn package -Dmaven.test.skip=true

docker build . -t $imgrepo/jxit/jxoa:git-$BUILD_NUMBER --no-cache

docker push $imgrepo/jxit/jxoa:git-$BUILD_NUMBER
