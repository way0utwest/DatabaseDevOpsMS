# Syllabus

The main syllabus I'm working from

## Length
12 hours to complete
6 hour of lecture
6 hours reading/lab

## Outline
* Introduction to Database DevOps  
	* Intro 
		* Course overview
		* Structure and format.
	* What is DevOps?
		* Basic description
		* refer to other resources and courses from MS
	* Challenges for database DevOps 
		* 	Code Structure
		* Integrity and security of Production data 
		* Production data vs reference data v config data
		* Test data (in dev and other pre*Production environments) 
		* The DBA (unfamiliar with tools, change) 
		* Environment differences 
		* Dependencies (within database and across databases) 
		* Multiple applications accessing the same db 
		* Database drift (aka – Hot fixes directly to Prod) 
		* Maintaining backwards compatibility 
		* Recovering from releases (rollback vs roll forward) 
	* Options for Database Development
		* ORM 
		* State*based 
		* Migrations*based 
	* State vs Migrations Pros and Cons * Hybrid Solution 
		* What is state based development approach?
			* DEMO * State based approach
		* 	What is a migrations based development approach
		* 	Comparison of the two approaches
	* Better collaboration between developers and DBAs
		* 	Challenges in many organizations
		* 	Advantages of a common approach
		* Disadvantages of collaboration
	* 	DEMO * Overall process in place. Make change to table, add data, deploy to multiple environments.
 
*	Including your database in development practices
	* The challenges of putting database code in a VCS
		* lack of tooling
		* code is stored in the database
	* Source controlling your database 
		* Migration scripts 
			* DEMO
		* Schema 
			* Demo * SOC
		* Lookup or Reference data 
	* Including your database in Continuous Integration  
		* the build process
		* packaging changes for upgrades
		* DEMO * CI process in Azure (VSTS)
	* Continuous unit testing for database code (high level – this could be a class in itself, which we could produce) 
		* overview of testing database code
		* frameworks available
		* test data generation
		* DEMO * write two tests


*	Release Management and the database
	* What is release management and why is it necessary? 
	* Releasing your database in non-Production and Production environments
		* Deploying Intermediate Environments for testing
			* DEMO release process in VSTS
		* Staging environments
			* Add a step to restore or copy a prod db
			* DEMO * Add a step
		* Manual review steps for Production (comparison report, preview script, review warnings) 
			* DEMO * Add a step for an approver
	* Validating deployments 
		* Post deploy
	* Application requirements outside of the database code
		* Most of the server configuration is standardized, but there are some items that aren't
			* configuration
			* data
		* Managing server configuration and build
			* teaching DBAs to use VCS for their setup
			* use unattended installation 
			* Chef/Puppet	
		* Dealing with database drift 
	* Additional database testing 
		* Integration testing 
		* Smoke testing
	* Recovering when things go wrong 
		* Importance of backups 
		* Rolling forward 

	 
*	Advanced topics 
	* Monitoring databases after releasing 
	* Understanding how releases impact database servers and performance 
	* Branching and merging database changes 
		* develop using branches
		* merges for db code
		* Git and pull requests
		* DEMO * develop in a branch, issue PR, merge, resolve conflicts.
	* 	Monitoring the database after release
		* tracking deployments in your monitoring tool
		* adding custom instrumentation
	* Provisioning dev and test environments
		* Quick refreshes of environments needed, esp for CI.
	* Dealing with differences across environments or customer sites 
		* User permissions and roles 
		* Customize releases per customer site (SQLCMD variables) 
		