DROP TABLE IF EXISTS T1;
CREATE TABLE T1(label CHAR(1)PRIMARY KEY);

DROP TABLE IF EXISTS T2;
CREATE TABLE T2(score INT PRIMARY KEY);

INSERT INTO T1(label)
VALUES
	('A'),
	('B')

INSERT INTO T2(score)
VALUES
	(1),
	(2),
	(3);

SELECT * FROM T1
CROSS JOIN T2;

-- UNION --

DROP TABLE IF EXISTS top_rated_films;
CREATE TABLE top_rated_films(
	title VARCHAR NOT NULL,
	release_year SMALLINT
);

DROP TABLE IF EXISTS most_popular_films;
CREATE TABLE most_popular_films(
	title VARCHAR NOT NULL,
	release_year SMALLINT
);

INSERT INTO
	top_rated_films(title, release_year)
VALUES
	('The Shawshank Redemption', 1994),
	('The Godfather', 1972),
	('12 Angry Men', 1957);

INSERT INTO
	most_popular_films(title, release_year)
VALUES
	('An American Pickle', 2020),
	('The Godfather', 1972),
	('Greyhound', 2020);
	
SELECT * FROM top_rated_films;
SELECT * FROM most_popular_films;

SELECT * FROM top_rated_films
UNION
SELECT * FROM most_popular_films;