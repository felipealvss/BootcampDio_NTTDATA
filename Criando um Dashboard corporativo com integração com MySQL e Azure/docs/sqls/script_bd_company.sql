use azure_company;

-- Criação da tabela employee
CREATE TABLE employee (
    Fname varchar(15) NOT NULL,
    Minit char,
    Lname varchar(15) NOT NULL,
    Ssn char(9) NOT NULL,
    Bdate date,
    Address varchar(30),
    Sex char,
    Salary decimal(10,2),
    Super_ssn char(9),
    Dno int NOT NULL,
);

-- Criação da tabela departament
CREATE TABLE departament (
    Dname varchar(15) NOT NULL,
    Dnumber int NOT NULL,
    Mgr_ssn char(9) NOT NULL,
    Mgr_start_date date,
    Dept_create_date date,
);

-- Criação da tabela dept_locations
CREATE TABLE dept_locations (
    Dnumber int NOT NULL,
    Dlocation varchar(15) NOT NULL,
    PRIMARY KEY (Dnumber, Dlocation)

);

-- Criação da tabela project
CREATE TABLE project (
    Pname varchar(15) NOT NULL,
    Pnumber int NOT NULL,
    Plocation varchar(15),
    Dnum int NOT NULL,
    PRIMARY KEY (Pnumber)

);

-- Criação da tabela works_on
CREATE TABLE works_on (
    Essn char(9) NOT NULL,
    Pno int NOT NULL,
    Hours decimal(3,1) NOT NULL,
    PRIMARY KEY (Essn, Pno)

);

-- Criação da tabela dependent
CREATE TABLE dependent (
    Essn char(9) NOT NULL,
    Dependent_name varchar(15) NOT NULL,
    Sex char,
    Bdate date,
    Relationship varchar(8),
    PRIMARY KEY (Essn, Dependent_name)

);

-- REALIZAR INSERT ANTES DA RIAÇÃO DAS CONSTRAINTS

-- Adicionando as constraints
ALTER TABLE employee 
    ADD CONSTRAINT chk_salary_employee CHECK (Salary > 2000.0),
    ADD CONSTRAINT pk_employee PRIMARY KEY (Ssn);

ALTER TABLE employee 
    ADD CONSTRAINT fk_employee FOREIGN KEY (Super_ssn) REFERENCES employee(Ssn)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

ALTER TABLE employee 
    MODIFY Dno int NOT NULL DEFAULT 1;

ALTER TABLE departament 
    ADD CONSTRAINT chk_date_dept CHECK (Dept_create_date < Mgr_start_date),
    ADD CONSTRAINT pk_dept PRIMARY KEY (Dnumber),
    ADD CONSTRAINT unique_name_dept UNIQUE (Dname),
    ADD CONSTRAINT fk_dept FOREIGN KEY (Mgr_ssn) REFERENCES employee(Ssn)
    ON UPDATE CASCADE;

ALTER TABLE dept_locations 
    ADD CONSTRAINT fk_dept_locations FOREIGN KEY (Dnumber) REFERENCES departament(Dnumber);

ALTER TABLE project 
    ADD CONSTRAINT unique_project UNIQUE (Pname),
    ADD CONSTRAINT fk_project FOREIGN KEY (Dnum) REFERENCES departament(Dnumber);

ALTER TABLE works_on 
    ADD CONSTRAINT fk_employee_works_on FOREIGN KEY (Essn) REFERENCES employee(Ssn),
    ADD CONSTRAINT fk_project_works_on FOREIGN KEY (Pno) REFERENCES project(Pnumber);

ALTER TABLE dependent 
    ADD CONSTRAINT fk_dependent FOREIGN KEY (Essn) REFERENCES employee(Ssn);
