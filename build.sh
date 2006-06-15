JAVA_HOME=/usr/java/jdk
export JAVA_HOME
ant -buildfile $1
cp -R /var/www/html/integration/staffsite/current/config/* /var/www/html/integration/staffsite/current/web
