DROP TABLE Magical_items;
DROP TABLE Wands;
DROP TABLE Wizards;

CREATE TABLE Wands(
 id SERIAL4 PRIMARY KEY,
 name VARCHAR(255)
);



CREATE TABLE Wizards(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);


CREATE TABLE Magical_items(
 id SERIAL4 PRIMARY KEY,
 wizard_id INT4 references wizards(id) ON DELETE CASCADE,
 wand_id INT4 references wands(id) ON DELETE CASCADE
 );


