Create table public.students
(
	student_id integer NOT NULL,
	student_name character varying(50),
	age integer,
	height real,
	PRIMARY KEY (student_id)
);

===

Select * FROM students

==

INSERT INTO students (student_id, student_name, age, height)
values (1, 'Alfreds', 23, 1.73),
(2, 'Abraham', 22, 1.65),
(3, 'Nico', 21, 1.81);

===

UPDATE students
SET age = 20
WHERE student_id = 2;

===

INSERT INTO students (student_id, student_name, age, height)
values (4, 'Holmes', 21, 1.80);

====

DELETE FROM students
WHERE student_id = 1;

===

Select * from students

===
ALTER TABLE STUDENTS ADD nickname varchar(20)
===
UPDATE students
SET nickname = 'Ardi'
WHERE student_id = 4;

===

UPDATE students
SET nickname = 'Bibi'
WHERE student_id = 2;

===

select student_name, age from students
where student_id = 4;

===

