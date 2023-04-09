create table Employee(name varchar(50) NOT NULL, age int, id int primary key, depertment varchar)


-- Drop command used to delet table from database 
/* Drop command not used to just delet data, but also used to delet structure of the table 
from database 
*/
	drop table Employee;

-- here alter is used to add new column for table employee 	
	alter table Employee add birthDate date;

-- here alter is used to drop(delete) coumn from the employee table 
	alter table Employee drop column age;

-- here alter is used to change the datatype of the column depertment from varchar to varchar(20)
	alter table Employee alter column depertment varchar(20);

-- the truncate command is used to delete data in the table without deleting the structure of the table
	truncate table Employee;
	
	select * from Employee; 

-- the insert command is used to insert data to the table 
/* 
   in this way we insert data to all columns of the first row with the same order 
   mahmoud as name, 1 as id, null as depertment, getdate() funcation to get the date of current date 
*/
	insert into Employee values('mahmoud', 1,null ,GETDATE());

/* 
   this is the secand way to use insert command to insert in a specific columns not in all .
   insert 2 as id, mohammed as name. 
*/
	insert into Employee (id, name) values (2, 'mohammed');

/*
    this way of insert is used to insert date in multe rows not in one row each row has it's data 
	and we seprate between date of each row by the comma.
*/
	insert into Employee values('ali', 3, null, getdate()),
	('eman', 4, null, 1/23/2003),
	('mosaad', 5,null, 9/8/2005);


	select * from Employee; 
	
--  the command delete is used to delete data from table without delete strucature.
/*
	TRUNCATE TABLE is similar to the DELETE statement with no WHERE clause; however,
	TRUNCATE TABLE is faster and uses fewer system and transaction log resources.
Compared to the DELETE statement, TRUNCATE TABLE has the following advantages:
1-Less transaction log space is used
The DELETE statement removes rows one at a time and records an entry in the transaction log for
each deleted row. TRUNCATE TABLE removes the data by deallocating the data pages used to store
the table data and records only the page deallocations in the transaction log.
Fewer locks are typically used
When the DELETE statement is executed using a row lock, each row in the table is locked for deletion.
TRUNCATE TABLE always locks the table and page but not each row.
Without exception, zero pages are left in the table
After a DELETE statement is executed, the table can still contain empty pages.
For indexes, the delete operation can leave empty pages behind.
TRUNCATE TABLE removes all rows from a table, but the table structure and its columns, constraints,
indexes, and so on remain. To remove the table definition in addition to its data,
use the DROP TABLE statement. 
Note to students that if the table to be truncated contains an identity column, 
the counter for that column is reset to the seed value defined for the column. If no seed was defined,
the default value 1 is used. If they want to retain the identity counter for any reason,
use DELETE instead. 
*/
	delete from Employee;

/*
	delete command could be used to delete specific row using condation where to specifie row 
	the value used with where condation must be unique value so we use primarey key.
*/
	delete from Employee 
	where id = 2;

-- update command is used to change data in the table 
/*
	update command with where condation is used to change date in a spacific row.
*/
	update Employee set name = 'saadallah'
	where id = 1;


/*
	update command without where condation is used to change date in all rows to the new date, but it 
	must have meaning in the change like update the age of all employees by one.  
*/
	update Employee set id+=1;

/*
	update command could be used to delete data from spacific column without delet the column itself
	to do this we update date in the column to null.
	remember that when using drop command to delete column we delete column with the date, but when 
	using update we delete only date from the coulmn.
*/
	update Employee set birthDate = null;
	select * from Employee; 

	alter table Employee add age int ;
	alter table Employee add lastName varchar(20);
	alter table Employee add department int;

	select * from Employee; 
	
	truncate table Employee;

	insert into Employee values ('mahmoud', 1, 20, '7/3/2002',21, 'saadallah'),
	('mohammed', 3, 30,'4/23/1990', 34, 'mundour'),
	('ali', 4, 20,'6/23/2001', 30, 'khalel'),
	('eman', 5, 50,'6/23/2004', 18, 'mohamed'),
	('asmaa', 18, 40,'6/23/1999', 24, 'elsayed'),
	('raheem', 28, 10,'6/23/1991', 33, 'sobhey'),
	('mosaad', 82, 20,'6/23/2002', 20, 'omer'),
	('emad', 27, 20,'6/23/2002', 20, 'elmansey'),
	('lola', 145, 10,'6/23/2000', 22, 'mahmoud'),
	('saad', 11, 30,'6/23/1982', 42, 'hamed'),
	('mahmoud', 45, 20,'6/23/1988', 36, 'khalel'),
	('ibrahim', 44, 50,'6/23/1997', 26, 'maher'),
	('ahmed', 2, 50,'6/23/1994', 29, 'hamdey'),
	('nader', 7, 40,'6/23/1996', 27, 'kathem');

	update Employee set depertment = null where id = 145;
	update Employee set depertment = null where id = 7;


-- here is the simplest way to show data inside table as this way will get all column and all rows in 
-- the Employee table without any filtering 
	select * from Employee;


--	here it will show just the name column from employee table not all the columns, but all the rows.
	select name from Employee;

