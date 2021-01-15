CREATE TABLE EMPLOYEE{
	employee_id VARCHAR(10) NOT NULL UNIQUE,
	first_name CHAR(20),
	last_name CHAR(20),
	email_id VARCHAR(20),
	PRIMARY KEY(employee_id)
};


CREATE TABLE EMPLOYEE_PERSONAL_DETAILS{
	employee_id VARCHAR(10) NOT NULL UNIQUE,
	password VARCHAR(10),
	email_id VARCHAR(20),
	mobile_number INT(10),
	PRIMARY KEY(employee_id)
	--address feild, aadhar number, etc details could be included later.
};

CREATE TABLE BUGS{
	tickets INT(10) NOT NULL UNIQUE
	priority VARCHAR(10),
	bug_type VARCHAR(10),
	status VARCHAR(10),
	opened_on DATE,
	closed_on DATE,

	PRIMARY KEY(tickets)
};

CREATE TABLE PRODUCT{
	project_id INT(10) NOT NULL UNIQUE ,
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
};

 