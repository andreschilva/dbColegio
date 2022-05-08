use db_colegio;

-- 1) mostrar los  estudiantes que estan en el grupo 'primero primaria A' del nivel 2 y que son varones
select persona.id, persona.nombres, grupo.nombre
from persona,estudiante, matricula, grupo , grado
where persona.id = estudiante.id and estudiante.id = matricula.estudiante_id and matricula.grupo_id = grupo.id and grupo.grado_id = grado.id 
and grupo.nombre = 'Primero primaria A' and grado.nombre = 'primero' and grado.nivel_id = 2 and persona.genero = 'M';

-- 2) mostrar la nota de matematicas de los estudiantes del grupo 'primero sec. A'  del periodo numero 1, gestion 2022
select persona.id, persona.nombres, grupo.nombre, nota.valor, materia.nombre
from persona, estudiante, matricula, grupo , nota, grupo_materia, materia, periodo
where persona.id = estudiante.id and estudiante.id = matricula.estudiante_id and grupo_materia.grupo_id = grupo.id 
and nota.grupo_materia_id = grupo_materia.id and nota.matricula_id = matricula.id and grupo_materia.materia_id = materia.id and materia.nombre = 'matematicas'
 and  grupo.nombre = 'Primero sec. A' and periodo.numero = 1 and periodo.gestion_id =  1 ;
 
 -- 3) mostrar todos los docentes del grupo 'Primero sec. A' de turno 'manhana' que sean mujeres
 select persona.id, persona.nombres, persona.genero,grupo.nombre, turno.nombre
 from persona, docente, grupo_Materia,grupo, turno
 where  persona.id = docente.id and grupo_materia.docente_id = docente.id and grupo_materia.grupo_id = grupo.id and grupo.turno_id = turno.id
 and grupo.nombre = 'Primero sec. A' and turno.nombre = 'manhana' and persona.genero = 'F';
 
 -- 4) mostrar los estudiantes por turno y por grupo
 select p.id, p.nombres, t.nombre, g.nombre
 from persona p, estudiante e, matricula m, grupo g, turno t
 where p.id = e.id and e.id = m.estudiante_id and m.grupo_id = g.id and g.turno_id = t.id;
 
 -- 5) mostrar los horarios de las materias del grupo 'primero primaria A'
 select horario.id, horario.dia, hora.hora_ini,hora.hora_fin, materia.nombre
 from  grupo, grupo_materia, materia,horario, hora
 where grupo.id = grupo_materia.grupo_id and grupo_materia.id = horario.grupo_materia_id 
 and grupo_materia.materia_id = materia.id and horario.hora_id = hora.id 
 and grupo.nombre = 'primero primaria A';
 
 -- 6) mostrar los grupos del turno tarde que tengan gestiones de tipo periodo bimestral 
 select grupo.id, grupo.nombre, turno.nombre, gestion.tipo_periodo
 from grupo, gestion, turno 
 where grupo.gestion_id = gestion.id and grupo.turno_id = turno.id and gestion.numeros_periodos = '4' and turno.nombre = 'tarde';
 
 -- 7) mostrar los nombres de los estudiantes que no pagaron mensualidad y cuyo pago mensualidad tiene plazo hasta hoy dia
 select persona.id, persona.nombres, mensualidad.fecha_vencimiento, mensualidad.pagado
 from persona, estudiante, matricula, mensualidad
 where persona.id = estudiante.id and estudiante.id = matricula.estudiante_id and mensualidad.matricula_id = matricula.id
 and mensualidad.fecha_vencimiento = curdate() and mensualidad.pagado = 0;

 -- 8) mostrar los permisos que tiene el perfil supAdmin
 select perfil.nombre, funcionalidad.nombre
 from perfil, permiso, funcionalidad
 where perfil.id = permiso.perfil_id and permiso.funcionalidad_id = funcionalidad.id and perfil.nombre = 'supAdmin'
 
 -- 9) mostrar los estudiantes que tienen una nota menor a 51 en 'matematicas'
 -- 10) mostrar los 4 mejores estudiantes varones por grupos
  -- 11) mostrar los 4 mejores estudiantes mujeres por grupos
 -- 12) mostrar el  estudiante con mayor nota promedio del colegio
 -- 13)mostrar los estudiantes cuyo apellido inicie con la letra 's'
 -- 14) mostrar los estudiantes inscritos en la gestion 2022
 -- 15) mostrar los docentes por grupo y turno
 -- 16) mostrar los docentes que dicten la materia de 'lenguaje' 
 -- 17) mostrar las notas de los estudiantes del grupo 'primero primaria A'  del periodo numero 1, gestion 2022
 -- 18) mostrar el nombre de los estudiantes que no tienen correo electronico o telefono 