-- here it will show the name and the lastName columns only with all there rows.
	select name, lastName from Employee;

/*
	here it will show the id and the name columns only with not all row, but with rows that have the 
	condation after the where as it will check all rows to get only rows that have age greater than or
	equal to 25 and ignore all other.
*/
	select id, name from Employee where age >= 25;

/*
	here it will show all data in the employee table, but with the order of the age.
	the default order in sql is ascending.
	we should know that the data store in the table with the order of the primarey key not with the 
	order of insert, so when we show data it doesn't appear with the same order of insert. it appear 
	with the order of the primarey key so when we need to show data with anther order we use order by.
	we have to know that the select statement dosen't affect the the hard disk it just used to get data
	with the style you need without any effectance in hard disk.
*/
	select * from Employee order by age;

/*
	here it will show all data in the employee table, but with the order of the age.
	the default order in sql is ascending, but here we use desc to show data in descending order.
*/
	select * from Employee order by age desc;

/*
	here we concatnate the name column and the lastName column to show them in one column 
	named by fullName, that happen just in the output not in the hard disk as select doesn't affect hard disk.
*/
	select name+' '+ lastName  as fullName from Employee;

	select id, name+' '+ lastName  as fullName from Employee;

-- we could use the new name of the new column without as just the new name.
	select id, name+' '+lastName  fullName,age from Employee where age >= 22;

-- we use a squer bracket for the new column name as it has two part full and name so we use squer 
-- bracket to contane it 
	select id, name+' '+lastName  [full Name],age from Employee where age >= 22;

/*
	when we dealing with null we could not use the equal oprator = or > or < or!= as the null is not 
	value to use compare opratores with it so we use is null to ger insted of = null.
*/
	select * from Employee where depertment is null;

/*
	when we dealing with null we could not use the equal oprator = or > or < or != as the null is not
	value to use compare opratores with it so we use is not null to ger insted of != null.
*/
	select * from Employee where depertment is not null;

-- when we using the distinct statement it remove repeated values and order the shown data.
	select distinct name from Employee;-- order and remove repeated values

-- we us or to check multpil condation if ant condation occour then it will shown.
	select * from Employee where age = 22 or age = 20 or name = 'mahmoud'; 

	select * from Employee where age = 20 or age = 22 or age = 33;

-- here we use in insted of reapeat or to check the condations.
	select * from Employee where age in (20, 22, 33);

-- here we use and to check multpil condation, it is requer that all condation occour not only one. 
	select * from Employee where age >= 20 and age <= 25;
-- insted of using and like above to get values between two values we use between to get it.
	select * from Employee where age between 20 and 25;

	SELECT TOP (1000) [departmentNumber]
      ,[mergeSSN]
      ,[hireDate]
      ,[departmentName]
  FROM [DS].[dbo].[Department]
  select * from Department

/*
	in this command we want to display two columns from two diffrant tables, but 
	when using this command the result will be table has two columns firstName departmentName with 
	12 row and thid isn't correct in data as the first name column in employee table has only 
	three rows and the departmentName column in department table has four rows, so from where these 
	16 rows comes? 
	the answer to this question is that the two column are producted to each other so the result rows
	are the collection of the all rows in the first column with all rows in secand column.
	this command is not used, and good to use it.
*/
	select firstName, departmentNumber from Employee, Department; 
-- this command give the same result of the above command 16 rows.
	select firstName, departmentNumber from Employee cross join Department; 
-- to get the correct result we use the next command 
/*
	in this command we get match between depatmentNumber in employee table and departmentnumber in 
	department table and get result.
	in the result we found that the row of mohammed doesn't appear as its departmentnumber in emplyee
	table is null which doesn't match with any value in departmentnumber in department table 
*/
-- this type of join called inner join or equi join
	select firstName, departmentNumber from Employee , Department where 
	Employee.depatmentNumber = Department.departmentNumber;

-- there is anther way to use this join by using command inner join istead of comma, but then we should use on instead of where.
   	select firstName, departmentNumber from Employee inner join Department on 
	Employee.depatmentNumber = Department.departmentNumber; 

	select firstName, departmentNumber from Employee inner join Department on 
	Employee.depatmentNumber = Department.departmentNumber; 

-- and we could use the name of column without the name of tables, but this work only when the name
-- of columns aren't the same.
	select firstName, departmentNumber from Employee inner join Department
	on depatmentNumber = departmentNumber; 

/* 
	 there is anther join named outer join which has three type 
	 1- left outer join: 
	 this join used when we need to display all data in the left column if it match data in the right 
	 column or not. 

	 2- right outer join:
	 this join used when we need to display all data in the right column if it match data in the left
	 column or not.

	 3- full outer join 
	 this join used to display all data ine both two columns as if it match or not 
*/
	select firstName, departmentNumber from Employee left outer join Department
	on depatmentNumber = departmentNumber;-- three rows

	select firstName, departmentNumber from Employee right outer join Department
	on depatmentNumber = departmentNumber;-- four rows 

		select firstName, departmentNumber from Employee full outer join  Department
	on depatmentNumber = departmentNumber;-- five rows (lift + right - match data)


	                                   --self join 
