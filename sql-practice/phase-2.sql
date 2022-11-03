PRAGMA foreign_keys = on;

-- Turns foreign key support in SQLite3 on
-- Your code here
DROP TABLE
  IF EXISTS cat_owners;

DROP TABLE
  IF EXISTS toys;

DROP TABLE
  IF EXISTS owners;

DROP TABLE
  IF EXISTS cats;

CREATE TABLE
  cats (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cats_name varchar(100),
    birth_year INTEGER
  );

CREATE TABLE
  owners (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name varchar(100),
    last_name varchar(100)
  );

CREATE TABLE
  toys (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    toys_name VARCHAR,
    cat_id INTEGER REFERENCES cats (id) ON DELETE CASCADE
  );

CREATE TABLE
  cat_owners (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cat_id INTEGER REFERENCES cats (id) ON DELETE CASCADE,
    owner_id INTEGER REFERENCES owners (id) ON DELETE CASCADE
  );

INSERT INTO
  owners (first_name, last_name)
VALUES
  ('Nathan', 'Shanahan'),
  ('Joycelyn', 'Cummerata'),
  ('Weston', 'Jones'),
  ('Melynda', 'Abshire'),
  ('George', 'Beatty'),
  ('Jonathan', 'Arbuckle'),
  ('Hermione', 'Granger');

INSERT INTO
  cats (cats_name, birth_year)
VALUES
  ('Smudge', 2014),
  ('Molly', 2015),
  ('Lucky', 2016),
  ('Bella', 2020),
  ('Tiger', 2012),
  ('Oscar', 2010),
  ('Garfield', 2009),
  ('Crookshanks', 2017);

INSERT INTO
  cat_owners (cat_id, owner_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (3, 3),
  (4, 4),
  (5, 4),
  (5, 5),
  (7, 6),
  (8, 7);

INSERT INTO
  toys (cat_id, toys_name)
VALUES
  (1, 'Catnip Mouse'),
  (2, 'Feather Wand'),
  (2, 'Scratcher'),
  (2, 'Laser Pointer'),
  (3, 'Chew Toy'),
  (4, 'Tunnel'),
  (4, 'Flopping Fish'),
  (7, 'Cheetos'),
  (8, 'Crinkle Ball'),
  (8, 'Yarn');

SELECT
  owners.first_name,
  cats.cats_name
FROM
  owners
  JOIN cat_owners ON (cat_owners.owner_id = owners.id)
  JOIN cats ON (cat_owners.cat_id = cats.id)
WHERE
  owners.first_name = 'Hermione';

SELECT
  cats.cats_name,
  owners.first_name,
  toys.toys_name
FROM
  owners
  JOIN cat_owners ON (cat_owners.owner_id = owners.id)
  JOIN cats ON (cat_owners.cat_id = cats.id)
  JOIN toys ON (toys.cat_id = cats.id)
WHERE
  owners.first_name = 'Hermione';

 DELETE FROM cats WHERE cats.name = 'Smudge';
