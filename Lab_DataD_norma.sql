# Write a query to print the ID, FIRST_NAME, and LAST_NAMEs of the customers whose combined name length, i.e., the sum of the length of the FIRST_NAME and LAST_NAME, 
# is less than 12. The IDs and names should be printed in the ascending order of the combined name length. If two or more customers have the same combined name length, 
# sort the result in lexicographical order of the full names, ignoring case. If two or more customers have the same full name, sort those results by ID, ascending.


select ID, first_name, last_name, length(first_name)+ length(last_name) as LENGTH from lab_work.customer 
where (length(first_name)+ length(last_name)) <12
order by length asc, first_name, last_name, ID asc
limit 10;


#Given two tables,\'a0Employee\'a0and\'a0Department, generate a summary of how many employees are in each department. Each department should be listed, 
#whether they currently have any employees or not. The results should be sorted from high to low by number of employees, and then alphabetically by department
# when departments have the same number of employees. The results should list the department name followed by the employee count. The column names are not tested, so use whatever is appropriate.\

select depart.name as 'Department Name', count(*) as 'No of Employees'
from lab_work.employee as Emply
right join lab_work.department as depart
on emply.dept_id = depart.id
group by depart.name
order by count(*) desc, depart.name;

# There are two data tables with employee information: EMPLOYEE and EMPLOYEE_UIN  Query the tables to generate a list of all employees who are less than 25 years old first in order of NAMEthen of ID 
# both ascending. The result should include the followed by the NAME.

select name, dept_id
from employee as X 
inner join employee_uin as Y
on x.id = y.id;

