/*
	this type of join appeare when we had self relationship 
	in the employee table we have SSN column as a pramary and superid as a forgen back to SSN
	when we need to display each employee and his leader we need a self join 

	in self join we have to make it shine to compilor the diffrance between the same table, so
	we create copy of our table in the memory and make it clear to compilor the diffrance between 
	the two tables (select X.firstname as employeeName, y.firstname as leaderName 
						from Employee X, Employee Y)
    here we make it clear to the compilor that we use two diffrant table by using two diffrent 
	letter to refare to each of them one as the orginal and the other as the copy in th memory.

	in this example we consder that the X table is the orignal table and the y table is the one
	on the memory so the X table must be child as it is the orignal and the Y table is the 
	parent as it is the copy, so the condation must be match with this deal, so the forgin key 
	in the child must refer to the primarey key in the parent so the condation is 
	(where y.SSN = X.Superid)<-- this is the condation.

	if the condation change it can't be run 
	 the forgn key in the child(orignal) refer to the primary key in the parent(copy).

	 we did so as each leader must lead employees, but not all employees have leader.
	 so the leader is primarey and employee id forgin as the primarey key dose'nt accept null, but forgin does.
*/
	select X.firstname as employeeName, y.firstname as leaderName from Employee X, Employee Y
	where y.SSN = X.Superid;


	                                 -- multi join 
/*
	to make multi join we need the realation between them even it doesn't direct 
	here we have a relation between employee and department and relation between department and 
	project, but there is no relation between employee and project. 
	
	to make a multi join we need a condation to the first two related tables and condation between one
	of the first two tables which related to the therd one.

	the condation here is the id of the employee(pk) is equal to the mergeid in the department(fk)
	and the secand contation is the departmentnumber in the department(pk) is equal to the
	departmentnumber in project(fk).
*/
	select firstname, d.departmentNumber, p.projactNumber from Employee e, Department d, Project p
	where e.ssn = d.mergessn and d.departmentnumber = p.departmentnumber;
	
/*
	also we could get inner join between mulit table by appling it to the first two table 
	then appling inner between the th result and the third table 
*/

	select firstname, d.departmentNumber, p.projactNumber from Employee e inner join Department d
	on e.ssn = d.mergessn 
	inner join Project p
	on d.departmentnumber = p.departmentnumber;



                                    -- join and update 
/*
	we could do join and update togther
	this state is useful wehn we need to update data in a column in a table 
	dopendant on the data in anther colum and anther table.
	
	in this example we need to incress the departmentnumber by 10 to all employee work in the 
	peoject number 117.
	As we know the projectnumber is a column in peoject table and departmentnumber is a column in 
	employee table so in the condation we couldn't make it dependated on the column we cannot access it
	so we join project table to employee table to have acess to it's column and make the condation 
	dependant on it.
*/
	update employee  
	set depatmentNumber += 10
	from employee e, project p
	where e.depatmentnumber = p.departmentnumber and projactNumber = 117;
	 


                                    -- isnull funcation 
/*
	in this funcation it check all rows in the column if it found any null value it change it with 
	secand value.
	in the first example we want to display the birthdate column, but if any value is null we want 
	to change it to the date of today 

	in the secand example we want to display gender, but if any row has null it will display 
	the ssn of the same row.

	if the data in the secand row is null too and we don't need any null data to be displayed 
	there is anther opation is to use coalesce() funcation
*/
	select isnull(birthDate, GETDATE())
	from employee;

	 select isnull (gender, ssn)
	 from Employee;


/*
	if the data in the secand row is null too so there is anther opation is to use 
	coalesce() funcation
	this funcation give us the abilty to us mulit choose to display if there is null

	in this this example we want to display the lastname column, but if ther is any null 
	it will display gender and if it found it null it will display 'no data'.
*/
	 select coalesce(lastname, gender, 'no data')
	from employee


	                               -- convert funcation
/*
	 in state of apply concat between data in two column in each of them has diffrent data type 
	 it cannot happen like 
	 select firstname +' '+ ssn from employee 
	 this command cannot be applied as the firstname column is type of string and ssn column is type
	 of int, so we have to use funcation to convert one of them to the ather

	 the funcation used is convert()
*/
-- in this example we convert the ssn column from int to varchar(10).
	select firstname +' '+ convert(varchar(10),ssn)
	from employee

/*
	in the above example if any value in any column is null this the result is null, as any thing 
	concat with null give null 
	to avoid this situation we us isnull() fumncation 
*/
	select isnull(firstname,' ') +' '+ convert(varchar(10),isnull(ssn,0))
	from employee;


	                               -- concate funcation
/*
	 in the above example the quere is hard to read as it is contaion mulit funcation,and this 
	 affect the performance of the programe, so there is anther funcation do the above concate 
	 in one step. this funcation is concate() funcation 

	 the concate funcation is resposable for convert any column to varchar, and delete any null 
	 value
*/
-- this	quere will change all column to string and check if any column has null value it will be deleted. 
	select concat(firstname,' ', ssn)
	from employee;


                                --like 
