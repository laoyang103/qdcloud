#!/bin/bash

imgrepo="registry.jxit.net.cn:5000"
confpath="/opt/tomcat8/webapps/R00T/WEB-INF/classes/tangyuan-configuration.xml"

git checkout $confpath

mvn package -Dmaven.test.skip=true

docker build . -t $imgrepo/jxit/jxoa:git-$BUILD_NUMBER

docker push $imgrepo/jxit/jxoa:git-$BUILD_NUMBER
