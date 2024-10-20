-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS olimpiadas;
USE olimpiadas;
-- Tabla Atleta
CREATE TABLE Atleta (
ID_Atleta INT AUTO_INCREMENT PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL,
Sexo ENUM('M', 'F') NOT NULL,
NOC VARCHAR(10) NOT NULL
);
-- Tabla Equipo
CREATE TABLE Equipo (
ID_Equipo INT AUTO_INCREMENT PRIMARY KEY,
Nombre_Equipo VARCHAR(100) NOT NULL
);
-- Tabla Olimpiada
CREATE TABLE Olimpiada (
ID_Olimpiada INT AUTO_INCREMENT PRIMARY KEY,
Año INT NOT NULL,
Ciudad VARCHAR(100) NOT NULL
);
-- Tabla Evento
CREATE TABLE Evento (
ID_Evento INT AUTO_INCREMENT PRIMARY KEY,
Nombre_Evento VARCHAR(100) NOT NULL,
Deporte VARCHAR(100) NOT NULL
);
-- Tabla Medalla
CREATE TABLE Medalla (
ID_Medalla INT AUTO_INCREMENT PRIMARY KEY,
Tipo ENUM('Oro', 'Plata', 'Bronce') NOT NULL
);

-- Tabla Competición (intermedia)
CREATE TABLE Competicion (
ID_Competicion INT AUTO_INCREMENT PRIMARY KEY,
ID_Atleta INT NOT NULL,
ID_Evento INT NOT NULL,
ID_Olimpiada INT NOT NULL,
ID_Medalla INT NULL,
FOREIGN KEY (ID_Atleta) REFERENCES Atleta(ID_Atleta),
FOREIGN KEY (ID_Evento) REFERENCES Evento(ID_Evento),
FOREIGN KEY (ID_Olimpiada) REFERENCES Olimpiada(ID_Olimpiada),
FOREIGN KEY (ID_Medalla) REFERENCES Medalla(ID_Medalla)
);
-- Relacionar Atleta con Equipo
ALTER TABLE Atleta
ADD COLUMN ID_Equipo INT,
ADD FOREIGN KEY (ID_Equipo) REFERENCES Equipo(ID_Equipo);
