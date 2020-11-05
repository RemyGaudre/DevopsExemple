# Pipeline environment
## Composition
- integration-server
	- playbook
		- roles
			-docker
				-tasks
					-main.yml (installation of docker)
			-gitlab
				-default
					main.yml (define variables for the installation)
				-tasks
					main.yml (installation of gitlab)
				-handlers
					main.yml (handlers to reconfigure gitlab)
				-templates
					mygitlab.rb.j2 (to change settings of gitlab)
			-gitlab-runner
				-tasks
					-main.yml (installation of gitlab-runner)
			-nmap
				-tasks
					main.yml (installation of nmap)
		- playbook.yml (list each roles that install every needed component)
	- Vagrantfile
		-configuration of the VM


## Prerequisites
1. VirtualBox(v 6.0, or higher)
2. Vagrant (v 2.2.5, or higher)
3. Ansible (v 2.7.5, or higher)


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
  		- Docker with > docker --version
  		- gitlab with accessing to: "http://192.168.33.9/gitlab"
  		- gitlab-runner with: gitlab-runner --version
  		- nmap with: nmap --version
  	

###2. Configure gitlab
- Access to "http://192.168.33.9/gitlab". It will ask you the password for root user at first. And please create your user after.
- Verification: 
	- You have to be connected
