DROP DATABASE IF EXISTS `BUGTRACKER`;
CREATE DATABASE `BUGTRACKER`; 
USE `BUGTRACKER`;

CREATE TABLE Employee(
	employee_id VARCHAR(10) NOT NULL UNIQUE,
	manager_id VARCHAR(10),
	admin_id VARCHAR(10), 
	PRIMARY KEY(employee_id)
);

CREATE TABLE Employee_Role(
	employee_id VARCHAR(10) NOT NULL UNIQUE,
	role VARCHAR(10),
	PRIMARY KEY (employee_id)
);

CREATE TABLE Employee_Personal_Details(
	employee_id VARCHAR(10) NOT NULL UNIQUE,
	first_name CHAR(20),
	last_name CHAR(20),
	email_id VARCHAR(20),
	PRIMARY KEY(employee_id)
);

ALTER TABLE Employee_Personal_Details MODIFY email_id VARCHAR(100);

CREATE TABLE Employee_Password(
	employee_id VARCHAR(10) NOT NULL UNIQUE,
	password VARCHAR(10) NOT NULL UNIQUE,
	PRIMARY KEY(employee_id)
);


CREATE TABLE Bugs(
	tickets INT(10) NOT NULL UNIQUE,
	priority VARCHAR(10) NOT NULL,
	bug_type VARCHAR(10),
	status VARCHAR(10),
	opened_on DATE,
	closed_on DATE,
	PRIMARY KEY(tickets)
);

CREATE TABLE Products(
	project_id VARCHAR(10) NOT NULL UNIQUE ,
	project_name VARCHAR(20) NOT NULL,
	project_description CHAR(100),
	manager_id VARCHAR(10) NOT NULL,
	developer_id VARCHAR(10) NOT NULL,
	tester_id VARCHAR(10),
	tickets INT(10),

	PRIMARY KEY(project_id),
	FOREIGN KEY (manager_id) REFERENCES EMPLOYEE(employee_id),
	FOREIGN KEY (developer_id) REFERENCES EMPLOYEE(employee_id),
	FOREIGN KEY (tester_id) REFERENCES EMPLOYEE(employee_id),
	FOREIGN KEY (tickets) REFERENCES BUGS(tickets)
);


