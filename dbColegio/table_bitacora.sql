use db_colegio;

create table bitacora(
	usuario_id int not null,
	fecha date not null,
	descripcion varchar(120) not null
);
insert into bitacora value(4,curdate(),"Creó la tabla bitácora");
select * from bitacora;