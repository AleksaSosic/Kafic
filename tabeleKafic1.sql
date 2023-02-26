create database kafic
use kafic

create table Informacije_Porudzbine(
id INT IDENTITY (1, 1) CONSTRAINT PK_Informacije_Porudzbine PRIMARY KEY (id),
naziv NVARCHAR,
opis NVARCHAR
)

create table Statusi(
id INT IDENTITY (1, 1) CONSTRAINT PK_Statusi PRIMARY KEY (id),
naziv NVARCHAR(10)
)

create table Stolovi(
id INT IDENTITY (1, 1) CONSTRAINT PK_Stolovi PRIMARY KEY (id),
kapacitet INT,
id_statusi INT CONSTRAINT FK_StatusiStolovi FOREIGN KEY REFERENCES Statusi(id)
)

create table Porudzbine(
id INT IDENTITY (1, 1) CONSTRAINT PK_Porudzbine PRIMARY KEY (id),
id_stolovi INT CONSTRAINT FK_StoloviPorudzbine FOREIGN KEY REFERENCES Stolovi(id),
id_informacije INT CONSTRAINT FK_InformacijePorudzbine FOREIGN KEY REFERENCES Informacije_Porudzbine(id)
)

create table Informacije_Popusti(
id INT IDENTITY (1, 1) CONSTRAINT PK_Informacije_Popusti PRIMARY KEY (id),
naziv NVARCHAR,
opis NVARCHAR
)

create table Popusti(
id INT IDENTITY (1, 1) CONSTRAINT PK_Popusti PRIMARY KEY (id),
procenat INT,
id_informacije INT CONSTRAINT FK_InformacijePopusti FOREIGN KEY REFERENCES Informacije_Popusti(id)
)

create table Tipovi_Proizvoda(
id INT IDENTITY (1, 1) CONSTRAINT PK_Tipovi_Proizvoda PRIMARY KEY (id),
naziv NVARCHAR
)

create table Lager(
id INT IDENTITY (1, 1) CONSTRAINT PK_Lager PRIMARY KEY (id),
naziv NVARCHAR,
kolicina INT,
cena INT,
id_tipovi_proizvoda INT CONSTRAINT FK_TipoviLager FOREIGN KEY REFERENCES Tipovi_Proizvoda(id)
)

create table Racuni(
id INT IDENTITY (1, 1) CONSTRAINT PK_Racuni PRIMARY KEY (id),
naziv_proizvoda NVARCHAR,
kolicina_proizvoda INT,
cena INT
)

create table Istorijat(
id INT IDENTITY (1, 1) CONSTRAINT PK_Istorijat PRIMARY KEY (id),
datum DATE,
ukupna_cena INT,
id_racuni INT CONSTRAINT FK_RacuniIstorijat FOREIGN KEY REFERENCES Racuni(id)
)