-- we could use like instead of using equal sign is the condation.
/* 
	the using of like is usfull when we didnot know all information about the row we have 
	such as when we but the condation to search about a name called ahmed, then we know the
	name so we use = to search(where firstname = 'ahmed';)
	but if just know that the name has the section 'ahm', then we cant use the = here as
	we didnot know all information about the name so we use like which will search for 
	all firstname that contaion the section 'ahm'
*/
	select * from employee -- here we know all information about the firstname
	where firstname = 'ahmed';
/*
	-- here we know that the firstname contain section 'ahm',but we have to use some oprator to help 
	compilor to search such as 
	'under score char'  "_" : mean that one char 
	"%" :mean that zero or more char
*/
	select * from employee 
	where firstname like 'ahm%';
-- 'ahm%' : mean that it start by section 'ahm' and had zero or  more char after that.
-- '%ed'  : mean that that end with section 'ed' and had zero or more char before it .
-- '%m%'  : mean that have m in somewhere in the word at start or medale or end.
-- '_a%'  : mean that the secand letter is a followed by zero or more char.
-- '%a-'  : mean that the secand letter from the end is a.
-- '[ahm]%' : mean that the word start with letter 'a' or 'h' or 'm' followed by zero or more letter.as the 
--             square bracket mean or.
-- '[^ahm]%' : mean that the word start with any letter except 'a' or 'h' or 'm'.  "^" mean not
-- '[a-h]%'  : mean that the word start with any letter beteen "a" and "h".
-- '[^a-h]%' :mean that the word start with any letter except the letters between "a" and "h".
-- '%[%]'   : mean that the word had % as a char in the end.
-- '%[_]%'  : mean that the word had _ as aletter in somewhere in the word .
-- '[_]%[_]': mean that start with _ and end with _ char.


									-- muilt order 
/*
	we could have a muilt order by using muilt columns after order by 
	the benfit of using this type of order is that help me when we have a repeated data in the first 
	column so when the compiler find a repeated data in the first column after the order by 
	it will order this repeated data by the secand column 

	in this example we want to order data of employee by the first name, but we know that we have a 
	repeated first name so we but the last name with  the first name to order the repeated data by 
	last name column.
*/
-- when the engin find a repeated data in the firstname column it will order this repeated data by the lastname.
	select * from employee 
	order by firstname, lastname;


-------------------------------Aggtete funcations------------------------------------------------------
-- first we should know that all aggtet fumcations neglegt the null value.

--1   sum() funcation

-- sum funcation is responsable for sum the data inside column without any null value 
-- this command will give the summation of the salary for all employees
select sum(salary)
from employee 
 

--2  max() funcation

-- max funcation is responsble for get the maximum value inside column
-- this command will give the maximum value in salary column
    select max(salary) as maxmiumValue
	from employee;


-- 3 min() funcation

-- min funcation is responsable for get the minmum value inside column 
-- this command will give the minmum value in salary column 
   select min(salary) as minmumValue
   from employee;


-- 3  count() funcation
 
-- count funcation is responsable for get the number of values inside the column or get the number
--  of the rows that have data except null 
-- thiscommand will give the number of employee in the table 
   select count(ssn)
   from employee;


-- 4  avg() funcation 
--  this funcation is responsable for get the average of data inside column
--  this command will give the average of the salary of the employee 
     select avg(salary)
	 from employee


--there is a way to get aggrete funcation with column. this happen by using groupby
  select min(salary), departmentnumber 
  from employee 
  group by departmentnumber;
/*
   the above example is used to get the minmum salary value in each department.
   the meaning of group here is to divide the all employees to groups depend on the department number 
   which each group must have the same departmentnumber so this divide our table to four group
   as we have four diffrent department number 20, 40, 70, 80
   each group has some number of employee after this divion happen then the minmum funcation will 
   get the minmum value of salary in each group. and display it with the number of department of each 
   group.
*/
-- to make it more clear lets take anther example

select count(ssn), superid
from employee
group by superid
-- this will give us the id of each leader and the number of employees that he leads


-- we colud use condation with aggrete funcation and with group, but we should know that the condation must be before group 
select count(ssn), departmentnumber 
from employee 
where superid in (2, 4)
group by departmentnumber 
/*
   this command will give us the number of employees in each department number which there leader 
   has id 2 or 4.
   
   the way this command excute is it first start with from then where then group then the select 
   this mean that this command first search for employee that have aleader with leader id equal 2 or 4
   this the group by will devided them to groups depended on the number of department they belong 
   and then get the number of employee in each group
*/


select sum(salary), deparmentnumber 
from employee 
where departmentnumber in (20, 40)
group by departmentnumber
/*
   this command will desplay the summation of salary for all employees belong to department number 20
   and the summation of salary for all employees belong to department number 40;
*/

-- we could use one of aggrete funcation in our condation, but in this sate we cannot use where for 
-- condation we have to use  having in this state instead of using where, and in this state the having condation comes after group

select sum(salary), departmentnumber 
from employee 
group by departmentnumber
having sum(salary)>5000;
/*
   in this example the way to excute this command is from then group then having then select
   this command will display the summation of salary for all department which has sum salary greatter 
   than 5000
*/

