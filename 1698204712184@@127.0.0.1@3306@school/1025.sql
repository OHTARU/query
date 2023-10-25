-- Active: 1698204712184@@127.0.0.1@3306@school



--모든 교수의 이름을 찾아라
SELECT name FROM instructor;

--모든 교수의 소속 학과 이름을 찾아라
SELECT dept_name FROM instructor;

--각 교수의 급여를 10% 인상하라
UPDATE instructor SET salary = salary * 1.1;

--컴퓨터 과학과에서 급여가 70,000이 넘는 모든 교수의 이름을 구하라
SELECT name FROM instructor WHERE dept_name = 'Comp. Sci.' AND salary > 70000;

--모든 교수의 이름과 함께, 그들의 학과 이름과 건물 이름을 구하라
SELECT instructor.name, instructor.dept_name, department.building 
FROM instructor 
JOIN department ON instructor.dept_name = department.dept_name;

--교수 이름과 과목 식별자(ID)를 출력하라
SELECT instructor.name, teaches.course_id 
FROM instructor 
JOIN teaches ON instructor.ID = teaches.ID;

--컴퓨터과학과에 속한 교수 이름과 과목 식별자(ID)를 출력하라
SELECT instructor.name, teaches.course_id 
FROM instructor 
JOIN teaches ON instructor.ID = teaches.ID 
WHERE instructor.dept_name = 'Comp. Sci.';

--적어도 생물학과의 한 교수보다 급여가 많은 모든 교수의 이름을 구하라
SELECT name FROM instructor 
WHERE salary > (SELECT MIN(salary) FROM instructor WHERE dept_name = 'Biology');

--건물 이름에 'Watson' 이라는 부분 문자열을 포함하는 모든 학과 이름을 구하라.
SELECT dept_name FROM department WHERE building LIKE '%Watson%';

--물리학과의 모든 교수를 알파벳 순서로 나열하라,
SELECT name FROM instructor WHERE dept_name = 'Physics' ORDER BY name;

--급여가 90,000과 100,000 사이에 있는 교수들의 이름을 찾아라
SELECT name FROM instructor WHERE salary BETWEEN 90000 AND 100000;

--2017년 가을에 가르쳤던 모든 과목을 보여라
SELECT course_id FROM teaches WHERE year = '2017' AND semester = 'Fall';

--2018년 봄 학기에 각 학과에서 어떤 과목을 가르친 교수의 수를 구하라
SELECT instructor.dept_name, COUNT(DISTINCT teaches.course_id) 
FROM instructor 
JOIN teaches ON instructor.ID = teaches.ID 
WHERE teaches.year = '2018' AND teaches.semester = 'Spring' 
GROUP BY instructor.dept_name;

--2017년에 개설한 각 과목 분반에 대해서, 그 분반에 적어도 두 명의 학생이 있으면 해당 부분에 등록한 학생들의 평균과 전체학점(tot_cred)을 구하라
SELECT takes.course_id, takes.sec_id, AVG(student.tot_cred) 
FROM takes 
JOIN student ON takes.ID = student.ID 
WHERE takes.year = '2017' 
GROUP BY takes.course_id, takes.sec_id 
HAVING COUNT(takes.ID) >= 2;


--ID 110011의 교수가 가르치는 과목분반을 수강하는 학생의 수를 구하라
SELECT COUNT(*) 
FROM takes 
WHERE (course_id, sec_id, semester, year) IN (SELECT course_id, sec_id, semester, year FROM teaches WHERE ID = '110011');

