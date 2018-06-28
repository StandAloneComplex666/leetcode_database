SELECT a.name AS "Employee" FROM employee a, employee b
    WHERE a.managerid = b.id AND a.salary > b.salary;