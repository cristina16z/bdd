/*Exercici 1: Crea una taula anomenada pelicula sense cap restricció, que tingui els camps següents:
ID 		□ 	Cadena de caràcters (6)
Titulo 	□ 	Cadena de caràcters (70)
Anyo 	□ 	numèric
Genero 	□ 	Cadena de caràcters (15)																				*/

create table pelicula(

    id char (6),				/*cómo no sabemos si su longitud es variable también vale varchar 					*/
    Titulo varchar(70),					
    Anyo year (4),					
    Genero varchar(15)	

);


/*Exercici 2: Crea una taula anomenada actor sense cap restricció, que tingui els camps següents:
ID 		□ 	numèric de 4 xifres
Nombre 	□ 	Cadena de caràcters (25)																				*/

create table actor(

	ID smallint,
	Nombre varchar(25)
				
);


/*Exercici 3: Crea una taula anomenada participar sense cap restricció que tingui els camps següents:
Pelicula_id  □ 	Numèric de 4 xifres
Actor_id 	 □ 	Numèric de 4 xifres
Orden 		 □ 	Numèric																								*/

create table participar (

	pelicula_id smallint,         /*no hace falta poner el (4) porque ya se aclara con el smallint*/
	actor_id smallint,              /*y saltaría un warning cómo que no hace falta*/
	orden smallint
				
);


/*Exercici 4: Crea una restricció anomenada PK_PELICULA per indicar que la clau primària de pelicula és el camp ID. */
alter table pelicula add constraint PK_PELICULA primary key (id);


/*Exercici 5: Crea una restricció anomenada PK_ACTOR per indicar que la clau primària de actor és el camp ID		*/
alter table actor add constraint PK_ACTOR primary key (id);


/*Exercici 6: Crea una restricció anomenada FK_REP_PELICULA per indicar que el camp pelicula_id
de la taula participar és una clau forana que referència al camp id de pelicula. ¿Què
succeeix? ¿Perquè?																									*/
alter table participar add constraint FK_REP_PELICULA foreign key (pelicula_id) references pelicula (id);
No se puede crear la clave foránea porque los tipos de datos son diferentes smallint y char (6)


/*Exercici 7: Modifica la taula pelicula per tal d’indicar que el camp id és numèric de 4 xifres					*/
alter table pelicula modify id smallint;
porque el máximo es el número 9999, entonces cambiaremos el char(6) de pelicula por un smallint


/*Exercici 8: Intenta tornar a crear la clau forana de la pregunta 6												*/
alter table participar add constraint FK_REP_PELICULA foreign key (pelicula_id) references pelicula (id);


/*Exercici 9: Crea la clau primària de la taula participar															*/
alter table participar add constraint pk_participar primary key (pelicula_id, actor_id);


/*Exercici 10: Crea la clau forana de participar cap a actor														*/
alter table participar add constraint fk_actor foreign key (actor_id) references actor (id);


/*Exercici 11: Modifica la taula pelicula per tal d’indicar que el camp titulo no accepta valors nulls.				*/
alter table pelicula modify column Titulo varchar (70) not null; 


/*Exercici 12: Modifica la taula actor per tal d’indicar que el nom no accepta valors nulls.						*/
alter table actor modify nombre varchar(25) not null;


/*Exercici 13: Afegeix un camp a la taula pelicula:
	a. Puntuacion □ Numèric de 2 xifres per a la part sencera i 1 per a la part decimal								*/
alter table pelicula add column puntuacion float;		/*opción 1*/
/*opción 2: No tener en cuenta alter table pelicula add column puntuacion float (3,1);
			3 digitos en total y 1 dígito para la parte decimal */


/*Exercici 14: Afegeix un camp a la taula pelicula:
	a. Votos □ Numèric																									*/
alter table pelicula add column votos Mediumint;