select sum(salary), departmentnumber
from employee
group by departmentnumber
having count(ssn)>1
/*
   this command will display the summation of salary and the number of department for each department 
   which have more than one employee on it.
*/


-- we could use where with having but where used where before group and having after group
select sum(salary), departmentnumber
from employee 
where departmentnumber in (20,40)
group by departmentnumber
having count(ssn)>1
/*
    this command will display summation and number of department that in 20 and 40 
	and have more than one employee
*/



/*
     this command will make all null value zero and then get the average of the the salary 
*/
 select avg(isnull(salary))
 from employee 

 

/*
   in the next quere we want to display the summation of the salary for each department and the name 
   of each department. as the departmentname column and the departmentnumber column are not in the same 
   table(departmentnam in department, and departmentnumber in employee) we need to join both tables
   and also we need to group by both column which display in  the select statement.
*/
select sum(salary), e.departmentnumber, d.departmentname
from employee e inner join department d
on e. departmentnumber = d.departmentnumber
group by e.departmentnumber, d.departmentname


/*
    in the next example we want to display the average salary for departmentnmber and has the leader
	and display the id of the leader

	in grouping we group departmentnumber and superid whic give us five groups one for departmentnumber
	20 with null leader as there is an employee in department 20 has no leader(employee 1)
	the secand for department 40 with leaderid 1 which has two employee(employee 2, 3)
	the third foe department 70 with leaderid 1 which has one employee(employee 4)
	the fourth for department 80 with leaderid 3 which has one employee (employee 5)
	the fivth for department 20 with leaderid 4 which has two employee (employee 6, 7).
*/
select avg(salary), departmentnumber, superid
from employee
group by departmentnumber, superid;

----------------------------------------------------------------------------------------------------------------
----------------------------------------------sub quere------------------------------------------------

-- we could use the output of quere as an input in anther quere
/*
    in the next quere we use sub quere in the condation
	before anythink we should know the meaning of this quere 
	we want to display all information about all employees who's salary is greater than or equal to the
	avrage of salary for all employees 
	as we can't use an aggrete funcation in where condation and we need the avarge of salary in
	our condation so we use the sub quere to get the avarage and use this value in our condation.
	(select avg(salary) from employee) this quere give the avarge and then we compare it with salary
	for each employee.
*/
select *
from employee
where salary >= (select avg(salary) from employee)


-- the using of sub quere is not for select but we could use it with insert, update, delate and other quere
/*
    the next quere will rename the the last employee in the table;
	as the sub: (select count(ssn) from employee); will get the last ssn then it will be used in the
	update quere;
*/
update employee 
set firstname = 'omer'
where ssn = (select count(ssn) from employee);

/*
    this quere display the number of department that have employee
*/
select departmentnumber
from department 
where departmentnumber in (select departmentnumber from employee);

-------------------------------------------------------------------------------------------------------
-------------------------------------unionfamily-------------------------------------------------------
 
-- union all

/*
   union all is used to dispaly more than one quere in the same table sheet 
   in the next quere we want to dispaly the first name of the employee and  the last name of employee 
   in the same sheet so the number of rows will be 14 rows seven rows for the first name and seven for 
   the last name;
*/
   select firstname from employee
   union all 
   select lastname from employee


--  union 
 /*
     the using of union is to order and delete the repeating rows to display two quere togther 
	 it is look like distinct as they order and delete the repeating value.
	 the output in the next quere is 10 rows as the union deleted the repeating  rows
*/
select firstname from employee
union 
select lastname from employee


-- intersect 
/*
    intersect is oppsite of the union as it display only the repeating values after order them.
	in this quere the output will be one row which has value 'mahmoud'
	as it is the only repeating value.
*/
select firstname from employee
intersect  
select lastname from employee

-- excet 
/*
     except is used to display the output from the first quere which not repeated in the secand quere
	 
	 in this quere the output will be the firstname of employee which not in the secand quere(lastname 
	 of employee.
*/
select firstname from employee 
except 
select lastname from employee 



--------------------------------------buildin funcation-----------------------------------------------
-- aggrate funcation 
-- convert()
-- getdate()
-- coalesce()
-- concat()
-- isnull()
-- year()
-- month
-- substring()
-- db_name()
-- suser_name()
select year(getdate())
select month(getdate())

/*
  *substring funcation is used to get a sub string of any date of type varchar.
  *this funcation take three parameter the string, the number of the start index, and the lenth of the sub.
  *the number of the first letter of the any string is one.
*/
-- this quere display the first three letter of each employee firstname.
select substring(firstname, 1, 3)from employee;

-- db_name is a funcation used to get the name of database used .
select db_name();-- DS

-- suser_name is a funcation used to get the name of user of the database
select suser_name()--DESKTOP-LQQUC45\mahmo


----------------------------------------------top() funcation------------------------------------------------------------------------
/*
    *top() funcation is used to get top of table or the first rows in the table 
	*top usd with an intger parmeter as the naumber of rows that to bo select from the table 
	*the next quere is used to get the first three rows from employee table 
	*we mention before that the the data stored in table is stored order by the primarey, so select will display the first three 
	 employee in the table order by the primarey key.
*/
select TOP(3) *
from employee;

