# Write your MySQL query statement below
select d.Name Department, e.Name Employee, e.Salary
from employee e left join department d on e.departmentid=d.id
    left join (
    select
        id,
        coalesce(
            (select distinct e1.salary from employee e1 where e1.departmentid=d1.id order by e1.salary desc limit 1 offset 2),
            (select distinct e1.salary from employee e1 where e1.departmentid=d1.id order by e1.salary desc limit 1 offset 1),
            (select max(e1.salary) from employee e1 where e1.departmentid=d1.id)) boundary
    from department d1
    ) boundaries on d.id=boundaries.id
where e.salary>=boundaries.boundary
order by d.Name, e.Salary desc, e.Name