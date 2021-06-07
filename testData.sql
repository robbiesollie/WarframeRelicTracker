source dbBuilder.sql;

INSERT INTO Prime (Name, Quantity)
	VALUES
		('Burston', 0),
		('Tipedo', 0),
		('Gram', 1),
		('Pyrana', 0),
		('Ballistica', 1);

INSERT INTO Component (Name, Prime, Owned, Required)
	VALUES
		('Burston Prime Barrel', 'Burston', 1, 1),
		('Burston Prime Receiver', 'Burston', 1, 1),
		('Burston Prime Stock', 'Burston', 1, 1),
		('Tipedo Prime Ornament', 'Tipedo', 1, 2),
		('Tipedo Prime Handle', 'Tipedo', 1, 1),
		('Gram Prime Blade', 'Gram', 2, 1),
		('Gram Prime Handle', 'Gram', 0, 1),
		('Pyrana Prime Barrel', 'Pyrana', 1, 1),
		('Pyrana Prime Receiver', 'Pyrana', 0, 1),
		('Forma', NULL, 8, 1),
		('Ballistica Prime Receiver', 'Ballistica', 0, 1);

SELECT p.Name as Prime, c.Name as Component from Component c INNER JOIN Prime p ON c.Prime = p.Name;

SELECT 'Craftable';

SELECT p.Name as Prime FROM Prime p WHERE 
	(SELECT COUNT(*) FROM Component c WHERE c.Prime = p.Name) <=
	(SELECT COUNT(*) FROM Component c WHERE c.Prime = p.Name AND c.Owned >= c.Required);

UPDATE Component SET Owned = Owned + 1 WHERE Name = "Tipedo Prime Ornament";

SELECT 'Craftable';

SELECT p.Name as Prime FROM Prime p WHERE 
	(SELECT COUNT(*) FROM Component c WHERE c.Prime = p.Name) <=
	(SELECT COUNT(*) FROM Component c WHERE c.Prime = p.Name AND c.Owned >= c.Required);