-- this quere diaplay the first three firstname from employee table. 
select top(2) firstname 
from employee;

/*	
	* to get the maxmum top salary we firsr order the salary column then we select the top(2) of it.
	* we have to order it by desc to order it from bigger to smaller.
*/
select top(2) salary
from employee 
order by salary desc

-------------------------------------------------------top() with ties------------------------------------------------------------------
 
 /*
	* top() with ties: is used with order.
	* the condation to use top() with ties is to use order by with it 
	* in this quere the order by is occer at first then select top(3) 
	* with ties mean with repeated value.
	* in this command the table of employee first order ascending by departmentnumber then top(4) selected, if we have a repeated value 
        in the fourth row the repeating value will be selected even when the top(4) selected so we find that this quere display 
		five rows not only four rows.
	* if we make the order descending by department then the output to this quere will be four columns as the third  row has arepeated value
	    so we select it to be the fourth row in our top and search for any repeating value row has the same department number, if we 
		find any row it will be displayed with the top(4).
	* so we have to know that the order occer before the select occer and the "with ties" select the repeating value depend on the order
	   and display it with the top or juest select the top if there is no repeating value.
*/
 select top(4) with ties * 
from employee
order by departmentNumber;


 select top(4) with ties * 
from employee
order by departmentNumber desc;

---------------------------------------------------------newid() funcation---------------------------------------------------------------

-- newid() funcation is used to get new unique and random id 
-- in the next quere each employee will take a new unique and random id 
select *, newid()
from employee;

/*
	* we could use the newid funcation to select a number of rows by a random way like in lotter when the wineer choosen by a random way
	* in the next quere we will order the employee table by newid()(the random and unique id) this order will make table random 
	   with actuall id in the table so when we select the top(3) from the table after this order we will get three random table.
*/

select top(3)* 
from employee
order by newid()


-------------------------------------------------------------exection order--------------------------------------------------------------

/*
	* when we run the next quere it get the output order by the full name, bur if there is an condation on the fullname this will get error
	   where fullname = 'ahmed ali'
	   this condation will get error because the exction order of the condation come before the select so the condation command can't see 
	   the fullname, so we have to know the order of exection.

	1- from.
	2- join.
	3- on.
	4- where.
	5- group.
	6- having.
	7- select [distinct, aggreget] 
	8- order.
	9- top.

    * so if any command come before ather command that depend on the result of the forward command this will make an error.
*/
select firstname + ' ' + lastName as fullName
from employee
order by fullName;


--------------------------------------------------------full path--------------------------------------------------------------------------

-- the full path is the to access any table from ather data base or even from ather server. 
-- [server_name].[database_name].[sechem].[table_name]  <===  the form of full path.
-- in the next quere i access data from iti database even when i am in DS database. this happen by th full path access.
select *
from [DESKTOP-LQQUC45].[ITI].[dbo].[student];

/*
	* we could make a join or union between two table from diffrent database using full path.
	* in the next quere we make a union between the datpartmentname from comapany_sd database and the departmentname from iti database
	   using full path.
	* we put the name of server in the squer bracket because it consist of two parts DESKTOP and LQQUC45 so we have to use squer bracket.
*/
select dname
from [DESKTOP-LQQUC45].comapany_sd.dbo.department
union all
select dept_name
from [DESKTOP-LQQUC45].iti.dbo.department;

---------------------------------------------------------select into------------------------------------------------------------------

-- select into used to copy data from table to anther table.
-- in the next quere we will copy data from employee table to anther table (table2). the meaning of copy data is copy structer with data.
select * into table2
from employee;

-- if we select * from table2 we will get the table exactially like emoloyee as table2 is copy of it.

-- in the next quere we will copy table from ds data base to iti database and that is avilable with full path.
select * into [DESKTOP-LQQUC45].iti.dbo.newtable
from employee;

-- we could copy one or more columns from table to ather table. this command will creat new table and copy firstname ane lastname columns 
--   the new table. 
select firstname, lastName into table3
from employee;


/*
	* in the next quere we will copy the structure without data 
	* this happen when we but an impossable condation like when we use the 1 = 2 condation, this condation cant be happen
*/
select * into table4
from employee
where 1 = 2; -- as this condation can't be happen so this quere will copy the only the structur without data, so we will find table4 like 
             --   the employee table but with out data. the table4 will contain only the name of column and its data type.



---------------------------------------------------insert based on select------------------------------------------------------------------

-- if we need to copy data from table to anther table without copying the instructure we can't use select into as it copy data with structure
-- so we could use indert based on select 

/*
	* in the nexy quere we will copy data from employee to table5.
	* table one must be created and has the same structure of the employee before coping, as we can't copy to table does'nt exsist.
*/
create table table5(name varchar(50) NOT NULL, age int, id int primary key, depertment varchar)
-- or we could use the copy structure by select into and impossible condation.
select * into table5
from employee;
-- then we will use insert based on select to copy data .
insert into table5
select * from employee;-- to execut this quere the table5 must has the same structure of employee table.


