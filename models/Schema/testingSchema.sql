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
    issue_name VARCHAR(100),
    issue_description VARCHAR(1000),
	priority VARCHAR(10),
	closedOn DATE,
	createdAt DATE,
	updatedAt DATE,
	PRIMARY KEY (id)
);

INSERT INTO bugtracker.product_logs VALUES('1','Opened','1','Integration Failure', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut sodales orci. Vivamus nibh purus, aliquet eget sem et, consectetur malesuada dolor. Nam aliquam pharetra massa, vel dapibus mauris tincidunt et. Nulla eu interdum tellus. Fusce lobortis tortor eu tellus laoreet varius. Integer vitae ex ac felis pharetra tincidunt. Vestibulum in venenatis dui.','High', NULL, '2021-01-21', '2021-01-22');
INSERT INTO bugtracker.product_logs VALUES('2','Closed','2','SQL Error Connection', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut sodales orci. Vivamus nibh purus, aliquet eget sem et, consectetur malesuada dolor. Nam aliquam pharetra massa, vel dapibus mauris tincidunt et. Nulla eu interdum tellus. Fusce lobortis tortor eu tellus laoreet varius. Integer vitae ex ac felis pharetra tincidunt. Vestibulum in venenatis dui.','High','2020-11-27', '2020-10-27', '2020-11-27');
INSERT INTO bugtracker.product_logs VALUES('3','Closed','2','Variables Incorrect Order', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut sodales orci. Vivamus nibh purus, aliquet eget sem et, consectetur malesuada dolor. Nam aliquam pharetra massa, vel dapibus mauris tincidunt et. Nulla eu interdum tellus. Fusce lobortis tortor eu tellus laoreet varius. Integer vitae ex ac felis pharetra tincidunt. Vestibulum in venenatis dui.','Low','2021-01-12', '2020-10-08', '2021-01-12');
INSERT INTO bugtracker.product_logs VALUES('5','Closed','1','Server Backup Problem', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut sodales orci. Vivamus nibh purus, aliquet eget sem et, consectetur malesuada dolor. Nam aliquam pharetra massa, vel dapibus mauris tincidunt et. Nulla eu interdum tellus. Fusce lobortis tortor eu tellus laoreet varius. Integer vitae ex ac felis pharetra tincidunt. Vestibulum in venenatis dui.','Low',"2021-01-26", '2020-12-26', '2021-01-26');
INSERT INTO bugtracker.product_logs VALUES('6','Closed','1','API Key Expiration', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut sodales orci. Vivamus nibh purus, aliquet eget sem et, consectetur malesuada dolor. Nam aliquam pharetra massa, vel dapibus mauris tincidunt et. Nulla eu interdum tellus. Fusce lobortis tortor eu tellus laoreet varius. Integer vitae ex ac felis pharetra tincidunt. Vestibulum in venenatis dui.','High', "2021-02-02", '2020-12-26', '2021-01-26');

-- DROP TABLE bugtracker.product_logs cascade;

CREATE TABLE bugtracker.projects (
	id SERIAL,
    project_name VARCHAR(200),
    project_description VARCHAR(1000),
    manager_id INTEGER,
    developer_id INTEGER,
    tester_id INTEGER,
    createdAt DATE,
	updatedAt DATE,
    PRIMARY KEY (id)
);

INSERT INTO bugtracker.projects VALUES('1','Cloud AWS','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut sodales orci. Vivamus nibh purus, aliquet eget sem et, consectetur malesuada dolor. Nam aliquam pharetra massa, vel dapibus mauris tincidunt et. Nulla eu interdum tellus. Fusce lobortis tortor eu tellus laoreet varius. Integer vitae ex ac felis pharetra tincidunt. Vestibulum in venenatis dui.', 2, 3, 4, SYSDATE(), SYSDATE());
INSERT INTO bugtracker.projects VALUES('2','E-Commerce Backend Development','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut sodales orci. Vivamus nibh purus, aliquet eget sem et, consectetur malesuada dolor. Nam aliquam pharetra massa, vel dapibus mauris tincidunt et. Nulla eu interdum tellus. Fusce lobortis tortor eu tellus laoreet varius. Integer vitae ex ac felis pharetra tincidunt. Vestibulum in venenatis dui.', 2, 5, 6, SYSDATE(), SYSDATE());
INSERT INTO bugtracker.projects VALUES('3','Portfolio Build','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut sodales orci. Vivamus nibh purus, aliquet eget sem et, consectetur malesuada dolor. Nam aliquam pharetra massa, vel dapibus mauris tincidunt et. Nulla eu interdum tellus. Fusce lobortis tortor eu tellus laoreet varius. Integer vitae ex ac felis pharetra tincidunt. Vestibulum in venenatis dui.', 2, 3, 4, SYSDATE(), SYSDATE());

SELECT 
	project_name, first_name as developer
FROM 
projects, user_details
where projects.developer_id = user_details.id;
rollback;
TRUNCATE bugtracker.product_logs;
-- DROP TABLE  CASCADE;

-- Gig.update({ title : 'Looking for Android Developer' }, {
-- 		where: {
-- 			id: 1
-- 		}
-- });