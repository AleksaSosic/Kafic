create database kafic
use kafic

create table Statusi(
id INT IDENTITY (1, 1) CONSTRAINT PK_Statusi PRIMARY KEY (id),
naziv NVARCHAR(10)
)

create table Stolovi(
id INT IDENTITY (1, 1) CONSTRAINT PK_Stolovi PRIMARY KEY (id),
kapacitet INT,
id_statusi INT CONSTRAINT FK_StatusiStolovi FOREIGN KEY REFERENCES Statusi(id),
id_porudzbine INT CONSTRAINT FK_PorudzbineSto FOREIGN KEY REFERENCES Porudzbine(id)
)

create table Porudzbine(
id INT IDENTITY (1, 1) CONSTRAINT PK_Porudzbine PRIMARY KEY (id),
id_informacije_porudzbine INT CONSTRAINT FK_Informacije_Porudzbine FOREIGN KEY REFERENCES Informacije_Porudzbine(id)
)

create table Informacije_Porudzbine(
id INT IDENTITY (1, 1) CONSTRAINT PK_Informacije_Porudzbine PRIMARY KEY (id),
kolicina INT,
id_lager INT CONSTRAINT FK_Lager FOREIGN KEY REFERENCES Lager(id)
)

create table Lager(
id INT IDENTITY (1, 1) CONSTRAINT PK_Lager PRIMARY KEY (id),
naziv NVARCHAR,
kolicina INT,
cena INT,
id_tipovi_proizvoda INT CONSTRAINT FK_TipoviLager FOREIGN KEY REFERENCES Tipovi_Proizvoda(id)
)

create table Tipovi_Proizvoda(
id INT IDENTITY (1, 1) CONSTRAINT PK_Tipovi_Proizvoda PRIMARY KEY (id),
naziv NVARCHAR
)

create table Istorijat(
id INT IDENTITY (1, 1) CONSTRAINT PK_Istorijat PRIMARY KEY (id),
datum DATE,
ukupna_cena INT,
id_porudzbine INT CONSTRAINT FK_PorudzbineIst FOREIGN KEY REFERENCES Porudzbine(id),
id_popusti INT CONSTRAINT FK_Popusti FOREIGN KEY REFERENCES Popusti(id)
)

create table Popusti(
id INT IDENTITY (1, 1) CONSTRAINT PK_Popusti PRIMARY KEY (id),
procenat INT,
id_informacije_popusti INT CONSTRAINT FK_InformacijePopusti FOREIGN KEY REFERENCES Informacije_Popusti(id)
)

create table Informacije_Popusti(
id INT IDENTITY (1, 1) CONSTRAINT PK_Informacije_Popusti PRIMARY KEY (id),
naziv NVARCHAR,
opis NVARCHAR
)
