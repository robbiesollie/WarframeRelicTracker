DROP SCHEMA IF EXISTS Warframe;

CREATE SCHEMA Warframe;

USE Warframe;

CREATE TABLE Relic
	(Tier	VARCHAR(10)	NOT NULL,
	Id VARCHAR(5) NOT NULL,
	Quantity INT NOT NULL DEFAULT 0,
	Refinement INT NOT NULL DEFAULT 0,
	CONSTRAINT Relic_PK PRIMARY KEY (Tier, Id)
	);

CREATE TABLE Prime
	(Name VARCHAR(25) NOT NULL,
	Quantity INT NOT NULL DEFAULT 0,
	CONSTRAINT Prime_PK PRIMARY KEY (Name)
	);

CREATE TABLE Part
	(Name VARCHAR(50) NOT NULL,
	Prime VARCHAR(25),
	Quantity INT NOT NULL DEFAULT 0,
	CONSTRAINT Part_PK PRIMARY KEY (Name),
	CONSTRAINT PrimeComponent_FK FOREIGN KEY (Prime) REFERENCES Prime(Name)
	);

CREATE TABLE Recipe
	(Prime VARCHAR(25) NOT NULL,
	Component VARCHAR(50) NOT NULL,
	Quantity INT NOT NULL DEFAULT 1,
	CONSTRAINT Prime_FK FOREIGN KEY (Prime) REFERENCES Prime(Name),
	CONSTRAINT Part_FK FOREIGN KEY (Component) REFERENCES Part(Name)
	);