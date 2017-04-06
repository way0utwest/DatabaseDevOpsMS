# Syllabus

Database DevOps course for Microsoft. This is the high level module, level, and topic outline for the various parts of the course.

##Modules
At a high level, the modules are:
* Module 0 - Course Overview
* Module 1 - Introduction to Database DevOps  
* Module 2 - Including Database Code in a CI Process
* Module 3 - Automating the Deployment of Database Code
* Module 4 - Advanced Topics for Database DevOps
* Module 5 - Final Exam

Each of the modules is discussed in more detail below, with the lesson and topic sections produced

## Course Overview
* Intro 
	* Course overview
	* Author Introduction
	* Structure and format of course
* Lab requirements and setup

## Introduction to Database DevOps  
This module is a short introduction to DevOps and then a series of sections on the challenges of databases specific to the various implementations of DevOps ideas.

* Lesson 1 - What is DevOps?
	* Topic - Basic description from Donovan Brown
	* Topic - Quick overview of Three Ways
	* Topic - References to other resources and courses from MS
* Lesson 2 - Challenges for databases 
	* Topic - Databases need to maintain state
	* Topic - Code structure is cumbersome
	* Topic - Reference data and config data
	* Topic - Test data (in dev and other pre-Production environments) 
	* Topic - The DBA (unfamiliar with tools, change) 
	* Topic - Dependencies (within database and across databases) 
	* Topic - Multiple applications accessing the same db 
	* Topic - Database drift (aka – Hot fixes directly to Prod) 
	* Topic - Recovering from releases (rollback vs roll forward) 
* Lesson 3 - Database Development options
	* Topic- Two types of development
		* State based 
		* Migrations based 
	* Topic - What is state based development approach?
		* DEMO * State based approach
	* Topic - What is a migrations based development approach
	* Topic - Comparison of the two approaches
* Lesson 4 - Better collaboration between developers and DBAs
	* Topic - The challenges in many organizations 
	* Topic - Advantages of a common approach
	* Topic - Disadvantages of collaboration
 
## Module 2 - Including your database in development practices
* Lesson 1 - Database Code and Version Control
	* Topic - The cumbersome nature of database code
	* Topic - Tooling challenges
		* lack of tooling
		* code is stored in the database
	* Topic - The VCS Structure decisions
	* Topic Storing database code with app or without?
	* Topic - Organizing code the code elements
	* Topic - The contents of code versions
		* store the create or alter code
* Lesson 2 - Storing database code in a VCS
	* Topic Three options (manual, scripting, tooling)
	* Topic - Using manual scripting and issues
	* Topic - calling scripting features to produce code
		* pros/cons here
	* Topic - Source controlling your database migration scripts
		* DEMO
	* Topic - source controlling your state schema 
		* Demo Redgate
	* Topic - Tracking lookup or Reference data 
	* Topic - Tracking environment specific data
* Lesson 3 - Including your database in Continuous Integration  
	* Topic - What does the build process include?
	* Topic - How to "build" database code
		* DEMO - VSTS
	* Topic - Adding testing of your code
	* Topic - What is the database build output
	* Topic - packaging changes for upgrades
		* DEMO * CI process in Azure (VSTS)
* Lesson 4 - Continuous unit testing for database code (high level – this could be a class in itself, which we could produce) 
	* Topic - overview of testing database code
	* Topic - frameworks available
	* Topic - test data generation
	* Topic - Simple database code tests
		DEMO * write two tests
	* Topic - Test exceptions


## Module 3 - Release Management and the database
This section examines the CD portion of database development.
* Lesson 1 - Release Management overview
	* Topic - What is release management and why?
	* Topic - Why does this help with database deployment? (risk)
	* Topic - Repeatable Deployments allow practice
* Lesson 2 - Building a Release package
	* Topic - What is a release package?
	* Topic - Deploying the package for State based development
	* Topic - Deploying the package for migration based deployment
	* Topic - pre/post scripts
	* Topic - Using variables for environment specific changes
	* Deferring and scheduling deployments
	* Topic - Accounting for production drift
* Lesson 3 - Adding Gates and Approvals
	* Topic - What is a release gate?
	* Topic - What approvals do we want?
	* Topic - Automated v manual approvals
	* Topic - Adding approvals to a release
	* Topic - Notifications and logging
* Lesson 4 - Validating Deployments
	* Topic - Why validation is important?
	* Topic - Smoke tests
	* Topic - Rolling back deployments
	* Topic - Rolling back code changes
	* Topic - Rolling back table/data changes
	* Topic - Security and other changes
* Lesson 5 - Deploying Infrastructure Changes
	* Topic - Deploying changes outside the database
	* Topic - Handling configuration changes
	* Topic - Deploying new systems
	* Topic - Building Habits (getting the Ops side to use DevOps)

## Module 4 - Advanced topics 
* Lesson - Monitoring Databases
	* Topic - Understanding how releases impact database servers and performance 
	* Topic - Monitoring performance
	* Topic - Monitoring object usage
	* Topic - Monitor business metrics
	* Topic - Providing feedback to others
* Lesson - Branching and Merging Database Code
	* Topic - What is branching
	* Topic - The challenges of branching SQL code
	* Topic - Using the gitflow strategy for databases
	* Topic - Merging SQL code
	* Topic - Handling NoSQL code
* Lesson - Provisioning Environments
	* Topic - why and what
	* Topic - consistency for developers
	* Topic - dealing with data
	* Topic - vms, instances, and containers
* Lesson - Best Practices
	* Topic - intro to bp
	* Topic - What is dark launching
	* Topic - Database techniques for dark launching
	* Topic - Using abstractions (views)
	* Topic - Error handling
	* Topic - Cleaning up technical debt
		* database refactoring
		* scheduling code cleanup
* Lesson - Difficult Customer Database Scenarios
	* Topic - There are complex scenarios for multiple databases
	* Topic - Cross database dependencies
	* Topic - Upgrading multiple versions
	* Topic 

## Module 5 - Final Exam
* Lesson - The final exam
	* Topic - Exam questions