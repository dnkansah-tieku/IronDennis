# Write a query to print the ID, FIRST_NAME, and LAST_NAMEs of the customers whose combined name length, i.e., the sum of the length of the FIRST_NAME and LAST_NAME, 
# is less than 12. The IDs and names should be printed in the ascending order of the combined name length. If two or more customers have the same combined name length, 
# sort the result in lexicographical order of the full names, ignoring case. If two or more customers have the same full name, sort those results by ID, ascending.


SELECT 
    ID, CONCAT(first_name, ' ', last_name) AS 'Customer Name'
FROM
    lab_work.customer
WHERE
    (LENGTH(first_name) + LENGTH(last_name)) < 12
ORDER BY first_name , last_name , ID ASC
LIMIT 10;


#Given two tables,\'a0Employee\'a0and\'a0Department, generate a summary of how many employees are in each department. Each department should be listed, 
#whether they currently have any employees or not. The results should be sorted from high to low by number of employees, and then alphabetically by department
# when departments have the same number of employees. The results should list the department name followed by the employee count. The column names are not tested, so use whatever is appropriate.\

SELECT 
    depart.name AS 'Department Name',
    COUNT(*) AS 'No of Employees'
FROM
    lab_work.employee AS Emply
        RIGHT JOIN
    lab_work.department AS depart ON emply.dept_id = depart.id
GROUP BY depart.name
ORDER BY COUNT(*) DESC , depart.name;

# There are two data tables with employee information: EMPLOYEE and EMPLOYEE_UIN  Query the tables to generate a list of all employees who are less than 25 years old first in order of NAMEthen of ID 
# both ascending. The result should include the followed by the NAME.

select * from employ_ee
inner join employee_uin using (id)
 where age < 25
 order by name, ID asc;
 
## A company maintains EMPLOYEE table with information for each of their employees. Write a query to produce a list containing two columns. 
## The first column should include the name of an employee who earns less than some other employee. The second column should contain the name of a higher earning employee.
## All combinations of lesser and greater earning employees should be included. Sort ascending, first by the lower earning employee's ID, then by the higher earning employee's SALARY.














