CREATE TABLE users.product_logs (
	id VARCHAR(10),
	status VARCHAR(10),
	project_id VARCHAR(10),
	priority VARCHAR(10),
	closedOn DATE,
	createdAt DATE,
	updatedAt DATE,
	PRIMARY KEY (id)
);

INSERT INTO product_logs VALUES('BG1','Opened','PR1','High', NULL, '2021-01-21', '2021-01-22');
INSERT INTO product_logs VALUES('BG2','Closed','PR2','High','2020-11-27', '2020-10-27', '2020-11-27');
INSERT INTO product_logs VALUES('BG3','Closed','PR3','Low','2021-01-12', '2020-10-08', '2021-01-12');
INSERT INTO product_logs VALUES('BG5','Closed','PR12','low',"2021-01-26", '2020-12-26', '2021-01-26');

-- Gig.update({ title : 'Looking for Android Developer' }, {
-- 		where: {
-- 			id: 1
-- 		}
-- });