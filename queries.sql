-- Query to view all employees
SELECT employee.id, employee.first_name, employee.last_name, role.title, department.name AS department, role.salary, CONCAT(manager.first_name, " ", manager.last_name) AS manager FROM employee INNER JOIN role ON employee.role_id = role.id INNER JOIN department ON role.department_id = department.id LEFT JOIN employee AS manager ON employee.manager_id = manager.id ORDER BY ID ASC;

-- Query to view all roles
SELECT title FROM role;

-- Query to view all departments
SELECT name AS department_name FROM department;

-- Query to view all managers
SELECT CONCAT(first_name, " ", last_name) AS manager FROM employee WHERE manager_id IS NULL;
