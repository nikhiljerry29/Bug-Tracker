CREATE TABLE Bug_Log_Table(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	tickets INT NOT NULL,
    priority VARCHAR(10) NOT NULL,
    bug_type VARCHAR(20),
    status VARCHAR(10),
    opened_on DATE,
    closed_on DATE,
    log_date_time DATETIME,
    log_status VARCHAR(10),
    PRIMARY KEY(id)
);

/*FOR TESTING DELETE TRIGGERS*/
/*DELETE FROM Bugs 
	WHERE tickets = '2';
*/


/*
UPDATE Bugs SET priority = 'Medium' 
	WHERE tickets = '2';
*/