#!/bin/bash

imgrepo="registry.jxit.net.cn:5000"
confpath="src/main/resources/tangyuan-configuration.xml"

if [ -z "$BUILD_NUMBER" ]; then
  BUILD_NUMBER=$(git reflog | wc -l)
fi

git checkout $confpath

mvn package -Dmaven.test.skip=true

docker build . -t $imgrepo/jxit/jxoa:git-$BUILD_NUMBER

docker push $imgrepo/jxit/jxoa:git-$BUILD_NUMBER
