create table employees(
	id serial primary key,
	employees_name varchar(50) not null);
	
insert into employees(employees_name)
values ('Cathy Walker'),
	   ('Stephanie Farmer'),
	   ('Joan Sanchez'),
	   ('Kevin Hunt'),
	   ('Kathleen Francis'),
	   ('David McKinney'),
	   ('Suzanne Ford'),
	   ('Betty Harris'),
	   ('Charlotte Murphy'),
	   ('Lori Elliott'),
	   ('David King'),
	   ('Margaret Taylor'),
	   ('Leona Salazar'),
	   ('Gloria Bowman'),
	   ('Edith Simpson'),
	   ('Thomas Martin'),
	   ('Rick Greene'),
	   ('James Lewis'),
	   ('Michael Diaz'),
	   ('Rebecca White'),
	   ('Marlene Thompson'),
	   ('Richard Mendez'),
	   ('Eleanor Stewart'),
	   ('Christine Diaz'),
	   ('Elizabeth Logan'),
	   ('Earl Hall'),
	   ('Patrick Fuller'),
	   ('Tyrone Sherman'),
	   ('Richard Goodman'),
	   ('Raymond Fletcher'),
	   ('Mario Mendoza'),
	   ('Ronald Martin'),
	   ('Rose Jackson'),
	   ('Jane Williams'),
	   ('Thelma Anderson'),
	   ('Courtney Smith'),
	   ('Kay Smith'),
	   ('Clifford Dixon'),
	   ('Jose Williamson'),
	   ('Martha Bennett'),
	   ('Mary Rose'),
	   ('Ruth Anderson'),
	   ('Rose Hunt'),
	   ('Linda Briggs'),
	   ('Emily Adams'),
	   ('Christopher Ford'),
	   ('Micheal Smith'),
	   ('Connie Perez'),
	   ('Ricky Gray'),
	   ('Nicole Williams'),
	   ('Jesse Roberts'),
	   ('Amy Graham'),
	   ('William Williams'),
	   ('James Scott'),
	   ('Andrea Brooks'),
	   ('Veronica Green'),
	   ('Elizabeth Cox'),
	   ('Lucy Peterson'),
	   ('Debra Smith'),
	   ('Eric Green'),
	   ('Mary Robinson'),
	   ('Cynthia Scott'),
	   ('Charles Clark'),
	   ('Wayne Sanchez'),
	   ('Gary Hart'),
	   ('Jerome Scott'),
	   ('Jonh Sina'),
	   ('Kilian Merfi'),
	   ('Cristiano Ronaldo'),
	   ('Leonel Messi');
select * from employees;

create table salary(
	id serial primary key,
	monthly_salary int not null);

insert into salary(monthly_salary)
values ('1000'),
       ('1100'),
       ('1200'),
       ('1300'),
       ('1400'),
       ('1500'),
       ('1600'),
       ('1700'),
       ('1800'),
       ('1900'),
       ('2000'),
       ('2100'),
       ('2200'),
       ('2300'),
       ('2400'),
       ('2500');
 select * from salary;

create table employee_salary(
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);

insert into employee_salary(employee_id,salary_id)
values (2,6),
       (41,1),
       (13,4),
       (27,15),
       (55,3),
       (6,2),
       (19,5),
       (38,11),
       (33,12),
       (12,1),
       (77,16),
       (66,7),
       (23,4),
       (31,13),
       (100,14),
       (28,1),
       (29,10),
       (24,3),
       (9,5),
       (22,10),
       (36,6),
       (14,12),
       (1,9),
       (26,13),
       (37,8),
       (18,2),
       (3,4),
       (11,16),
       (80,15),
       (111,11),
       (7,2),
       (99,1),
       (45,14),
       (17,12),
       (32,10),
       (20,14),
       (50,3),
       (34,15),
       (4,9),
       (10,8);
select * from employee_salary;

create table roles(
	id serial primary key,
	role_name int not null unique);

ALTER TABLE roles
ALTER COLUMN role_name TYPE varchar(30);

insert into roles(role_name)
values ('Junior Python developer'),
       ('Middle Python developer'),
       ('Senior Python developer'),
       ('Junior Java developer'),
       ('Middle Java developer'),
       ('Senior Java developer'),
       ('Junior JavaScript developer'),
       ('Middle JavaScript developer'),
       ('Senior JavaScript developer'),
       ('Junior Manual QA engineer'),
       ('Middle Manual QA engineer'),
       ('Senior Manual QA engineer'),
       ('Project Manager'),
       ('Designer'),
       ('HR'),
       ('CEO'),
       ('Sales manager'),
       ('Junior Automation QA engineer'),
       ('Middle Automation QA engineer'),
       ('Senior Automation QA engineer');
