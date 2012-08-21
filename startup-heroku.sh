# point to the correct configuration and webapp
CATALINA_BASE=`pwd`/site/target/cargo/configurations/tomcat7x
export CATALINA_BASE

#move the admin application to the tomcat deploy
mv ./admin/target/admin.war $CATALINA_BASE/webapps

#remove the extraneous webapps that we don't need
rm -rf $CATALINA_BASE/webapps/cargocpc*
rm -rf $CATALINA_BASE/host-manager
rm -rf $CATALINA_BASE/manager

#copy over the Heroku config files
cp ./site/heroku-server.xml $CATALINA_BASE/conf/server.xml

#make the Tomcat scripts executable
chmod a+x ./site/target/cargo/installs/apache-tomcat-7.0.29/apache-tomcat-7.0.29/bin/*.sh

#set the correct port and database settings
JAVA_OPTS="$JAVA_OPTS -XX:MaxPermSize=256M -Xmx256M -Dhttp.port=$PORT -DDATABASE_URL=$DATABASE_URL"
export JAVA_OPTS

#start Tomcat
./site/target/cargo/installs/apache-tomcat-7.0.29/apache-tomcat-7.0.29/bin/catalina.sh run
