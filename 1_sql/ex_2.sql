SELECT d.name, count() as cnt_workers_less_50k
FROM employee as e
INNER JOIN department as d ON e.department_id = d.id
WHERE salary > 50000
GROUP BY d.name
HAVING cnt_workers_less_50k < 5