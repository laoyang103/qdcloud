mvn install:install-file -Dfile=lib/tangyuan-0.9.0.jar -DgroupId=org.xson -DartifactId=tangyuan -Dversion=0.9.0 -Dpackaging=jar
mvn install:install-file -Dfile=lib/rpc-util-1.0.jar -DgroupId=cn.gatherlife -DartifactId=rpc-util -Dversion=1.0 -Dpackaging=jar
mvn install:install-file -Dfile=lib/patchca-0.5.0-SNAPSHOT.jar -DgroupId=net.pusuo -DartifactId=patchca -Dversion=0.5.0-SNAPSHOT -Dpackaging=jar
mvn install:install-file -Dfile=lib/common-object-0.0.1-SNAPSHOT.jar -DgroupId=org.xson -DartifactId=common-object -Dversion=0.0.1-SNAPSHOT -Dpackaging=jar
mvn package -Dmaven.test.skip=true; killall java -9; rm /opt/tomcat8/webapps/ROOT* -rf; cp target/laboratory_demo.war /opt/tomcat8/webapps/ROOT.war; /opt/tomcat8/bin/startup.sh
