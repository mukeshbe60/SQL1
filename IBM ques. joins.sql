select * from employee;
select * from (select * from employee order by salary desc)where rownum <3;

---------------IBM SQL============
--highest salary---

select * from employee where salary = (select max(salary) from employee)

--second highest salary---

select max(salary) from employee where salary < (select max(salary) from employee)
select * from employee

-- dept max salary

select dept ,max(salary) from employee group by dept 


----------------------joins------------------------

drop table table_1;
create table table_1
(id int);

drop table table_2;
create table table_2
(id int);

insert into table_1 values (1),(1),(1),(2),(3),(3),(3);
insert into table_2 values (1),(1),(2),(2),(4),(null);

SELECT * FROM table_1;
SELECT * FROM table_2;


--- inner join --
select * from table_1 t1 inner join table_2 t2 on t1.id = t2.id;

8

--- left join -- inner join + elements additionally in left table but not in right table
-- so 8 + 3 = 11

select * from table_1 t1 left join table_2 t2 on t1.id = t2.id;

--- right join -- inner join + elements additionally in right table but not in left table
-- so 8 + 2 = 10

select * from table_1 t1 right join table_2 t2 on t1.id = t2.id;

--- Full join ------------------
-- = inner join + 
			-- + additional elements additionally in left table but not in right table
			-- + additional elements additionally in right table but not in left table
--- 8+3+2 = 13

select * from table_1 t1 full join table_2 t2 on t1.id = t2.id; 

--- Cross join ------------------
-- basically matches all records

---6 * 7 = 42

select * from table_1 t1 CROSS JOIN table_2 t2;

--- Natural join  ------------------
-- if column name is same it ll do inner join  -- 8 [in our example]
--- if col name is differnt it ll do cross join  = 42 

select * from table_1 t1 NATURAL JOIN table_2 t2;


---------------Scenario 2


create table table_3
(id int);

create table table_4
(id int);

insert into table_3 values (1),(1),(1),(1),(1),(null),(null);
insert into table_4 values (1),(1),(1),(2),(null);

SELECT * FROM table_3;
SELECT * FROM table_4;
 ---- 2 nulls are not same is different only
 
-->> INNER Join --- 15
SELECT *
FROM table_3    t3
JOIN table_4    t4 on t3.id = t4.id;


-->> LEFT Join  - 17
SELECT *
FROM table_3        t3
LEFT JOIN table_4   t4 on t3.id = t4.id;


-->> RIGHT Join -- 17
SELECT *
FROM table_3        t3
RIGHT JOIN table_4  t4 on t3.id = t4.id;


-->> FULL Join -- 19
SELECT *
FROM table_3        t3
FULL JOIN table_4   t4 on t3.id = t4.id;


-->> NATURAL Join ----15
SELECT *
FROM table_3            t3
NATURAL JOIN table_4    t4;


-->> CROSS Join  - 35
SELECT *
FROM table_3        t3
CROSS JOIN table_4  t4; 