select * from estudiante;
select * from persona;
select * from docente;
select * from matricula;
select * from nota;
select * from materia;
select * from periodo;
select * from grupo_materia;
select* from grupo;
select* from grado;
select* from nivel ;
select* from gestion ;
select* from perfil ;
select* from permiso;
select* from funcionalidad ;
select* from turno;
select * from horario;
select* from hora;
select* from mensualidad;
select* from pago;








-- 1) Mostrar todas las areas de conocimientos activas actualmente

select * 
from area_conocimiento 
where activo = 1;

-- 2) Mostrar los turnos activos actualmente

select *
from turno 
where activo = 1;

-- 3) Mostrar todas las aulas activas actualmente
select *
from aula 
where activo = 1;

/* 4) Mostrar todas las aulas activas que tengan 
capacidad mayor a 30 estudiantes */

select *
from aula  
where activo = 1 and capacidad > 30;

/* 5) Mostrar los niveles activos actualmente */

select *
from nivel
where activo = 1;

/* 6) Mostrar todas las horas de clase activas */

select *
from hora 
where activo = 1;

/* 7) Mostrar todas las horas de clases cuya hora de inicio
sea menor a las 12 pm */

select *
from hora 
where hora_ini < '12:00:00';

/* 8) Mostrar todas las horas de clases cuya hora de inicio 
sea mayor o igual a las 13:30 pm */

select *
from hora
where hora_ini >= '13:30:00';

/* 9) Mostrar todas las materias activas actualmente*/

select *
from materia 
where activo = 1;

/* 10) Mostrar todas las siglas de las materias */

select sigla 
from  materia

/* 11) Mostrar todos los grados activos actualmente */

select *
from grado 
where activo = 1;

/* 12) Mostrar todos los periodos vigentes */

select *
from periodo
where activo = 1;

/* 13) Mostrar la cantidad de periodos vigentes actualmente */ 

select count(*) as N°Periodos
from periodo
where activo = 1;

/* 14) Mostrar la fecha de finalización del segundo periodo */

select fecha_fin 
from periodo
where numero = 2;

/* 15) Mostrar la fecha de inicio del segundo periodo */ 

select fecha_inicio 
from periodo
where numero = 2;

/* 16) Mostrar la fecha de finalización del primer periodo */

select fecha_fin 
from periodo
where numero = 1;

/* 17) Mostrar la fecha de inicio del primer periodo */ 

select fecha_inicio 
from periodo
where numero = 1;

/* 18) Mostrar todos los módulos activos */

select * 
from modulo
where activo = 1;

/* 19) Mostrar todas las funcionalidades activas */

select *
from funcionalidad 
where activo = 1;

/* 20) Mostrar todas las personas activas en el sistema */

select *
from persona
where activo = 1;

/* 21) Mostrar las personas cuyo género es Femenino */

select *
from persona
where genero = 'F';

/* 22) Mostrar las personas cuyo género es masculino */

select *
from persona
where genero = 'M';

/* 23) Mostrar el  apellido, nombre y CI de las personas activas */

select apellido, nombres, ci 
from persona 
where activo = 1;

/* 24) Mostrar todas las personas cuyo CI fue expedido en SC */

select *
from persona
where ci_exp = 'SC';

/* 25) Contar cuantas personas son mujeres */ 

select count(*) 
from persona
where genero = 'F';

/* 26) Contar cuantas personas son hombres */ 

select count(*) 
from persona
where genero = 'M';

/* 27) Contar cuantas personas tienen telefono */ 

select count(*) 
from persona
where telefono is not null;

/* 28) Contar cuantas personas no tienen telefono */ 

select count(*) 
from persona
where telefono is null;

/* 29) Contar cuantos hombres tienen telefono */ 

select count(*) 
from persona 
where genero = 'M' and telefono is not null;

