/*Exercici 1: Crea una taula anomenada pelicula sense cap restricció, que tingui els camps següents:
    ID 		□ 	Cadena de caràcters (6)
    Titulo 	□ 	Cadena de caràcters (70)
    Anyo 	□ 	numèric
    Genero 	□ 	Cadena de caràcters (15)																		*/

				create table pelicula(

					id char (6),				/*cómo no sabemos si su longitud es variable también vale varchar 			*/
					Titulo varchar(70),					
					Anyo year (4),					
					Genero varchar(15)			
				);


/*Exercici 2: Crea una taula anomenada actor sense cap restricció, que tingui els camps següents:
    ID 		□ 	numèric de 4 xifres
    Nombre 	□ 	Cadena de caràcters (25)																		*/

				create table actor(

					ID smallint,
					Nombre varchar(25)
				
                );


/*Exercici 3: Crea una taula anomenada participar sense cap restricció que tingui els camps següents:
    Pelicula_id  □ 	Numèric de 4 xifres
    Actor_id 	 □ 	Numèric de 4 xifres
    Orden 		 □ 	Numèric																						*/

				create table participar (

					pelicula_id smallint,         /*no hace falta poner el (4) porque ya se aclara con el smallint*/
					actor_id smallint,              /*y saltaría un warning cómo que no hace falta*/
					orden smallint
				
                );