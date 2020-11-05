# Local dev environment
## Composition
- simpleHelloWorkdWebApp
	- scripts
		- config (configfile to setup the tomcat server on the VM)
		- db-simplehelloworld.sql (for the creation of the db)
		- deploy-snapshot.sh (to run the server)
		- setup-tomcat.sh (for the installation of tomcat server)
	- src
		- src of the webapp
	- target
		- compiled webapp folder made by maven
	- simpleHelloWorldWebApp.testing.testng
		- folder of tests
	- webContent
		- static html page of the webapp
	- pom.xml
		- maven configuration with dependancies
	- Vagrantfile
		-configuration of the VM


## Prerequisites
1. Maven (v 3.6.2, or higher)
2. VirtualBox(v 6.0, or higher)
3. Vagrant (v 2.2.5, or higher)


## Guidelines

###1. Build binaries
- Type in a terminal at the project folder : mvn clean install
- Verification: 
	- The result has to be 'build success' and target folder should contain the .war file.

###2. Run environment
- Type in a terminal at the project folder : vagrant up
- Verification: 
	- type in a terminal : vagrant global-status
	- The dev-env-SimpleHelloWorldWebApp VM has to be in running state.

###3. Create the database
- Type in a terminal at the project folder :
	- vagrant ssh
	- mysql -u root -p  < /vagrant_scripts/db-simplehelloworld.sql
	- 12345678 (password set when the VM is created for root user - see Vagrantfile)
- Verification:
	- type in the VM :
		- mysql -u root -p
		- 12345678
		- SHOW DATABASES;
	- simpleHelloWorlddb has to be in the list of databases.

###4. Run server
- Type in the VM :
	- cd /vagrant_script/
	- sudo ./deploy-snapshot.sh
- Verification:
	- Try access to http://192.168.33.14:8080/. If you can see apache Tomcat welcome page, server is installed and running.

###5. Access web app
- Type in your favorite navigator : http://192.168.33.14:8080/simpleHelloWorldWebApp/
- Verification :
	- Try access to http://192.168.33.14:8080/manager/html/list. simpleHelloWorldWebApp has to be in running state. (default user and password : admin)
