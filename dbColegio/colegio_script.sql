create database db_colegio;
use db_colegio;
drop database db_colegio;

create table aula(
	id int auto_increment,
	nombre varchar(20) not null ,
    capacidad smallint ,
	activo bit not null default 1,
	primary key(id)
);

create table hora(
	id int auto_increment ,
	hora_ini time not null,
	hora_fin time not null,
	activo bit not null default 1,
	primary key(id)
);

create table turno(
	id int auto_increment,
	nombre varchar(40) not null,
	hora_ini time not null,
	hora_fin time not null,
	activo bit not null default 1,
	primary key(id)
);


create table area_conocimiento(
	id int auto_increment,
	nombre varchar(50) not null,
	activo bit not null default 1,
	primary key(id)
);

create table materia(
	id int auto_increment,
	nombre varchar(50) not null,
	sigla varchar(20) not null,
	area_conocimiento_id int not null,
    activo bit not null default 1,
	primary key(id),
	foreign key (area_conocimiento_id) references area_conocimiento(id) on update cascade on delete no action
);

create table modulo(
	id int auto_increment,
	Nombre varchar(50) not null,
	activo bit not null default 1,
	primary key(id)
);

create table Funcionalidad(
	id int auto_increment,
	Nombre varchar(50) not null,
	modulo_id int not null,
	activo bit not null default 1,
	primary key(id),
	foreign key (modulo_id) references modulo(id) on update cascade
);

create table perfil(
	id int auto_increment,
	nombre varchar(50) not null,
	activo bit not null default 1,
	primary key(id)
);

create table permiso(
	perfil_id int not null,
	funcionalidad_id int not null,
	primary key(perfil_id, funcionalidad_id),
	foreign key (perfil_id) references perfil(id) on update cascade,
	foreign key (funcionalidad_id) references funcionalidad(id) on update cascade
);


create table persona(
	id int auto_increment,
	nombres varchar(50) not null,
	apellido varchar(50) not null,
	ci varchar(9) not null,
    ci_exp varchar(2) not null,
    Genero varchar(1) not null,
	fecha_nacimiento date not null,
	telefono varchar(12) ,
	direccion varchar(200),
	correo varchar(100),
	activo bit not null default 1,
	primary key(id)
);



create table usuario(
	id int not null,
	login varchar(40) not null,
	pass varchar(50) not null,
	perfil_id int not null,
	activo bit not null default 1,
	primary key(id),
	foreign key (id) references persona(id) on update cascade,
	foreign key (perfil_id) references perfil(id) on update cascade
);

create table estudiante(
	id int not null,
	login varchar(40) not null,
	pass varchar(50) not null ,
	perfil_id int not null,
	codigo_rude varchar(20) not null,
	activo bit not null default 1,
	primary key(id),
	foreign key (id) references persona(id) on update cascade,
	foreign key (perfil_id) references perfil(id) on update cascade
);

create table docente(
	id int not null,
	login varchar(40) not null,
	pass varchar(50) not null,
	perfil_id int not null,
	codigo_docente varchar(20) not null,
	activo bit not null default 1,
	primary key(id),
	foreign key (id) references persona(id) on update cascade,
	foreign key (perfil_id) references perfil(id) on update cascade
);

create table gestion(
	id int auto_increment,
	anio int not null,
	fecha_inicio_clases date not null,
	fecha_final_clases date not null,
	numeros_periodos int not null,
	tipo_periodo char(11) not null,
	activo bit not null default 1,
	primary key(id)
);


create table periodo(
	id int auto_increment,
	fecha_inicio date not null,
	fecha_fin date not null,
	numero int not null,
	gestion_id int not null,
	activo bit not null default 1,
	primary key(id),
	foreign key (gestion_id) references gestion(id) on update cascade
);

create table nivel(
	id int auto_increment,
	nombre varchar(20) not null,
	numero int not null,
	activo bit not null default 1,
	primary key(id)
);

create table grado(
	id int auto_increment,
	nombre varchar(15) not null,
	numero int not null,
	nivel_id int not null,
	activo bit not null default 1,
	primary key(id),
	foreign key (nivel_id) references nivel(id) on update cascade
);


create table grupo(
	id int auto_increment,
	codigo varchar(30) not null,
	nombre varchar(30) not null,
	cupos int not null,
	gestion_id int not null,
	turno_id int not null,
	grado_id int not null,
	aula_id int not null,
	activo bit not null default 1,
	primary key(id),
	foreign key (gestion_id) references gestion(id) on update cascade,
	foreign key (turno_id) references turno(id) on update cascade,
	foreign key (grado_id) references grado(id) on update cascade,
	foreign key (aula_id) references aula(id) on update cascade
);


create table grupo_materia(
	id int auto_increment,
	docente_id int not null,
	materia_id int not null,
	grupo_id int not null,
	activo bit not null default 1,		
	primary key(id),
	foreign key (docente_id) references docente(id) on update cascade,
	foreign key (materia_id) references materia(id) on update cascade,
	foreign key (grupo_id) references grupo(id) on update cascade
);

create table matricula(
	id int auto_increment,
	fecha date not null,
	monto decimal(10,2) null default 0,		
	estudiante_id int not null,
	grupo_id int not null,
	observacion varchar(250),
	anulado bit not null default 1,
	primary key(id),
	foreign key (estudiante_id) references estudiante(id) on update cascade,
	foreign key (grupo_id) references grupo(id) on update cascade
);

create table nota(
	id int auto_increment,
	valor decimal(5,2) not null default 0,
	grupo_materia_id int not null,
	periodo_id int not null,
	matricula_id int not null,
	primary key(id),
	foreign key (grupo_materia_id) references grupo_materia(id) on update cascade,
	foreign key (periodo_id) references periodo(id) on update cascade,
	foreign key (matricula_id) references matricula(id) on update cascade
);

create table mensualidad(
	id int auto_increment,
	fecha_vencimiento date ,
	mes varchar(10) not null,
	monto decimal(10,2) not null default 0,
	matricula_id int not null,
	pagado bit not null default 0,
	primary key(id),
	foreign key (matricula_id) references matricula(id) on update cascade
);

create table pago(
	id int auto_increment,
	fecha date not null,
	monto decimal(10,2) not null,
	mensualidad_id int not null,
	anulado bit not null default 0,
	primary key(id),
	foreign key (mensualidad_id) references mensualidad(id) on update cascade
);

create table horario(
	id int auto_increment,
	grupo_materia_id int not null,
    Dia varchar(9) not null,
    Hora_id int not null,
	activo bit not null default 1,
	primary key(id,grupo_materia_id),
	foreign key (grupo_materia_id) references grupo_materia(id) on update cascade,
    foreign key (Hora_id) references Hora(id) on update cascade   
);


