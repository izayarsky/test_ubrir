SELECT wrk.id, wrk.name, d.name
FROM 
(
	SELECT w.id, name, department_id
	FROM
			(SELECT id, name, salary, department_id 
			FROM employee) AS w	
		INNER JOIN 
			(SELECT department_id as d_id, MIN(salary) as m_sal
			FROM employee
			GROUP BY d_id) AS d
		ON w.department_id = d.d_id
		WHERE w.salary = d.m_sal
) AS wrk	
INNER JOIN department AS d ON wrk.department_id = d.id
