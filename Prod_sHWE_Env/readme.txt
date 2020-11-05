# Pipeline environment
## Composition
- prod-server
	- playbook
		- roles
			-gitlab-runner
				-tasks
					-main.yml (installation of gitlab-runner)
		- playbook.yml (list each roles that install every needed component)
	- scripts
		- config (configuration of tomcat server)
			- context.xml
			- tomcat.service
			- tomcat-users.xml
		- deploy-snapshot.sh
		- setup-tomcat.sh
	- Vagrantfile
		-configuration of the VM


## Prerequisites
1. VirtualBox(v 6.0, or higher)
2. Vagrant (v 2.2.5, or higher)
3. Ansible (v 2.7.5, or higher)
4. The integration server is up and running.


## Guidelines

###1. Run the VM
- Type in a terminal at the project folder :> vagrant up
- Verification: 
	- The VM will run and install every component listed in the playbook. Your computer might be running out of RAM as mine at the last step when reconfiguring gitlab. If this appends just do this :
		> vagrant up
		> vagrant ssh
		> gitlab-ctl reconfigure
		> gitlab-ctl restart unicorn
  		> gitlab-ctl restart
  	- To check if every component is correctly installed on your VM connect to you VM with > vagrant ssh
  	and check the response of:
  		- gitlab-runner with: gitlab-runner --version
  		- Tomcat installation and configuration on a web browser : http://192.168.33.17:8080/
  			or go http://192.168.33.99:8080/manager (id and password: admin)

###2. Create the databae
1- Connect to the VM via ssh:> vagrant ssh
2- Run the following command:> mysql -u root -p  < /vagrant_scripts/db-simplehelloworld.sql
	(password : 12345678 (see vagrantfile))  	

###3. Configure the gitlab-runner
1- Access to "http://192.168.33.9/gitlab". And go to your project page. Copy your project registration token.
2- Connect to the stage VM via SSH:> vagrant ssh
3- Register the stage VM runner:
	> sudo gitlab-runner register
	> http://192.168.33.9/gitlab
	> YourProjectRegistrationToken
	> shell
	> prod-vm-shell
	> shell
	> sudo gitlab-runner restart
	> sudo gitlab-runner run
- Verifiation:
	- The runner as to be detected on runners page of your gitlab project.

###4. Deploy the web app on the stage vm
1. Copy add deploy-prod to stages in .gitlab-ci.yml file of your project and add this at the end of the file :
######
deploy-prod:
    stage: deploy-prod
    tags:
    - prod-vm-shell
    script:
    - rm -f /home/vagrant/stage/*.war
    - cp target/*.war /home/vagrant/stage
    - bash /vagrant_scripts/deploy-snapshot.sh
######
2. push the new .gitlab-ci.yml file to your gitlab project
3. See the execution of the pipeline at CI/CD page of the gitlab project.
4. If the pipeline has been exececuted without error the simpleHelloWorldWebApp should be available at : http://192.168.33.99:8080/simpleHelloWorldWebApp/




