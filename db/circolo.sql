DROP DATABASE IF EXISTS circolo;
CREATE DATABASE circolo;
USE circolo;

CREATE TABLE Socio (	
  Username varchar(20) primary key,
  Nome varchar(20) not null,
  DataNascita date not null,
  Cognome varchar(20) not null,
  CodiceFiscale varchar(20) not null,
  Email varchar(20) not null,
  Tipo varchar(20) not null,
  Telefono varchar(12) not null,
  Città varchar(20) not null,
  Indirizzo varchar(50) not null,
  Password varchar(20) not null
);

CREATE TABLE Fattura (
	ID int(10) not null primary key AUTO_INCREMENT,
    Data date,
    Importo numeric(15,2) not null,
    Spedito char(2) default'NO',
    Username varchar(20) references Socio(Username)
)AUTO_INCREMENT=1000;

CREATE TABLE Articolo(
	Codice varchar(10) primary key,
    Descrizione varchar(100) not null,
    Quantità int(3) not null,
    Prezzo numeric(15,2) not null
);

CREATE TABLE Acquisto(
	Username  varchar(20)      references Socio(Username),
    Codice    varchar(20)      references Articolo(Codice),
    primary key(Username,Codice)
);

CREATE TABLE Abbigliamento(
	Codice varchar(20) primary key not null,
    foreign key(Codice) references Articolo(Codice)
		on delete cascade on update cascade
    );

CREATE TABLE Gadget(
	Codice varchar(20) primary key not null,
	foreign key(Codice) references Articolo(Codice)
		on delete cascade on update cascade
	);

CREATE TABLE Evento(
	Nome varchar(20) primary key,
    Data date,
    Descrizione varchar(100) not null
);

CREATE TABLE Biglietto(
	Codice varchar(20) primary key not null,
    Nome varchar(20) references Evento(Nome),
	foreign key(Codice) references Articolo(Codice)
		on delete cascade on update cascade
);

CREATE TABLE Ha(
    Codice varchar(10) references Articolo(Codice),
	ID int(10) not null ,
    Quantità int(2) not null,
	primary key(Codice,ID),
    foreign key(ID) references Fattura(ID)
);

insert into articolo values('AB423','dasda',55,43.32);
insert into abbigliamento values('AB423');
insert into articolo values('BI224','SVX',55,43.32);
insert into evento values('Galà','2016-06-20','Serata di inaugurazione del circolo');
insert into biglietto values('BI224','Galà');
insert into articolo values('GD423','GSF',55,43.32);
insert into gadget values('GD423');
