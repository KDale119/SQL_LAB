-- question 1
SELECT count( * ) 
  FROM employees;


-- question 2
SELECT  count(*) from employees
where ReportsTo is not null;

--question 3
SELECT distinct title
from employees;

--question 4
SELECT count (distinct title)
from employees; -- access how many diff titles there are

-- question 5
SELECT * from employees
  where title= 'IT Staff';
  
-- question 6
SELECT * from employees
  where title= 'IT Staff' and city = 'Lethbridge' and PostalCode = 'T1H 1Y8';
  
-- question 7
SELECT *  
  FROM employees
  where hiredate >= '2003-10-17 00:00:00';
  
--question 8
SELECT *  
  FROM employees
  where hiredate > '2002-01-10 00:00:00' and hiredate < '2003-01-01 00:00:00';
  
--question 9
SELECT max(BirthDate), firstname, lastname
  FROM employees;

-- question 10
SELECT min(HireDate), firstname, lastname
  FROM employees;

-- question 11
select firstname, lastname 
from employees
where substring(firstname, 1, 1)= substring(lastname, 1, 1);

--question 12
select *
from employees
where city = 'Calgary' and state = 'AB';

-- question 13
select * 
from employees
where phone like '+1 (403)%';

-- question 14
select firstname, lastname, phone, count(*) c
from employees
group by phone having c > 1; -- displays how many dup numbers there are

-- question 15
select * 
from employees
where reportsto in (select EmployeeId from employees where firstname ='Michael' and lastname = 'Mitchell');

-- question 16
select Length(lastname) as 'length of last name', firstname, lastname
from employees;

--question 17
select Length(lastname) as 'length of last name', firstname, lastname
from employees
order by firstname;

--question 18;
select *
from employees
where city = 'Edmonton' or city = 'Lethbridge';

--question 19
select avg((julianday('now') - julianday(BirthDate))/365)
from employees; -- average age of emps based on DOB

--question 20
select * 
from employees
where title = 'Sales Support Agent'
limit 2;

-------------------------------------------part 2

--question 1
select title, name
from albums
inner join artists using(ArtistId);

-- question 2
Select name, title
from artists
left join albums using (ArtistId)
order by name;

--question 3
select name, title
from artists
left join albums on
artists.ArtistId = albums.ArtistId
where title is null
order by name;

--question 4
select distinct e1.City, e1.FirstName, e1.LastName
from employees e1
inner join employees e2 on e2.city = e1.city
and
(e1.FirstName <> e2.FirstName and e1.LastName<> e2.LastName)
order by e1.city;

--------------------------- Part 3

-- question 1
select customerid, firstname, lastname, 
case country
when 'USA'
then 'Domestic'
else 'foreign'
end CustomerGroup
from customers
order by lastname, firstname;