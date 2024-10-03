-- Adicionando as constraints
ALTER TABLE azure_company.employee 
    ADD CONSTRAINT chk_salary_employee CHECK (Salary > 2000.0),
    ADD CONSTRAINT pk_employee PRIMARY KEY (Ssn);

ALTER TABLE azure_company.employee 
    ADD CONSTRAINT fk_employee FOREIGN KEY (Super_ssn) REFERENCES azure_company.employee(Ssn);

ALTER TABLE azure_company.employee 
    ALTER COLUMN Dno SET NOT NULL,
    ALTER COLUMN Dno SET DEFAULT 1;

ALTER TABLE azure_company.departament 
    ADD CONSTRAINT chk_date_dept CHECK (Dept_create_date < Mgr_start_date),
    ADD CONSTRAINT pk_dept PRIMARY KEY (Dnumber),
    ADD CONSTRAINT unique_name_dept UNIQUE (Dname),
    ADD CONSTRAINT fk_dept FOREIGN KEY (Mgr_ssn) REFERENCES azure_company.employee(Ssn)
    ON UPDATE CASCADE;

ALTER TABLE azure_company.dept_locations 
    ADD CONSTRAINT fk_dept_locations FOREIGN KEY (Dnumber) REFERENCES azure_company.departament(Dnumber);

ALTER TABLE azure_company.project 
    ADD CONSTRAINT unique_project UNIQUE (Pname),
    ADD CONSTRAINT fk_project FOREIGN KEY (Dnum) REFERENCES azure_company.departament(Dnumber);

ALTER TABLE azure_company.works_on 
    ADD CONSTRAINT fk_employee_works_on FOREIGN KEY (Essn) REFERENCES azure_company.employee(Ssn),
    ADD CONSTRAINT fk_project_works_on FOREIGN KEY (Pno) REFERENCES azure_company.project(Pnumber);

ALTER TABLE azure_company.dependent 
    ADD CONSTRAINT fk_dependent FOREIGN KEY (Essn) REFERENCES azure_company.employee(Ssn);
