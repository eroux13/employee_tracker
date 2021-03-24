-- Create Seeds for Department Table
INSERT INTO `department`(`name`)
	VALUES ("Marketing"), ("IT"), ("Sales"), ("Engineering"), ("Operations");

-- Create Seeds for Role Table   
INSERT INTO `role`(`title`, `salary`, `department_id`)
	VALUES ("Marketing Director", 80000, 1),
			("Marketing Associate", 45000, 1),
            ("Marketing Consultant", 50000, 1),
			("IT Manager", 75000, 2),
            ("IT Support", 55000, 2),
            ("Sales Manager", 60000, 3),
            ("Sales Representative", 35000, 3),
            ("Director of Engineering", 112000, 4),
            ("Full Stack Developer", 75000, 4),
            ("Software Lead", 95000, 4),
            ("Operations Manager", 80000, 5);

-- Create Seeds for Employee Table
-- Create Managers first so that we do not run into foreign key constraints
INSERT INTO `employee`(`first_name`, `last_name`, `role_id`, `manager_id`)
	VALUES ("John", "Smith", 1, null);

INSERT INTO `employee`(`first_name`, `last_name`, `role_id`, `manager_id`)
	VALUES ("Abram", "Tolly", 3, null);

INSERT INTO `employee`(`first_name`, `last_name`, `role_id`, `manager_id`)
	VALUES ("Harland", "Jaylee", 5, null);

INSERT INTO `employee`(`first_name`, `last_name`, `role_id`, `manager_id`)
	VALUES ("Rudyard", "Terrell", 7, null);

INSERT INTO `employee`(`first_name`, `last_name`, `role_id`, `manager_id`)
	VALUES ("Garrett", "Axel", 10, null);

INSERT INTO `employee`(`first_name`, `last_name`, `role_id`, `manager_id`)
	VALUES ( "Codie", "Kori", 9, 4);

INSERT INTO `employee`(`first_name`, `last_name`, `role_id`, `manager_id`)
	VALUES ("Genie", "Noreen", 2, 1);

INSERT INTO `employee`(`first_name`, `last_name`, `role_id`, `manager_id`)
	VALUES ("Philis", "Laila", 4, 2);

INSERT INTO `employee`(`first_name`, `last_name`, `role_id`, `manager_id`)
	VALUES ("Janice", "Wilmur", 6, 3);

INSERT INTO `employee`(`first_name`, `last_name`, `role_id`, `manager_id`)
	VALUES ("Clair", "Brianna", 8, 6);

INSERT INTO `employee`(`first_name`, `last_name`, `role_id`, `manager_id`)
	VALUES ("Jane", "Doe", 2, 1);