-----------------------------------------------------having without group by--------------------------------------------------------------

-- we could use having without group by if we have no columns in select statement and the condation has an aggreget funcation 

/*
	* in the next quere we have an aggreget funcation in the select statement without any columns and we have an aggreget funcation 
	    in condation.
*/
select sum(salary) 
from employee
having count(ssn)<100;-- this is the only way to use having without group by, as in this case the engine conseder that the all table is
--							one group as there is no columns in select statement, but if we use any column in select statement then 
--							we have to use group.




------------------------------------------------------------Ranking function------------------------------------------------------------

-- these functions could solve some setuaion couldn't be solved without it. Like when we want to display information about 
-- the secand bigger salary we can't use top() here as it dispaly the first top salary so these function solve these problem
-- any ranked function must have over function with order by.
-------------------------------------->>>>>Row_Number()
/*
	* the first ranking function is row_number(). this function is used to order the table and give each row number, so when we want to 
	   select any row then we could but a condation to check this row number
	* in the next quere we use the rownumber function in the select statment with over() function.
	* we can't use any ranking function without over function to order the table so we use over funcation to order the table 
	* after ordering the table the new table will be created at the run time or the memorey the new table will be sorted with salary, and
	   the new table will have a new column called RO this column has a number for each row number from 1,2,3........ and so on
	   these number is order to the rows.
	* in the where statement we but a condaion RO = 2 this mean that display the row which has the value 2 in RO column, so it will display
	  the secand row after order 
	* we sould notic that we use a sub quere here as we can't use where condation directly because the select statement which incloud 
	   the RO column execute after the where statement so the condation can't see the RO column as it hasn't execute yet.
	   so we use a sub qurer to execute the select statement in the sub quere before the where statement
	* in this quere the output may be the scand biggist salary or the biggest one . it is depend on if there is any reapeted salary or not 
	   if the biggest salary is repeated then the output will be the biggest salary as the first and the scand rows will have the same 
	   value. and if the biggest salary doesn't repeated then the output will be the secand biggest salary.
*/
select * 
from (select *, Row_Number() over(order by salary desc) as RO
        from employee ) as newtable
where RO = 2;


------------------------------------------------->>>>>Dense_Rank()
/*
	* the secand ranking funcation is Dense_Rank(). this funcion is used to order the table and give each row number, but with 
	  diffrent way not like the one before.
	* this funcation is order arrangment this mean this funcation give each row a number depend on the value of the ordered column 
	   so if we has a repeated value in the ordered column this function will give all the repeated value the same number 
	   so if we want to display the secand biggest salary this is the best function to use as it will display the secand biggest salary 
	   and its repeated value (all rows that has the same value).
*/
select * 
from(select *, Dense_Rank() over(order by salary desc) as DR
       from employee )as newtable
where DR = 2; -- this will display all rows that have DR = 2;

-- if we change the condation to where DR <= 2 this mean we need to display the first two biggest salary with repeated.


------------------------------------------------>>>>>>NTiles()
/*
	* this function is used to divied the table into groups as you like
	* there is an condation to divied is the last group mustn't has number of rows less than the first group by more than one 
	* in the next quere we will divied the table into four two group and we will find that the last group is less than the 
	   first group by one.
*/
select *
from (select *, NTiles(3) over(order by salary desc) as g)as newtable
where g = 2;


----------------------------------------------->>>>>>>Rank()
/*
	* this function is used to order the table and get the same value to the repeated rows but it cancle the order of the repeating rows
*/
select *
from (select *, Rank() over(order by salary) as R
       from employee)as newtable
where R = 4;



---------------------------------------------------partition by----------------------------------------------------------------------
--
-- we could use partition by with ranked functions
/*
	* partition by is used to divied the table into group. it work like group by
	* in the next quere the first thing is the partition will divied the table into groups depend on the department number 
	   after that it will order rows in each department by the salary value then it gives each row an order number start with one,
	   but after each group end it will be start th next group by order number start with one again.
	* so in the next quere it will diplay the biggest number of salary in each group. 
*/
select *
from (select *, row_number() over(partition by departmentNumber order by salary )as RN
        from employee) as newtable 
where RN = 1;

-- this partition could be used with any ranked function.


---------------------------------------------------------Data Type----------------------------------------------------------------

------------------------------------------->>>>>> numeric 
-- bit           0:1      it is like boolean in java       ture:false
-- tinyint       1byte    -128:127   we could use unsinged with it to allow just postive number from 0:255
-- smallint      2byte    -32768:32767    unsinged 0:65555555
-- int           4byte
-- bigint        8byte

------------------------------------------>>>>>> Decmial 
-- smallmoney    4byte     allow .0000
-- money         8byte     allow .0000
-- real                    allow .0000000
-- float                   allow .00000000000000000000000000
-- dec           dec(5, 2) this mean the number consist of five digits two of them are decmal like   225.14


----------------------------------------->>>>>> char
-- char()           we put number between the brackets this number refare to the number of cahr in will be saved
--                  when we use char(10) this meaning fixed length charcater which will save 10 bytes in space for this command and these
--                  bytes  will be saved even if you didn't use it.

