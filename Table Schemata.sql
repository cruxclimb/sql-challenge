-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/xXWxBj
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE `Department` (
    `Dept_ID` bigint(20) unsigned  NOT NULL ,
    `dept_no` varchar(45)  NOT NULL ,
    `dept_name` varchar(45)  NOT NULL ,
    PRIMARY KEY (
        `Dept_ID`
    )
);

CREATE TABLE `Salary` (
    `Salaries_ID` bigint(20) unsigned NOT NULL ,
    `emp_no` varchar(45)  NOT NULL ,
    `salary` bigint(20) unsigned NOT NULL ,
    `from_date` date  NOT NULL ,
    `to_date` date  NOT NULL ,
    PRIMARY KEY (
        `Salaries_ID`
    )
);

CREATE TABLE `Titles` (
    `Titles_ID` bigint(20) unsigned NOT NULL ,
    `emp_no` varchar(45)  NOT NULL ,
    `title` varchar(45)  NOT NULL ,
    `from_date` date  NOT NULL ,
    `to_date` date  NOT NULL ,
    PRIMARY KEY (
        `Titles_ID`
    )
);

CREATE TABLE `Dept_Employee` (
    `Dept_Employee_ID` bigint(20) unsigned NOT NULL ,
    `Employees_ID` bigint(20) unsigned NOT NULL ,
    `Dept_ID` bigint(20) unsigned NOT NULL ,
    `emp_no` varchar(45)  NOT NULL ,
    `dept_no` varchar(45)  NOT NULL ,
    `from_date` date  NOT NULL ,
    `to_date` date  NOT NULL ,
    PRIMARY KEY (
        `Dept_Employee_ID`
    )
);

CREATE TABLE `Dept_Manager` (
    `Dept_Manager_ID` bigint(20) unsigned NOT NULL ,
    `Dept_ID` bigint(20) unsigned NOT NULL ,
    `dept_no` varchar(45)  NOT NULL ,
    `emp_no` varchar(45)  NOT NULL ,
    `from_date` date  NOT NULL ,
    `to_date` date  NOT NULL ,
    PRIMARY KEY (
        `Dept_Manager_ID`
    )
);

CREATE TABLE `Employees` (
    `Employees_ID` bigint(20) unsigned NOT NULL ,
    `Titles_ID` bigint(20) unsigned NOT NULL ,
    `Salaries_ID` bigint(20) unsigned NOT NULL ,
    `emp_no` varchar(45)  NOT NULL ,
    `birth_date` date  NOT NULL ,
    `first_name` varchar(45)  NOT NULL ,
    `last_name` varchar(45)  NOT NULL ,
    `gender` varchar(45)  NOT NULL ,
    `hire_date` date  NOT NULL ,
    PRIMARY KEY (
        `Employees_ID`
    )
);

ALTER TABLE `Dept_Employee` ADD CONSTRAINT `fk_Dept_Employee_Employees_ID` FOREIGN KEY(`Employees_ID`)
REFERENCES `Employees` (`Employees_ID`);

ALTER TABLE `Dept_Employee` ADD CONSTRAINT `fk_Dept_Employee_Dept_ID` FOREIGN KEY(`Dept_ID`)
REFERENCES `Department` (`Dept_ID`);

ALTER TABLE `Dept_Manager` ADD CONSTRAINT `fk_Dept_Manager_Dept_ID` FOREIGN KEY(`Dept_ID`)
REFERENCES `Department` (`Dept_ID`);

ALTER TABLE `Employees` ADD CONSTRAINT `fk_Employees_Titles_ID` FOREIGN KEY(`Titles_ID`)
REFERENCES `Titles` (`Titles_ID`);

ALTER TABLE `Employees` ADD CONSTRAINT `fk_Employees_Salaries_ID` FOREIGN KEY(`Salaries_ID`)
REFERENCES `Salary` (`Salaries_ID`);

