#point to the correct configuration and webapp
CATALINA_BASE=`pwd`/site/target/cargo/configurations/tomcat7x
export CATALINA_BASE

#copy over the Heroku config files
cp ./site/heroku-server.xml ./site/target/cargo/configurations/tomcat7x/conf/server.xml

#make the Tomcat scripts executable
chmod a+x ./site/target/cargo/installs/apache-tomcat-7.0.29/apache-tomcat-7.0.29/bin/*.sh

#set the correct port and database settings
JAVA_OPTS="$JAVA_OPTS -Xmx512m -Xms512m -Dhttp.port=8080 -DDATABASE_URL=postgres://postgres:password@localhost/postgres/broadleaf"
export JAVA_OPTS

#start Tomcat
./site/target/cargo/installs/apache-tomcat-7.0.29/apache-tomcat-7.0.29/bin/catalina.sh run
