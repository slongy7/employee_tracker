create database employees_db;
    
use employees_db;

create table department (
	id int unsigned auto_increment primary key,
    name varchar(30) unique not null
);

create table role (
	id int unsigned auto_increment primary key,
    title varchar (30) unique not null,
    salary decimal unsigned not null,
    department_id int unsigned not null,
    index dept_ind (department_id),
    constraint fk_dept foreign key (department_id) references department(id) on delete cascade
);

CREATE TABLE employee (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  role_id INT UNSIGNED NOT NULL,
  INDEX role_ind (role_id),
  CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE,
  manager_id INT UNSIGNED,
  INDEX man_ind (manager_id),
  CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES employee(id) ON DELETE SET NULL
);

use employees_db;

insert into department
	(name)
values
		('Finance'),
        ('HR'),
        ('Marketing'),
        ('Government Affairs');
        
insert into role
	(title, salary, department_id)
values
	('Liaison', 60000, 1),
    ('Manager', 70000, 2),
    ('Analyst', 80000, 3),
    ('Assistant', 90000, 4);
    
insert into employee
	(first_name, last_name, role_id, manager_id)
values
	('Tony', 'Stark', 1, null),
    ('Steve', 'Rogers', 2, 1),
    ('Doctor', 'Banner', 3, 1),
    ('Wanda', 'Maximoff', 4, 1);