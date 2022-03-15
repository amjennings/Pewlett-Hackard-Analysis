SELECT e.emp_no,
    e.first_name,
    e.last_name,
    t.title,
    t.from_date,
    t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t 
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
    rt.emp_no,
    rt.first_name,
    rt.last_name,
    rt.title
-- INTO unique_titles
FROM retirement_titles as rt
WHERE rt.to_date = '9999-01-01'
ORDER BY emp_no, rt.to_date DESC;

SELECT COUNT(u.title),
    u.title
-- INTO retiring_titles
FROM unique_titles as u
GROUP BY u.title
ORDER BY COUNT(u.title) DESC;