USE proyecto_cinemextract;

ALTER TABLE premiososcar
ADD COLUMN NombreActor VARCHAR(255),
ADD COLUMN ApellidoActor VARCHAR(255);

ALTER TABLE premiososcar
ADD COLUMN NombreActriz VARCHAR(255),
ADD COLUMN ApellidoActriz VARCHAR(255);

ALTER TABLE premiososcar
ADD COLUMN NombreDirector VARCHAR(255),
ADD COLUMN ApellidoDirector VARCHAR(255);

UPDATE premiososcar
SET NombreActor = SUBSTRING_INDEX(MejorActor, ' ', 1),
    ApellidoActor = SUBSTRING_INDEX(MejorActor, ' ', -1);
    
UPDATE premiososcar
SET NombreActriz = SUBSTRING_INDEX(MejorActriz, ' ', 1),
    ApellidoActriz = SUBSTRING_INDEX(MejorActriz, ' ', -1);
    
UPDATE premiososcar
SET NombreDirector = SUBSTRING_INDEX(MejorDirector, ' ', 1),
    ApellidoDirector = SUBSTRING_INDEX(MejorDirector, ' ', -1);

ALTER TABLE actores
ADD COLUMN NombreActor VARCHAR(255),
ADD COLUMN ApellidoActor VARCHAR(255);

UPDATE actores
SET NombreActor = SUBSTRING_INDEX(Actor, ' ', 1),
    ApellidoActor = SUBSTRING_INDEX(Actor, ' ', -1);
    
ALTER TABLE actores
DROP PRIMARY KEY;

ALTER TABLE actores
ADD COLUMN IdActor INT AUTO_INCREMENT PRIMARY KEY;

ALTER TABLE premiososcar
ADD COLUMN IdActor INT,
ADD CONSTRAINT FK_IdActor FOREIGN KEY (IdActor) REFERENCES actores(IdActor);

ALTER TABLE premiososcar
ADD COLUMN IdActriz INT,
ADD CONSTRAINT FK_IdActriz FOREIGN KEY (IdActriz) REFERENCES actores(IdActor);

UPDATE premiososcar AS p
JOIN actores AS a ON p.ApellidoActor = a.ApellidoActor AND p.NombreActor LIKE CONCAT(LEFT(a.NombreActor, 1), '.%')
SET p.IdActor = a.IdActor;

UPDATE premiososcar AS p
JOIN actores AS a ON p.ApellidoActriz = a.ApellidoActor AND p.NombreActriz LIKE CONCAT(LEFT(a.NombreActor, 1), '.%')
SET p.IdActriz = a.IdActor;