-- varchar()        here if we use varchar(10)this meaning dynamic length charcater which will save 10 bytes in space for this command and these
--                  bytes will be saved if you use it, but if you didn't the engain didn't save it

-- nvarchar()       this meaning unicode and this data type uses with any langage because it doesn't used for spacefic langage like two 
--                  data type before it used with arbic. so if we use any langage excpet english we have to use it 

-- nchar()          this meaning unicode and this data type uses with any langage because it doesn't used for spacefic langage like two 
--                  data type before it used with arbic. so if we use any langage excpet english we have to use it 

-- nvarchar(max)    up to 2 gigabyte.


--------------------------------------- >>>>>>> Data time
-- Date              MM/DD/YYYY
-- Time              HH:MM:S    it could use nano secand 
-- Time(7)           HH:MM:S    it could use to get 10 milon part of secand 
-- smalldatetime     MM/DD/YYYY  HH:MM:S
-- datetime          MM/DD/YYYY  HH:MM:S        get bigger scal of time and date
-- datetime()
-- datetimeoffset    date and time with time zone   like  12/6/2022   10:30  +2:00   plus 2 here mean with cairo timezone


---------------------------------------->>>>>>> Binary
-- binary      000000111111
-- image       use to save photes in database as an binary


---------------------------------------->>>>>> other
-- Xml
-- unique_identifier
-- sql_variant



------------------------------------------------------------case statement-------------------------------------------------------------------
-- cas statement used to check condations 
/*
	* in the next quere we use case statement with when to check if salary >= 3000 then we will display 'high salary'
	   if this condation doesn't occare then it will check the next condation if salary < 300 then it will display 'low sal'
	   if this condation doesn't occare then it will print the else statement and print 'no valur'.
	* after we end our condations we have to use end at the end.
*/
select firstname,
				case
				when salary >= 3000 then 'high salary'
				when salary < 3000 then 'low salary'
				else 'no value '
				end
from employee;


-- case with update
/*
	* in the next quere we will update salary with 10% for all employee who's salary is greater than 3000. 
	   ans update salary with 20% for all employee who's salary is less than 3000.
	* this update is used to chang some group of rows with some condation.
*/
update employee 
set salary = 
              case 
			  when salary >= 3000 then salary * 1.10
			  else salary * 1.20
			  end;


---------------------------------------------------------iif statement----------------------------------------------------------------

-- iif statement is used to check one condation, it had a formate iff(condation, true, false)
-- in the next quere we check if the salary is greater than 3000 and if it ok print 'high salary' else print 'low salary'
select firstname, iif(salary >= 3000, 'high salary', 'low salary')
from employee;


--------------------------------------------------------convert date to string-----------------------------------------------------------

-- first with convert 
-- its formate is convert(new datatype, old datatype)
select convert(varchar, getdate())
from employee

-- secand with cast 
-- its formate is cast(old datatype as new datatype);
select cast(getdate() as varchar)
from employee;

--------------------------------------------------------formate statement---------------------------------------------------------------

-- formate statement is used to chang the formate of the output
-- in the next queres we will chang the formate of the date to lot of formate as we like 

select format(getdate(), 'dd/ mm/ yyyy');--04/ 50/ 2023
select format(getdate(), 'dddd- mmmm- yyyy');--Saturday- 50- 2023
select format(getdate(), 'ddd mmm- yyyy');--Sat 50- 2023
select format(getdate(), 'ddd');--Sat
select format(getdate(), 'MMM');--Mar
select format(getdate(), 'yy');--23
select format(getdate(), 'hh: mm: s');--04: 50: 7
select format(getdate(), 'dd/ mm/ yyyy hh:mm:ss');--04/ 50/ 2023 04:50:07


------------------------------------------------------eomomth----------------------------------------------------

-- end of month is used to get the last day in the month
select format(eomonth(getdate()), 'dddd');--Friday




 select top(2) *
 from employee
-- in my sql we use limit instead of top
/*	
	select *
	from employee 
	limit 5;
*/


select * 
from (select *, ROW_NUMBER() over(order by ssn )as rn
		from employee)as newtable
where rn > 3 and rn < 8;

/*
	 in my sql we could use  offsit with limit to display the same result 

	 select * from employee 
	 offsit 4 limit 4;

	 or we could use the following 

	 select * from employee 
	 limit 4, 4;
*/



-- this quere will select all employee whoes gender are not mail, or it will select only femail.
select * from employee 
where not gender = 'm';




------------------------------------------------------------sp_rename-----------------------------------------------------------------

/*
	* we could use sp_rename to rename the table or to rename the column to new name 
	* exec sp_rename 'tablename.columnOldName', 'newColumnName';    -- this could be used to chang the name of the column 
	* exec sp_rename 'oldTableName', 'newTableName';  -- this could be used to chang the name of the table.
	* this the way to change the name of the table and the name of the column.
	* in the next quere we will add a new column with name new_column then we will chang it using sp_rename;
*/
alter table employee add new_column int;

exec sp_rename 'employee.new_column', 'old';
select * from employee;


alter table employee add constraint ssn check (ssn > 0);
