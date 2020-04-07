DROP TABLE castings;
DROP TABLE movies;
DROP TABLE stars;

CREATE TABLE movies(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255),
  budget INT4
);

CREATE TABLE stars(
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);
