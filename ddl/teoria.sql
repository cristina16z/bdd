/* https://pastebin.com/wixjBQAV

Para entrar: mysql -u root -p
show databases;							Muestrame todas las bases de datos
use nom;								para entrar en la base de datos
create data base nom;					Crea una sóla tabla de base de datos
drop database dawtest;					borrar la base de datos
system cls;								limpiar la pantalla
select database();						para recordar en que base estás 
show warnings;							para ver los errores
show tables;							Ver las tablas creadas
desc nom;								mostrar el contenido de la tabla, verificar la tabla
drop table nom;							borrar la tabla


Tamaño:
Tinyint = 1 byte = 8 bits = 2^8
Smallint = 2 byte = 2^16 = 65000
Mediumint = 2^24 = 16 millones
int = 4 bytes = 2^32 = 400 millones
Bigint = 8 bytes = 2^64 = 18mil millones, 18 trillones 


Diferentes tipos de variables:
char									Mismo nº de digitos siempre
varchar									Es variable el nº de digitos


Restricciones:
NULL | NOT NULL							Not null: obligatorio
PRIMARY KEY = KEY
UNIQUE = UNIQUE KEY
CHECK
auto_increment							cuando se lo ponemos tiene que tener la PRIMARY KEY


SIGNOS

	=		igual
	>		mayor qué
	<		menor qué
	>=		mayor o igual qué (importante el orden)
	<=		menor o igual qué
	<>		diferente 
	!=		diferente

	Ejemplo -->		edad tinyint check (edad >= 16 and edad <=150);



create table if not exists cosas(
edat tinyint unsigned,							unsigned para que no haya negativos
preu float
);

contrain es cómo "norma"


Exercicis powerpoint:

Crea una taula anomenada t1.
	- DNI
	- Nom complet
	- Edat
	- Sexe
	- Sou
	- email
	- Telèfon
	- Es_estudiant																					*/

create table t1(

	dni char (9) primary key,							"	Primary key y que no puede ser nullo 									"
	nom_complet varchar(25) default 'Desconegut',		"	cambia por defecto el NULL por Desconegut"
	edat tinyint unsigned,								"	Para que la edad no sea negativo										"
	sexe char(1)										"	Si sólo se quiere guardar M o F, también se puede varchar(20) 			"
	sou float unsigned,									"	No puede haber sueldos negativos 										"
	email varchar(50),
	telefon int,										"	Si quiers guardarlo cómo texto char(12)									"
	es_estudiant boolean								"	En el último atributo no hace falta										"

);


/*Crea una taula anomenada t2 que tingui:
	- num-habitacio
	- tipus amb valors possibles doble, triple o suite.												*/

create table t2(

	num_habitacio smallint,
	tipus enum('doble','triple','suite')

);


/*Crea una taula anomenada t3 que tingui:
	- DNI com a clau primària
	- nom obligatori
	- email obligatori i amb control de repetits
	- sou obligatori i com a valor mínim 400																*/

create table t3(

	dni char (9) PRIMARY key,								"con la Primary key ya se aplica automáticamente el not NULL"
	nom varchar(20) not NULL,					
	email year (4) not NULL UNIQUE,					
	sou float(400) not NULL check (sou >= 400)	
	
);


/*Crea una taula anomenada t4 que tingui:
	- num-habitacio clau primària
	- tipus amb valors possibles doble, triple o suite.
	  Utilitza check																							*/

create table t4(

	num_habitacio smallint PRIMARY key,
	tipus varchar (20) check (tipus = 'doble' or tipus ='triple' or tipus ='suite')

);


/* inser to persona (nom) values ('Cristina');			asignar casilla nombre su valor
delete from persona;
select * from persona;									seleccionar todo de persona							*/

ejemplo clase:

create table persona(

	codi smallint PRIMARY key auto_increment,			
	nom varchar (20) 'El nombre de la persona',
	email varchar (30) comment 'El email de la persona'
	
);


/*Crea una taula anomenada t5 que tingui:
	- codi clau primària autoincremental
	- model obligatori
	- marca obligatori
	- matrícula clau alternativa, obligatori
	- bastidor clau alternativa, no obligatori
	- color no obligatori																								*/

create table t5(

	codi smallint PRIMARY key auto_increment,			
	model varchar (20) not NULL,
	marca varchar (30) not NULL,
	matricula char (7) unique not null,						
	bastidor varchar unique NULL,							"si no es obligatorio puedes poner NULL o no poner nada"
	color varchar (10)
	
);


/*Crea una taula anomenada t6 que tingui:
	- nom-hotel clau primària
	- num-habitacio clau primària
	- tipus																													*/

create table t6 (

	nom_hotel varchar(20),
	num_habitacio smallint ,
	tipus varchar (20),

	constraint pk_t6 PRIMARY key (nom_hotel, num_habitacio)
	
);


Teoría: Separar estructura de la parte de restricciones.

create table persona (

	codi int auto_increment,
	nom varchar (20) not null,
	sou float,
	dni char(9),

	constraint pk_persona PRIMARY key (codi),					/*[constraint [nombre que queramos]] [tipus] [columna afectada] */
	constraint ch_sou check (sou>500 and sou<1000),				/*		OPCIONAL						OBLIGATORIO 			*/				
	constraint uq_dni unique (dni)

);
