SELECT 
    emp_id,
    department,
    salary,
    PERCENTILE_CONT(0,90)
    WITHIN GROUP (ORDER BY salary)
    OVER (PARTITION BY department) AS percent
FROM employees
ORDER BY department, salary;