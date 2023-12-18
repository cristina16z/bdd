/* 1. Crea la taula Clients amb les següents característiques:
- Codi_cli de tipus numèric de 5 posicions
- Nom_cli de tipus caràcter de 30 posicions. No ha d’admetre valors NULLS.
- NIF de tipus caràcter de 10 posicions.
- Adreca de tipus caràcter de 30 posicions
- Ciutat de tipus caràcter de 30 posicions
- Telefon de tipus caràcter de 12 posicions
- Clau primària: Codi_cli                                                                                                       */

create table clients (
	codi_cli mediumint,
	nom_cli bigint not null,
	nif char(10),
	adreca varchar (30),
	ciutat varchar (30),
	telefon char(12),
	constraint pk_codi_cli primary key (codi_cli)
);

/* 2. Crea la taula Projectes amb les següents característiques:
- Codi_proj de tipus numèric de 3 posicions
- Nom_proj de tipus caràcter de 20 posicions. No ha d’admetre valors NULLS
- Preu de tipus numèric de 8 posicions per a la part sencera i 2 per a la part decimal. No ha d’admetre valors NULLS.
- Data_inici de tipus data. No ha d’admetre valors NULLS
- Data_prev_fi de tipus data. No ha d’admetre valors NULLS
- Retencio de tipus numèric de 2 posicions
- Codi_cli de tipus numèric de 5 posicions
- Clau primària: Codi_proj                                                                                                      */

create table projectes (
	codi_proj smallint,
	nom_proj varchar (30) not null,
	preu float (8,2) not null,
	data_inici date not null,
	data_prev_fi date not null,
	retencio tinyint,
	codi_cli smallint,
	constraint pk_codi primary key (codi_proj)
);

/* 3. Crea la taula departaments amb les següents característiques:
- Nom_dpt de tipus caràcter de 20 posicions
- Ciutat_dpt de tipus caràctes de 20 posicions
- Telefon de tipus numèric de 9 posicions. No ha d’admetre valors NULLS
- Clau primària Nom_dpt + ciutat_dpt                                                                                            */

create table departaments (
	nom_dpt varchar(20),
	ciutat_dpt varchar(20),
	telefon int not null,
	constraint pk_dos primary key (nom_dpt, ciutat_dpt)
);

/* 4. Crea la taula Empleats amb les següents característiques:
- Codi_empl de tipus numèric de 3 posicions
- Nom_empl de tipus caràcter de 20 posicions
- Cognom_empl de tipus caràcter de 20 posicions
- Sou de tipus numèric de 6 posicions per a la part sencera i 2 posicions per a decimals. No ha d’admetre valors NULLS
- Nom_dpt de tipus caràcter de 20 posicions
- Ciutat_dpt de tipus caràcter de 20 posicions
- Codi_proj de tipus numèric de 3 posicions
- Clau primària codi_empl                                                                                                       */

create table empleats(
	codi_empl tinyint,
	nom_empl varchar (20),
	cognom_empl varchar(20),
	sou float (6,2) not null,
	nom_dpt varchar (20),
	ciutat_dpt varchar(20),
	codi_proj smallint,
	constraint pk_codi primary key (codi_empl)
);

/* 5. Afegeix restriccions a la taula Empleats per tal que els camps Nom_empl i
Cognom_empl no acceptin valors NULLS                                                                                            */
alter table empleats
	add constraint notnull_empleat check (nom_empl is not null),
	add constraint notnull_cognom check (cognom_empl is not null);


/* 6. Modifica la taula empleats de forma que el camp cognom_empl admeti valors alfanumèrics de fins 50 caràcters.              */
alter table empleats modify cognom_empl varchar (50);


/* 7. Modifica la taula empleats de forma que el sou tingui un valor per defecte de 1100,50 €.                                  */
alter table empleats modify sou float (6,2) default '1100.50' not null;


/* 8. Modifica la taula projectes i elimina el camp retencio                                                                     */
alter table projectes drop column retencio;


/* 9. Modifica la taula departaments de forma que el camp telèfon admeti valors alfanumèrics de 12 posicions	                */
alter table departaments modify telefon bigint;


/* 10. Afegeix una restricció a la taula Projectes per tal de comprovar que la data inici
sigui sempre inferior a la data prevista de finalització                                                                        */
alter table projectes add constraint ch_data check (data_inici < data_prev_fi);


/* 11. Afegeix o modifica una restricció a la taula empleats, de forma que la columna codi_proj 
faci referència a projectes i si s’elimina un projecte, els empleats que estiguessin assignats al projecte eliminat
passin a no tenir cap projecte assignat (NULL)                                                                                  */
alter table empleats add constraint fk_codiproj FOREIGN key (codi_proj) references projectes (codi_proj) on delete set null;


/* 12. Afegeix o modifica una restricció a la taula empleats, de forma que si s’elimina
un departament, automàticament es donin de baixa tots els empleats que hi estan assignats.                                      */
alter table empleats add constraint fk_dos FOREIGN key ( ciutat_dpt, nom_dpt) references departaments (ciutat_dpt, nom_dpt) on delete cascade; 
alter table empleats add constraint fk_nom FOREIGN key (nom_dpt) references departaments (nom_dpt) on delete cascade;
alter table empleats add constraint fk_ciutat_dpt FOREIGN key (ciutat_dpt) references departaments (ciutat_dpt) on delete cascade;


/* 13. Crea les restriccions que falten per tal de garantir la consistència de la base de dades en quant a claus foranes.        */


/*14. Afegeix o modifica una restricció a la taula clients per tal d’indicar que el camp NIF és una clau alternativa             */
alter table clients add constraint uq_nif unique (nif);


/* 15. D’acord a les polítiques de claus foranes que hagis creat, 
¿què passaria amb la resta de taules si esborrem el client amb codi 30?
(Si ho vols provar fes-ho sobre una còpia local) */


/* 16. I si esborrem el departament {DIR, Barcelona} (Si ho vols provar fes-ho sobre una còpia local) */


/* 17. Afegeix una restricció a la taula Empleats per tal de comprovar que el sou sigui sempre superior o igual a 1.000.          */
alter table empleats add constraint ch_sou check (sou >=1.000);


                                                                                                                /* Nada corregido */

