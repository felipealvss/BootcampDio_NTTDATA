CREATE SCHEMA azure_company;

-- Criação da tabela employee
CREATE TABLE azure_company.employee (
    Fname varchar(15) NOT NULL,
    Minit char,
    Lname varchar(15) NOT NULL,
    Ssn char(9) NOT NULL,
    Bdate date,
    Address varchar(30),
    Sex char,
    Salary decimal(10,2),
    Super_ssn char(9),
    Dno int NOT NULL
);

-- Criação da tabela departament
CREATE TABLE azure_company.departament (
    Dname varchar(15) NOT NULL,
    Dnumber int NOT NULL,
    Mgr_ssn char(9) NOT NULL,
    Mgr_start_date date,
    Dept_create_date date
);

-- Criação da tabela dept_locations
CREATE TABLE azure_company.dept_locations (
    Dnumber int NOT NULL,
    Dlocation varchar(15) NOT NULL,
    PRIMARY KEY (Dnumber, Dlocation)
);

-- Criação da tabela project
CREATE TABLE azure_company.project (
    Pname varchar(15) NOT NULL,
    Pnumber int NOT NULL,
    Plocation varchar(15),
    Dnum int NOT NULL,
    PRIMARY KEY (Pnumber)
);

-- Criação da tabela works_on
CREATE TABLE azure_company.works_on (
    Essn char(9) NOT NULL,
    Pno int NOT NULL,
    Hours decimal(3,1) NOT NULL,
    PRIMARY KEY (Essn, Pno)
);

-- Criação da tabela dependent
CREATE TABLE azure_company.dependent (
    Essn char(9) NOT NULL,
    Dependent_name varchar(15) NOT NULL,
    Sex char,
    Bdate date,
    Relationship varchar(8),
    PRIMARY KEY (Essn, Dependent_name)
);