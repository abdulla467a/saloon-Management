drop table employee;
drop table service;
drop table transaction;
drop table bills;
drop table appointment;
drop table customer;

create table customer(
	customerID number(5) ,
	customerName varchar(10),
	customerAddress varchar(12),
	contactNum varchar(15),
 	age number(3),
 	payments number(6),
 	primary key (customerID)
);
create table appointment(
	appointmentID number(10),
	customerID number(5),
	appointmentDate date,
	primary key (appointmentID),
	foreign key (customerID) references customer (customerID) on delete cascade
);
create table bills(
	bill_id number(6),
	customerID number(5),
	bill_amount number(5),
	primary key (bill_id),
	foreign key (customerID) references customer (customerID) on delete cascade
);

 create table transaction(
 	transaction_ID number(15) not null,
 	customerID number(5) ,
 	bill_id number(5) ,
 	transactionDate date,
	primary key (transaction_ID),
 	foreign key (customerID) REFERENCES customer (customerID) ON DELETE CASCADE,
 	FOREIGN KEY (bill_id) REFERENCES bills (bill_id) ON DELETE CASCADE
 	);

 create table service(
 	service_id number(10) not null,
 	hair_cut varchar(20),
 	quantity number(5),
 	transaction_ID number(15),
 	primary key(service_id),
 	foreign key (transaction_ID) references transaction (transaction_ID) on delete cascade
 	);

 create table employee(
 	employee_id number(5),
 	customerID number(5),
 	employeeName varchar(15),
 	phoneNumber varchar(15),
 	address varchar(15),
 	salary number(6),
 	job_title varchar(30),
 	primary key (employee_id),
 	foreign key (customerID) references customer (customerID) on delete cascade
 	);

 	insert into customer values(1001,'Siam','Bhola','01786454360',21,7000);
	insert into customer values(1002,'Najua','Cumilla','01631591200',20,3500);
	insert into customer values(1003,'Shaykat','Dhaka','01771230965',22,7600);
	insert into customer values(1004,'Billal','Chattogram','01788385530',23,6090);
	insert into customer values(1005,'Borsha','Gazipur','01920237399',23,NULL);
	insert into customer values(1006,'Raka','Feni','01881778103',24,NULL);
	insert into customer values(1007,'Zayan','London','442072343456',32,12360);
	insert into customer values(1008,'Jackson','Italy','00393282853',36,5000);
	insert into customer values(1009,'Hilton','Paris','00331400008',44,NULL);
	
	insert into appointment values(90001,1001,'20-OCT-2019');
	insert into appointment values(90002,1002,'15-NOV-2019');
	insert into appointment values(90003,1003,'21-JUL-2018');
	insert into appointment values(90004,1004,'1-JAN-2018');
	insert into appointment values(90005,1005,NULL);
	insert into appointment values(90006,1006,NULL);
	insert into appointment values(90007,1007,'21-FEB-2020');
	insert into appointment values(90008,1008,'19-May-2019');
    insert into appointment values(90009,1009,NULL);

	insert into bills values (575,1001,7000);
	insert into bills values (576,1002,3500);
	insert into bills values (577,1003,7600);
	insert into bills values (578,1004,6090);
	insert into bills values (580,1006,NULL);
	insert into bills values (581,1007,12360);
	insert into bills values (582,1008,5000);
		

	insert into transaction values (444,1001,575,'20-OCT-2019');
	insert into transaction values (555,1002,576,'15-NOV-2019');
	insert into transaction values (666,1003,577,'1-JUL-2018');
	insert into transaction values (777,1004,578,'1-JAN-2018');
	insert into transaction values (999,1006,580,NULL);
	insert into transaction values (111,1007,581,'21-FEB-2020');
	insert into transaction values (222,1008,582,'19-May-2019');


	insert into service values (5500,'Low Fade',1,444);
	insert into service values (5501,'Taper Fade',1,555);
	insert into service values (5502,'Afro Frade',1,666);
	insert into service values (5503,'Modern Quiff',1,777);
	insert into service values (5504,'Pompadour Fade',1,222);	

	insert into employee values (900,1001,'Karim','971-585-76','Dubai',20000,'Low Fade Specialist');
	insert into employee values (901,1002,'Rahim','61-455-70 ','Australia',25000,'Taper Fade Specialist');
	insert into employee values (902,1003,'Ibnat','90-5595-6939','Turkey',30000,'Afro Fade Specialist');
	insert into employee values (903,1004,'Zivan','1-555-118','USA',35000,'Modern Quiff Specialist');
	insert into employee values (904,1008,'Sohan','01711166648','Netrokona',26000,'Pompadour Fade Specialist');
	insert into employee values (905,1007,'Mizan','01711166790','Manikganj',29000,'Modern Pomp Specialist');

	/*Sql Queries for Our Project are given below which will show all the important values,relation and many more things*/

	/*1.Selecct all values from transaction table*/
	select * from transaction;
	/*2.Selecct all values from appointment table*/
	select * from appointment;
	/*3.Selecct all values from customer table*/
	select * from customer;
	/*4.Selecct all values from bills table*/
	select * from bills;
	/*5.Selecct all values from service table*/
	select * from service;
	/*6.Selecct all values from employee table*/
	select * from employee;
	/*7.select specific values from transaction table*/
	select transaction_ID, customerID, bill_ID,transactionDate from transaction;
	/*8.select specific values from transaction table*/
	select appointmentID, customerID, appointmentDate from appointment;
	/*9.select specific values from customer table*/
	select customerID, customerName,customerAddress,contactNum,age,payments from customer;
	/*10.select specific values from bills table*/
	select bill_id, customerID, bill_amount from bills;
	/*11.select specific values from service table*/
	select service_id, hair_cut, quantity, transaction_ID from service;
	/*12.select specific values from employee table*/
	select employee_id, customerID, employeeName, phoneNumber, address, salary, job_title from employee;
	/*13.select salary and divide by 2 */
	select (salary/2) from employee;
	/*14.select salary by 2 and rename table name*/
	select (salary/2) as salary_divide_by_two from employee;
	/*15.select employee where employe job title is Low Fade Specialist*/
	select employee_id,employeeName from employee WHERE job_title='Low Fade Specialist';
	/*16.select specific employee where employee_id is 900*/
	select employeeName, salary from employee WHERE employee_id=900;
	/*17.select employee where employee salary is greater than 25000*/
	select employeeName,phoneNumber from employee WHERE salary>25000;
	/*18.Show employee details where salary between 25000 to 35000*/
	select employeeName, address from employee WHERE salary BETWEEN 25000 AND 35000;
	/*19.Show employee details where salary not between 25000 to 35000*/
	select employeeName, address from employee WHERE salary NOT BETWEEN 25000 AND 35000;
	/*20.Show employee details where salary between 25000(including) to 35000(including)*/
	select employeeName, address from employee WHERE salary>= 25000 AND salary <=35000;
	/*21.show employee details sorted by salary in descending order*/
	select employee_id, customerID, employeeName, salary, job_title from employee ORDER BY salary desc;
	/*22.show employee details sorted by salary in ascending order*/
	select employee_id, customerID, employeeName, phoneNumber, address, salary, job_title from employee ORDER BY salary;
	/*23.show service details where hair_cut start with Low*/
	select service_id,hair_cut,quantity,transaction_id from service WHERE hair_cut like 'Low%';
	/*24.Display service table information where hair_cut start with T and end with e*/
	select service_id,hair_cut,quantity,transaction_id from service where hair_cut like 'T%e';
	/*25.Display service table information where in hair_cut d in 6th position*/ 
	select service_id,hair_cut,quantity,transaction_id from service where hair_cut like '_____d%';
	/*26.Show maximum salary from employee table*/
	select MAX(salary) from employee;
	/*27.Show average salary from employee table*/
	select AVG(salary) from employee;
	/*28.Show minimum salary from employee table*/
	select MIN(salary) from employee;

	/*30. Inner Join */
	select customer.customerID,customer.customerName,customer.contactNum,customer.payments,
	appointment.appointmentID,
	appointment.appointmentDate from customer inner join appointment on customer.customerID = appointment.customerID;

	/*31. Left Outer Join */
	select customer.customerID,customer.customerName,customer.contactNum,customer.payments,
	bills.bill_id,bills.bill_amount from customer left outer join bills on customer.customerID = bills.customerID;

	/*32. Right Outer Join */
	select customer.customerID,customer.customerName,customer.payments,transaction.transaction_ID,
	transaction.transactionDate from customer right outer join transaction on customer.customerID = transaction.customerID;

	/*33. Full Outer Join */
	select customer.customerName,customer.payments,employee.employee_id,employee.phoneNumber,
	employee.job_title from customer  full outer join employee on customer.customerID = employee.customerID;
	/*Thank You*/