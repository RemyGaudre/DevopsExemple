#!/bin/bash


# Define Tomcat's variables
APACHE_HOME=/opt/tomcat
APACHE_BIN=$APACHE_HOME/bin
APACHE_WEBAPPS=$APACHE_HOME/webapps

# Define product's variables
PRODUCT_SNAPSHOT_NAME=simpleHelloWorldWebApp-0.0.1-SNAPSHOT.war
RESOURCE_NAME=simpleHelloWorldWebApp.war

# Shutdown Tomcat
sh $APACHE_BIN/shutdown.sh
echo "server down"


# Deploy generated SNAPSHOT into the dev-env  
rm -f $APACHE_WEBAPPS/$RESOURCE_NAME
cp /home/vagrant/stage/$PRODUCT_SNAPSHOT_NAME $APACHE_WEBAPPS
cd $APACHE_WEBAPPS

#mkdir $RESOURCE_NAME
#cp $PRODUCT_SNAPSHOT_NAME $RESOURCE_NAME
mv $PRODUCT_SNAPSHOT_NAME $RESOURCE_NAME
chown tomcat:tomcat $RESOURCE_NAME
#rm $PRODUCT_SNAPSHOT_NAME
#cd $RESOURCE_NAME
#sudo jar -xvf $PRODUCT_SNAPSHOT_NAME.war

# Start up Tomcat
sh $APACHE_BIN/startup.sh
