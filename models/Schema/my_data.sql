
INSERT INTO Employee VALUES('A1', '', '');
INSERT INTO Employee VALUES('A2', '', '');


INSERT INTO Employee VALUES('M1','', 'A1');
INSERT INTO Employee VALUES('M2','', 'A1');
INSERT INTO Employee VALUES('M3','', 'A1');

/* EMPLOYEE TABLE*/
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

/* EMPLOYEE ROLE*/
INSERT INTO Employee_Role VALUES('A1', 'admin');
INSERT INTO Employee_Role VALUES('A2', 'admin');

INSERT INTO Employee_Role VALUES('M1', 'manager');
INSERT INTO Employee_Role VALUES('M2', 'manager');
INSERT INTO Employee_Role VALUES('M3', 'manager');

INSERT INTO Employee_Role VALUES('T1', 'tester');
INSERT INTO Employee_Role VALUES('T2', 'tester');
INSERT INTO Employee_Role VALUES('T3', 'tester');
INSERT INTO Employee_Role VALUES('T4', 'tester');
INSERT INTO Employee_Role VALUES('T5', 'tester');

INSERT INTO Employee_Role VALUES('D1', 'developer');
INSERT INTO Employee_Role VALUES('D2', 'developer');
INSERT INTO Employee_Role VALUES('D3', 'developer');
INSERT INTO Employee_Role VALUES('D4', 'developer');
INSERT INTO Employee_Role VALUES('D5', 'developer');

/*PEROSNAL DATA*/
INSERT INTO Employee_Personal_Details VALUES('A1', 'Ankit', 'Dedhia', 'dedhiaankit18@gmail.com');
INSERT INTO Employee_Personal_Details VALUES('A2', 'Nikhil', 'Gupta', 'nikhil.gupta5667@gmail.com');

INSERT INTO Employee_Personal_Details VALUES('M1', 'Rohan', 'Desai', 'rohandesai@gmail.com');
INSERT INTO Employee_Personal_Details VALUES('M2', 'Karan', 'Patel', 'karanPatel@gmail.com');
INSERT INTO Employee_Personal_Details VALUES('M3', 'Urmila', 'Shah', 'urmilashah@gmail.com');

INSERT INTO Employee_Personal_Details VALUES('T1', 'AJ', 'Roy', 'ajroy@gmail.com');
INSERT INTO Employee_Personal_Details VALUES('T2', 'Piyush', 'Sharma', 'dedhiaankit18@gmail.com');
INSERT INTO Employee_Personal_Details VALUES('T3', 'Amlesh', 'Prusty', 'amleshprusty@gmail.com');
INSERT INTO Employee_Personal_Details VALUES('T4', 'Gaurav', 'Kundra', 'gauravkundra.com');
INSERT INTO Employee_Personal_Details VALUES('T5', 'Raj', 'Singh', 'rajsingh@gmail.com');

INSERT INTO Employee_Personal_Details VALUES('D1', 'Mahesh', 'Mai', 'maheshmai@gmail.com');
INSERT INTO Employee_Personal_Details VALUES('D2', 'Ishaan', 'Desai', 'ishaandesai@gmail.com');
INSERT INTO Employee_Personal_Details VALUES('D3', 'Rohan', 'Rajput', 'rohanrajput@gmail.com');
INSERT INTO Employee_Personal_Details VALUES('D4', 'Prety', 'Prakash', 'pretyprakash@gmail.com');
INSERT INTO Employee_Personal_Details VALUES('D5', 'Gajraj', 'Singh', 'gajrajsingh@gmail.com');


/*BUGS*/
INSERT INTO Bugs VALUES ('1', 'High', 'Functional', 'Open', '2021-01-01', null);
INSERT INTO Bugs VALUES ('2', 'Low', 'UI-based', 'Open', '2021-01-02', null);


/*Products*/
INSERT INTO Products VALUES ('Prod1', 'Bug Tracker', 'This is a Test Project', 'M1', 'D1', 'T1', '1');


