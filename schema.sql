DROP DATABASE IF EXISTS `employees_db`;

CREATE DATABASE `employees_db`;

USE `employees_db`;

-- Create Table for Department
CREATE TABLE `department`(
	`id` INT AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(30) NOT NULL,
    PRIMARY KEY(`id`)
);

-- Create Table for Role
CREATE TABLE `role`(
	`id` INT AUTO_INCREMENT NOT NULL,
    `title` VARCHAR(30) NOT NULL,
    `salary` DECIMAL,
    `department_id` INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
);

-- Create Table for Employee
CREATE TABLE `employee` (
	`id` INT AUTO_INCREMENT NOT NULL,
    `first_name` VARCHAR(30) NOT NULL,
    `last_name` VARCHAR(30) NOT NULL,
    `role_id` INT NOT NULL,
    `manager_id` INT,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`role_id`) REFERENCES `role`(`id`),
    FOREIGN KEY(`manager_id`) REFERENCES `employee`(`id`)
);