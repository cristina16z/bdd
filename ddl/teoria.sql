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
drop para la estrucutra
delete para los datos

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

Ejemplo en clase:

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

/*pk, n.n, uq, ch
foreign key

Persona (dni(primary key), nom)
Coche (matricula (primary key),marca, modelo, dni)*/

create table persona (
    dni char(9),
    nom varchar(20),
    constraint pk_persona primary key (dni)
);
 
insert into persona values ('1111A','Pere');
insert into persona values ('2222B','Oriol');
 
create table coche (
    matricula char(9),
    marca varchar(20) not null,
    modelo varchar(20),
    dni char(9),
    constraint pk_coche primary key(matricula),
    constraint fk_coche_persona foreign key (dni)
            REFERENCES Persona(dni)
);

insert into coche values('B2222','Mercedes','clase J','1111A');
insert into coche values('B2222','Mercedes','clase J', not NULL); 		si es | mínimo y no conocemos el dato DNI persona
insert into coche values('B2222','Mercedes','clase J', NULL); 			si es  O OPCIONAL y no conocemos el dato DNI persona

/*
para crear: primero el padre y luego los hijos
primero eliminar: primero los hijos y luego el padre*/




/*Harry Potter */

create table profe (
  id integer primary key auto_increment,
  nom varchar(50),
  casa_id integer,
  constraint fk_profe_casa foreign key (casa_id) references casa(id) on DELETE CASCADE
)engine=innodb;


create table classes (
  id integer primary key auto_increment,
  materia varchar(50),
  profe_id integer,
  constraint fk_classe_profe foreign key (profe_id) references profe(id) on DELETE CASCADE
)engine=innodb;


create table estudiant (
  id integer primary key auto_increment,
  nom varchar(50) not null,
  anyo integer not null,
  casa_id integer,
  constraint fk_estudiant_casa foreign key (casa_id) references casa(id) on DELETE CASCADE
)engine=innodb;


/*Hechizos*/

select * from casa;
select * from estudiant;
delete from casa where id=1;	
/*no se puede borrar porque hay una foreign key, hay dependencias de la casa*/	

update casa set id=23 where id=2;
/*actualiza la tabla casa, cambia la id, pero sigue sin funcionar porque hay dependencia	*/

insert into estudiant (nom, anyo, casa_id) values ('Cristina', 1, 2);
/*para introducir los valores*/



on DELETE CASCADE 
delete from casa where id=1;
/*Se borra la casa y desaparecen los alumnos que pertenecían a esa casa.
Es decir, borra la casa y sus dependientes (padres). (cómo el ejemplo)*/


on delete cascade on update cascade
update casa set id=23 where id=2;
/*Cambia el id de la casa, y los estudiantes que pertenecían al 2, cambian al 23.
Cambiando la clave primaria, arrastro y actualizo sus dependientes. Arrastra los cambios.*/


on delete set null 
delete from casa where id=2;
/*Elimina la casa, pero los alumnos no, simplemente los alumnos que pertenecían a la 2, ahora pone NULL */


on delete restrict
/* por defecto 



Ahora cada vez que pongamos una clave foránea hay que poner on delete..
ejemplo*/

 profe > UF > modulo > ciclo

Profe: on delete restrict
UF: on delete cascade
modulo: on delete cascade
ciclo: on delete restrict
/*en éste ejemplo al borrar modulos no se podría borrar uf ya que lo restringe profe

no puedo poner set null si hay un mínimo | en el esquema
Lo podría poner si fuera O 															*/


Cambiarle el nombre: rename table [name] to [newName];




--------------------------------------------------Modificar tablas-------------------------------------------------------


MODIFICAR COLUMNAS:

/*Añadir una nueva columna (filas)*/
alter table [nameTable]
add column telefon varchar(12) default 'desconegut' not null,
add column numSegSocial varchar(20) first,								/*al principio de todo */
add column DNI char(9) after nom,										/*después del nombre*/
add column email varchar(20);											/*por defecto se añadirá a la última*/

/*borrar columna*/
drop column telefon;													


/*[PowerPoint] Modifica la taula t2 i afegeix una columna anomenada metres
afegeix una columna anomenada te_nevera però ha d’estar situada just després de la columna tipus */

create table t2(
	num_habitacio smallint,
	tipus enum('doble','triple','suite')
);

alter table t2
add column metres smallint,
add column te_nevera boolean after tipus;

/*Modifica la taula t2 i elimina la columna anomenada te_nevera */
alter table t2
drop column te_nevera;





MODIFICAR RESTRICCIONES: 

/*Modificar definició: por ejemplo cambiar el email por ejemplo varchar(20) a varchar(30)*/
alter table prova1
modify email varchar(30) not null;

/*Modificar el nombre i definición: cambiar email por correo + su varchar*/
alter table prova1
change column email correo varchar(25) null;

/*modificar nombre: [antiguoName] to [newName] */
alter table prova1
rename column email to correo;


/*[PowerPoint] Modifica la taula t1 de forma que l’atribut nom complet sigui varchar de 300 caràcters*/
/*Modifica la taula t1 de forma que l’atribut edat passi a anomenar-se data_naixement i sigui de tipus data*/

create table t1(

	dni char (9) primary key,							
	nom_complet varchar(25) default 'Desconegut',		
	edat tinyint unsigned,								
	sexe char(1)										
	sou float unsigned,									
	email varchar(50),
	telefon int,										
	es_estudiant boolean							
);

alter table t1
modify nom_complet varchar (300),									/*no hace falta poner column*/
change column edat data_naixament date;





AÑADIR RESTRICCIONES: 

alter table prova1
add contraint pk_prova1 primary key (codi,nom),
add constraint uq_correo unique (correo),
drop constraint uq_correo;

/*cuando añadimos un constraint , no quiere que pongamos nombre (pk_prova1) a una primary key
si hacemos drop constraint pk_prova1 va a dar error, porque lo ha ignorado.
Entonces para borrar el constraint de una clave primaria es:										*/

alter table prova1
drop primary key;



/*[PowerPoint] Modifica la taula t1 afegeix una restricció de clau primària.
Modifica la taula t1 per tal que es validi que l’atribut sou nomès pot acceptar valors positius.
Modifica la taula t1 i elimina les dos restriccions anteriors										*/

alter table t1
add constraint pk_dni primary key (dni),
add constraint ch_sou check (sou>=0);
/*modify column sou float unsigned;			segunda opción, se podría poner unsigned*/

alter table t1
drop primary key,
drop constraint ch_sou;



/* https://pastebin.com/QxetTbG7*/