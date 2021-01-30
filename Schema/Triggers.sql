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
DELIMITER //
CREATE TRIGGER tr_forDelete AFTER DELETE ON Bugs 
	FOR EACH ROW 
		BEGIN
			SET @dt = NOW();
			INSERT INTO bug_log_table VALUES(0,
									OLD.tickets,
									OLD.priority,
                                    OLD.bug_type,
                                    OLD.status,
                                    OLD.opened_on,
                                    OLD.closed_on,
                                    @dt, 
                                    'DELETED');
		END//
DELIMITER ;

/*For testing DELETE TRIGGER*/
/*DELETE FROM Bugs 
	WHERE tickets = '2';
*/

DELIMITER //
CREATE TRIGGER tr_forUpdate AFTER UPDATE ON Bugs 
	FOR EACH ROW 
		BEGIN
			SET @dt = NOW();
			INSERT INTO bug_log_table VALUES(0,
									OLD.tickets,
									OLD.priority,
                                    OLD.bug_type,
                                    OLD.status,
                                    OLD.opened_on,
                                    OLD.closed_on,
                                    @dt, 
                                    'UPDATED');
		END//
DELIMITER ;


/*For testing UPDATE TRIGGER*/
/*UPDATE Bugs SET status = 'Closed' 
	WHERE tickets = '1';
*/