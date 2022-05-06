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
 
 -- 3)

select * from estudiante;
select * from persona;
select * from matricula;
select * from nota;
select * from materia;
select * from periodo;
select * from grupo_materia;
select* from grupo;
select* from grado;
select* from nivel ;


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

drop procedure personas_con_letra;

delimiter //
CREATE procedure personas_con_letra(in letra char) 
BEGIN
	select * 
    from persona
    where nombres like concat('%',letra,'%');
	
END//
delimiter ;

call personas_con_letra('A');


delimiter //
CREATE procedure personasVaron(out resultado int) 
BEGIN
	select count(*) into resultado
	from persona
	where genero = 'M';
END//
delimiter ;
call personasVaron(@resultado);
select @resultado

delimiter //
CREATE procedure personasMujer(out resultado int) 
BEGIN
	select count(*) into resultado
	from persona
	where genero = 'F';
END//
delimiter ;
call personasMujer(@resultado);
select @resultado


drop  procedure porcentajeDePersonasVarones;

delimiter //
CREATE procedure porcentajeDePersonasVarones(out resultado int) 
BEGIN
	call personasVaron(@cantVarones);
    call personasMujer(@cantMujeres);
    set resultado = (@cantVarones/(@cantVarones + @cantMujeres))*100;
END//
delimiter ;

call porcentajeDePersonasVarones(@resultado);
select @resultado

