DROP DATABASE IF EXISTS bugtracker;
CREATE DATABASE bugtracker; 
USE bugtracker;

CREATE TABLE bugtracker.user_details (
	id SERIAL,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    email_address VARCHAR(100),
    user_password VARCHAR(500),
    createdAt DATE,
	updatedAt DATE,
    PRIMARY KEY (id)
);

CREATE TABLE bugtracker.product_logs (
	id SERIAL,
	status VARCHAR(10),
	project_id VARCHAR(10),
	priority VARCHAR(10),
	closedOn DATE,
	createdAt DATE,
	updatedAt DATE,
	PRIMARY KEY (id)
);

INSERT INTO product_logs VALUES('1','Opened','PR1','High', NULL, '2021-01-21', '2021-01-22');
INSERT INTO product_logs VALUES('2','Closed','PR2','High','2020-11-27', '2020-10-27', '2020-11-27');
INSERT INTO product_logs VALUES('3','Closed','PR3','Low','2021-01-12', '2020-10-08', '2021-01-12');
INSERT INTO product_logs VALUES('5','Closed','PR12','Low',"2021-01-26", '2020-12-26', '2021-01-26');
INSERT INTO product_logs VALUES('6','Closed','PR13','High', SYSDATE(), '2020-12-26', '2021-01-26');

-- DROP TABLE  CASCADE;

-- Gig.update({ title : 'Looking for Android Developer' }, {
-- 		where: {
-- 			id: 1
-- 		}
-- });