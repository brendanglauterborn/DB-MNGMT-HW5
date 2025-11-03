/* 1. Get supplier names and numbers for all suppliers who 
supplied part P3 and whose name begins with letter A.
 */

select distinct s.sname, s.s_num 
from S as s 
	join SPJ as spj on s.s_num = spj.s_num
    where spj.p_num = 'p3'
    and s.sname like 'A%';
    
/* 2. Get supplier names and numbers for all suppliers whose name (supplier name) 
begins with letter A and who supplied parts whose name (part’s name) begins with setter S. */

select distinct s.sname, s.s_num
from S as s
	join SPJ as spj on s.s_num = spj.s_num
    join P as p on p.p_num = spj.p_num
    where s.sname like 'A%'
    and p.pname like 'S%';
    
/*3. Get supplier names for suppliers who supplied for job J2. (Use a nested query)*/

select s.sname
from S as s
where s.s_num in (
	select spj.s_num
    from SPJ as spj
    where spj.j_num = 'j2');
    
/*4. Get supplier names for suppliers who supplied parts for jobs only in Athens. (Use a nested query)*/
select s.sname 
from S as s
where s.s_num not in ( 
	select spj.s_num
	from SPJ as spj
    where spj.j_num not in (
		select j.j_num
        from J as j
        where j.city = 'Athens' ));
/*5. Get part names for parts that are not supplied for job J3. (Use a nested query)*/
select pname
from P
where p_num not in (
	select p_num from SPJ where j_num = 'J3'
);

/*6. Which city has the most suppliers? (Use a nested query)*/
select s.city
from S as s
group by city
having count(*) >= all(
	select count(*)
	from S as s
	group by s.city );

/* 7. Get supplier numbers and names for suppliers whose status is greater 
than status values of all suppliers in located Paris. */
select s.sname, s.s_num
from S as s
where s.status > all (
	select s.status
    from S as s
    where s.city = 'Paris' );
    
/*8. Calculate each supplier’s total sales quantity and get the sales 
person’s name if the sales person supplies parts more than 1000 units in total. */
select s.sname, sum(spj.qty) 
from S as s
	join SPJ as spj on s.s_num = spj.s_num
	group by s.sname
    having sum(spj.qty) > 1000;
    
/* 9. Get job numbers for jobs whose city is first in the alphabetical list of the job cities. */
select j.j_num 
from J as j
where city = (
	select min(j.city)
    from J as j );
    
/* 10. Increase the status values of suppliers by 5 who are located in Paris. */
SET SQL_SAFE_UPDATES = 0;
update S
set status = status + 5
where city = 'Paris';

select status from S
where city = 'Paris';

/* 11. Change the name to ‘Hammer’ of parts that are Red and located in London and whose name was Screw. */

update P
set pname = 'Hammer'
where color = 'Red' and city = 'London' and pname = 'Screw';

select pname from P

/* 12. Delete all jobs in Rome and all corresponding part shipments. (Please use 2 queries) */ 

delete from SPJ
where j_num in (
	select j.j_num
    from J as j
    where city = 'Rome' );
    
delete from J
where city = 'Rome';

select city from J;
select j_num from SPJ;

/* 13. Please create a “view table” supplier_shipment that shows each supplier and its total shipment quantity. */
Drop view if exists supplier_shipment;
create view supplier_shipment as 
select s.sname, sum(spj.qty) as sum_qty
from S as s
	join SPJ as spj on spj.s_num = s.s_num
    group by s.sname;
select * from supplier_shipment;

/* 14. Please try to increase Smith’s total shipment by 100 in the view table you created in question 13. 
Then discuss what happens when you try to update the view table. */

update supplier_shipment
set sum_qty = sum_qty + 100
where sname = 'Smith';

/* 15. Please create a base table supplier_shipment that shows each supplier and its total shipments from S and SPJ tables.*/
Drop view if exists supplier_shipment;
create table supplier_shipment as 
select s.sname, sum(spj.qty) as sum_qty
from S as s
	join SPJ as spj on spj.s_num = s.s_num
    group by s.sname;
select * from supplier_shipment;

/* 16. Please repeat question 14 on the base table (Real table) supplier_shipment and discuss the result.*/

update supplier_shipment
set sum_qty = sum_qty + 100
where sname = 'Smith';
select * from supplier_shipment;

/* 17. Among parts that are used in projects(jobs), find out the most used parts in each project(job). */
    

select spj.j_num, max(spj.qty) as max_qty
from SPJ as spj
group by spj.j_num;





	