/* https://pastebin.com/wixjBQAV

Para entrar: mysql -u root -p
show databases;							Muestrame todas las bases de datos
create data base nom;					Crea una sóla tabla de base de datos
drop database dawtest;					borrar la base de datos
system cls;								limpiar la pantalla
use nom;								para entrar en la base de datos
select database();						para recordar en que base estás 
show warnings;							para ver los errores
show tables;							Ver las tablas creadas
desc nom;								mostrar el contenido de la tabla

Tamaño:
Tinyint = 1 byte = 8 bits = 2^8
Smallint = 2 byte = 2^16 = 65000
Mediumint = 2^24 = 16 millones
int = 4 bytes = 2^32 = 400 millones
Bigint = 8 bytes = 2^64 = 18mil millones, 18 trillones 

Diferentes tipos de variables:
char									Mismo nº de digitos siempre
varchar									Es variable el nº de digitos

create table if not exists cosas(
edat tinyint unsigned,				unsigned para que no haya negativos
preu float
);
																								*/
Exercici powerpoint:

create table t1(

	dni char (9),
	nom_complet varchar(25),		
	edat tinyint unsigned,			/*	Para que la edad no sea negativo										*/
	sexe char(1)					/*	Si sólo se quiere guardar M o F, también se puede varchar(20) 			*/
	sou float unsigned,				"	No puede haber sueldos negativos 										"
	email varchar(50),
	telefon int,					/*	Si quiers guardarlo cómo texto char(12)									*/
	es_estudiant boolean			/*	En el último atributo no hace falta										*/

);

create table t2(

	num_habitacio smallint,
	tipus enum('doble','triple','suite')

);
