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

CREATE TABLE Component
	(Name VARCHAR(50) NOT NULL,
	Prime VARCHAR(25),
	Required INT NOT NULL DEFAULT 1,
	Owned INT NOT NULL DEFAULT 0,
	CONSTRAINT Component_PK PRIMARY KEY (Name),
	CONSTRAINT Prime_FK FOREIGN KEY (Prime) REFERENCES Prime(Name)
	);

CREATE TABLE Rewards
	(Component VARCHAR(50) NOT NULL,
	RelicTier VARCHAR(10) NOT NULL,
	RelicId VARCHAR(5) NOT NULL,
	CONSTRAINT Component_FK FOREIGN KEY (Component) REFERENCES Component(Name),
	CONSTRAINT Relic_FK FOREIGN KEY (RelicTier, RelicId) REFERENCES Relic(Tier, Id)
	);