/* 30) Contar cuantas mujeres tienen telefono */ 

select count(*) 
from persona 
where genero = 'F' and telefono is not null;



delimiter //
DROP PROCEDURE IF EXISTS personas_con_letra//
CREATE procedure personas_con_letra(in letra char) 
BEGIN
	select *
    from persona
    where nombres like concat(letra,'%');
	
END//
delimiter ;

call personas_con_letra('A');


delimiter //
DROP PROCEDURE IF EXISTS estudiantesVaron//
CREATE procedure estudiantesVaron(out resultado int) 
BEGIN
	select count(estudiante.id) into resultado
	from persona, estudiante
	where persona.id = estudiante.id and persona.genero = 'M';
END//
delimiter ;
call estudiantesVaron(@resultado);
select @resultado


delimiter //
DROP PROCEDURE IF EXISTS estudiantesMujer//
CREATE procedure estudiantesMujer(out resultado int) 
BEGIN
	select count(estudiante.id) into resultado
	from persona, estudiante
	where persona.id = estudiante.id and persona.genero = 'F';
END//
delimiter ;
call estudiantesMujer(@resultado);
select @resultado;


drop  procedure porcentajeEstudiantesVarones;

delimiter //
DROP PROCEDURE IF EXISTS porcentajeEstudiantesVarones//
CREATE procedure porcentajeEstudiantesVarones(out resultado int) 
BEGIN
	call estudiantesVaron(@cantVarones);
    call estudiantesMujer(@cantMujeres);
    set resultado = (@cantVarones/(@cantVarones + @cantMujeres))*100;
END//
delimiter ;

call porcentajeEstudiantesVarones(@resultado);
select @resultado as porcentajeEstudiantesVarones;

-- este procedimiento devulve una tabla  con los estudiantes que tengan una 
-- nota igual a la que pongamos en su parametro de entrada
delimiter // 
DROP PROCEDURE IF EXISTS BuscarEstudiantesConNotaIgualA//
CREATE procedure BuscarEstudiantesConNotaIgualA(in valorNota int )
BEGIN
	select persona.id, persona.nombres, nota.valor, materia.nombre
    from persona, estudiante, matricula, nota, grupo_materia, materia
    where persona.id = estudiante.id and estudiante.id = matricula.estudiante_id and matricula.id = nota.matricula_id 
    and nota.grupo_materia_id = grupo_materia.id and grupo_materia.materia_id = materia.id and nota.valor = valorNota;
END//
delimiter ;

select * from nota;
select * from grupo_materia;
select * from materia;

call BuscarEstudiantesConNotaIgualA(82);

-- este procedimiento devuelve una tabla  con los estudiantes que tengan una 
-- nota mayor a la que pongamos en su parametro de entrada
delimiter // 
DROP PROCEDURE IF EXISTS BuscarEstudiantesConNotaMayorA//
CREATE procedure BuscarEstudiantesConNotaMayorA(in valorNota int )
BEGIN
	select persona.id, persona.nombres, nota.valor, materia.nombre
    from persona, estudiante, matricula, nota, grupo_materia, materia
    where persona.id = estudiante.id and estudiante.id = matricula.estudiante_id and matricula.id = nota.matricula_id 
    and nota.grupo_materia_id = grupo_materia.id and grupo_materia.materia_id = materia.id and nota.valor > valorNota;
END//
delimiter ;

select * from nota;
select * from grupo_materia;
select * from materia;

call BuscarEstudiantesConNotaMayorA(51);

-- mouestra todos los docentes por grupo y por turno 
delimiter // 
DROP PROCEDURE IF EXISTS buscardocentesPorGrupo//
CREATE procedure buscardocentesPorGrupo(in nombreGrupo varchar(50), in turno varchar(15))
BEGIN
 select persona.id, persona.nombres, grupo.nombre, turno.nombre
 from persona, docente, grupo_Materia,grupo, turno
 where  persona.id = docente.id and grupo_materia.docente_id = docente.id and grupo_materia.grupo_id = grupo.id and grupo.turno_id = turno.id
 and grupo.nombre = nombreGrupo and turno.nombre = turno;
END//
delimiter ;

call buscardocentesPorGrupo('Primero primaria A', 'manhana');