select * from roles ;
      
create table roles_employee(
	id serial primary key,
	employee_id int not null unique,
	role_id int not null,
	foreign key(employee_id)
		references employees(id),
	foreign key(role_id)
        references roles(id)
);

insert into roles_employee(employee_id,role_id)
values (1,1),
       (2,2),
	   (3,4),
	   (4,10),
	   (5,13),
	   (6,14),
	   (7,5),
	   (8,9),
	   (9,10),
	   (10,20),
	   (11,11),
	   (12,1),
	   (13,3),
	   (14,17),
	   (15,15),
	   (16,13),
	   (17,12),
	   (18,10),
	   (19,19),
	   (21,4),
	   (22,8),
	   (23,15),
	   (24,2),
	   (25,17),
	   (26,20),
	   (27,9),
	   (28,7),
	   (29,6),
	   (30,14),
	   (31,1),
	   (32,18),
	   (33,12),
	   (34,5),
	   (35,16),
	   (36,3),
	   (37,13),
	   (38,19),
	   (39,7),
	   (40,8),
	   (20,1);
select * from roles_employee

/*1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.*/
select employees.employees_name,salary.monthly_salary 
from employees
join employee_salary on employee_salary.employee_id = employees.id
join salary on employee_salary.salary_id = salary.id;
/*2. Вывести всех работников у которых ЗП меньше 2000.*/
select employees.employees_name
from employees
join employee_salary on employee_salary.employee_id = employees.id
join salary on employee_salary.salary_id = salary.id 
where monthly_salary < 2000;
/* 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)*/
select salary.monthly_salary,employees.employees_name
from employee_salary
left join employees on employee_salary.employee_id = employees.id
left join salary on employee_salary.salary_id = salary.id 
where employees_name is null;
/*4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)*/
select salary.monthly_salary,employees.employees_name
from employee_salary
left join employees on employee_salary.employee_id = employees.id
left join salary on employee_salary.salary_id = salary.id 
where employees_name is null and monthly_salary < 2000;
/*5. Найти всех работников кому не начислена ЗП.*/
select employees_name,monthly_salary
from employees
left join employee_salary on employee_salary.employee_id = employees.id
left join salary on employee_salary.salary_id = salary.id
where monthly_salary is null;
/*6. Вывести всех работников с названиями их должности.*/
select employees_name,role_name
from employees
left join roles_employee on roles_employee.employee_id = employees.id
left join roles on roles_employee.role_id = roles.id;
/*7. Вывести имена и должность только Java разработчиков.*/
select employees_name,role_name
from employees
left join roles_employee on roles_employee.employee_id = employees.id
left join roles on roles_employee.role_id = roles.id
where role_name in ('Junior Java developer','Middle Java developer','Senior Java developer');
/* 8. Вывести имена и должность только Python разработчиков.*/
select employees_name,role_name
from employees
left join roles_employee on roles_employee.employee_id = employees.id
left join roles on roles_employee.role_id = roles.id
where role_name like '%Python%';
/* 9. Вывести имена и должность всех QA инженеров.*/
select employees_name,role_name
from employees
left join roles_employee on employee_id = employees.id 
left join roles on role_id = roles.id 
where role_name  like '%Q_%';
/*10. Вывести имена и должность ручных QA инженеров.*/
select employees_name,role_name
from employees
left join roles_employee on employee_id = employees.id 
left join roles on role_id = roles.id 
where role_name like '%Manual%';
/* 11. Вывести имена и должность автоматизаторов QA*/
select employees_name,role_name
from employees
left join roles_employee on employee_id = employees.id 
left join roles on role_id = roles.id
where role_name like '%Au__%';
/* 12. Вывести имена и зарплаты Junior специалистов*/
select employees_name,role_name,monthly_salary
from employees
left join roles_employee on employee_id = employees.id 
left join roles on role_id = roles.id
left join employee_salary on employee_salary.employee_id = employees.id
left join salary on employee_salary.salary_id = salary.id
where role_name like 'J%';
/*13. Вывести имена и зарплаты Middle специалистов*/
select employees_name,role_name,monthly_salary
from employees
left join roles_employee on employee_id = employees.id 
left join roles on role_id = roles.id
left join employee_salary on employee_salary.employee_id = employees.id
left join salary on employee_salary.salary_id = salary.id
where role_name like 'M%';
/* 14. Вывести имена и зарплаты Senior специалистов*/
select employees_name,role_name,monthly_salary
from employees
left join roles_employee on employee_id = employees.id 
left join roles on role_id = roles.id
left join employee_salary on employee_salary.employee_id = employees.id
left join salary on employee_salary.salary_id = salary.id
where role_name like 'Se%';
/*15. Вывести зарплаты Java разработчиков*/
select monthly_salary,role_name
from roles_employee 
left join employee_salary on roles_employee.employee_id = employee_salary.employee_id
left join employees  on roles_employee.employee_id = employees.id
left join roles on roles_employee.role_id = roles.id 
left join salary on employee_salary.salary_id = salary.id
where role_name like '%Java developer%';
/*16. Вывести зарплаты Python разработчиков*/
select monthly_salary,role_name
from roles_employee 
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join employees  on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where role_name like '%Python%';
/* 17. Вывести имена и зарплаты Junior Python разработчиков*/
select monthly_salary,role_name,employees_name
from roles_employee 
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join employees  on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where role_name like '%Junior Python%';
/* 18. Вывести имена и зарплаты Middle JS разработчиков*/
select monthly_salary,role_name,employees_name
from roles_employee 
join employees  on roles_employee.employee_id = employees.id
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join roles on roles_employee.role_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where role_name like '%Middle JavaS%';
/*19. Вывести имена и зарплаты Senior Java разработчиков*/
select monthly_salary,role_name,employees_name
from roles_employee 
join employees  on roles_employee.employee_id = employees.id
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join roles on roles_employee.role_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where role_name like '%Senior Java developer%';
/*20. Вывести зарплаты Junior QA инженеров*/
select monthly_salary,role_name,employees_name
from roles_employee 
join employees  on roles_employee.employee_id = employees.id
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join roles on roles_employee.role_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where role_name like 'J%eer';
/*21. Вывести среднюю зарплату всех Junior специалистов*/
select avg (monthly_salary)
from roles_employee 
join employees  on roles_employee.employee_id = employees.id
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join roles on roles_employee.role_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where role_name like 'J%';
/* 22. Вывести сумму зарплат JS разработчиков*/
select SUM (monthly_salary)
from roles_employee 
join employees  on roles_employee.employee_id = employees.id
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join roles on roles_employee.role_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where role_name like '%JavaScript%';
/* 23. Вывести минимальную ЗП QA инженеров*/
select MIN (monthly_salary)
from roles_employee 
join employees  on roles_employee.employee_id = employees.id
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join roles on roles_employee.role_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where role_name like '%QA%';
/*24. Вывести максимальную ЗП QA инженеров*/
select MAX (monthly_salary)
from roles_employee 
join employees  on roles_employee.employee_id = employees.id
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join roles on roles_employee.role_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where role_name like '%QA%';
/*25. Вывести количество QA инженеров*/
select count (role_name)
from roles_employee 
join employees  on roles_employee.employee_id = employees.id
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join roles on roles_employee.role_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where role_name like '%QA%';
/*26. Вывести количество Middle специалистов.*/
select count (role_name)
from roles_employee 
join employees  on roles_employee.employee_id = employees.id
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join roles on roles_employee.role_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where role_name like '%Middle%';
/*27. Вывести количество разработчиков*/
select count (role_name)
from roles_employee 
join employees  on roles_employee.employee_id = employees.id
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join roles on roles_employee.role_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where role_name like '%developer%';
/*28. Вывести фонд (сумму) зарплаты разработчиков.*/
select SUM (monthly_salary)
from roles_employee 
join employees  on roles_employee.employee_id = employees.id
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join roles on roles_employee.role_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where role_name like '%developer%';
/* Вывести имена, должности и ЗП всех специалистов по возрастанию*/
select employees_name,role_name,monthly_salary
from roles_employee 
join employees  on roles_employee.employee_id = employees.id
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join roles on roles_employee.role_id = roles.id 
join salary on employee_salary.salary_id = salary.id
order by monthly_salary asc;
/*30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300*/
select employees_name,role_name,monthly_salary
from roles_employee 
join employees  on roles_employee.employee_id = employees.id
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join roles on roles_employee.role_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where monthly_salary between 1700 and 2300
order by monthly_salary asc;
/*31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300*/
select employees_name,role_name,monthly_salary
from roles_employee 
join employees  on roles_employee.employee_id = employees.id
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join roles on roles_employee.role_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where monthly_salary < 2300
order by monthly_salary asc;
/* 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000*/
select employees_name,role_name,monthly_salary
from roles_employee 
join employees  on roles_employee.employee_id = employees.id
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join roles on roles_employee.role_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where monthly_salary in (1100,1500,2000)
order by monthly_salary asc;







