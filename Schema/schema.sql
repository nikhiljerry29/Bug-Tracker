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

/*CREATE OR REPLACE TRIGGER DEL_FLIGHT_TABLE
BEFORE DELETE ON FLIGHT FOR EACH ROW
BEGIN
	IF DELETING THEN
		INSERT INTO NON_FUNC_FLIGHT VALUES (:OLD.FLIGHT_NUMBER, :OLD.COMPANY_NAME, :OLD.SOURCE, :OLD.DESTINATION, :OLD.FARE, :OLD.TIME);
	END IF;
END;

tickets INT(10) NOT NULL UNIQUE
	priority VARCHAR(10) NOT NULL,
	bug_type VARCHAR(10),
	status VARCHAR(10),
	opened_on DATE,
	closed_on DATE,
*/
INSERT INTO Employee VALUES('A1', '', '');
INSERT INTO Employee VALUES('A2', '', '');


INSERT INTO Employee VALUES('M1','', 'A1');
INSERT INTO Employee VALUES('M2','', 'A1');
INSERT INTO Employee VALUES('M3','', 'A1');


INSERT INTO Employee VALUES('T1', 'M1', 'A1');
INSERT INTO Employee VALUES('T2', 'M1', 'A1');
INSERT INTO Employee VALUES('T3', 'M2', 'A1');
INSERT INTO Employee VALUES('T4', 'M2', 'A1');
INSERT INTO Employee VALUES('T5', 'M3', 'A1');


INSERT INTO Employee VALUES('D1', 'M1', 'A1');
INSERT INTO Employee VALUES('D2', 'M1', 'A1');
INSERT INTO Employee VALUES('D3', 'M2', 'A1');
INSERT INTO Employee VALUES('D4', 'M2', 'A1');
INSERT INTO Employee VALUES('D5', 'M3', 'A1');



