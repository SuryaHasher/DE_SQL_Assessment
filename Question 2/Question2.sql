SELECT d.department_name, AVG(e.salary) AS average_salary
FROM departments d INNER JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;