use db_colegio;

-- 1
INSERT INTO `area_conocimiento` (`id`, `nombre`, `activo`) VALUES
(1, 'Comunidad y Sociedad', 1),
(2, 'Ciencia Tecnologia y Produccion', 1),
(3, 'Vida Tierra Territorio', 1);

--
-- tabla `aulas`

INSERT INTO `aula` (`id`, `nombre`, `capacidad`,`activo`) VALUES
(1,'01', 30, 1),
(2,'02', 30,1),
(3,'03', 30,1),
(4, '04', 36, 1),
(5, '05', 30, 1),
(6, '06', 30, 1),
(7, '07', 32, 1),
(8, '08', 30, 1),
(9, '09', 30, 1),
(10, '10', 32,1),
(11, '11', 32, 1),
(12, '12', 32,1);

--
--  tabla `modulos`
--

INSERT INTO `modulo` (`id`, `nombre`, `activo` ) VALUES
(1, 'Seguridad', 1),
(2, 'Academico', 1),
(3, 'Inscripcion', 1),
(4, 'Informes',1);


-- tabla funcionalidades

INSERT INTO `funcionalidad` (`id`, `nombre`, `modulo_id`, `activo`) VALUES
(1, 'Modulos', 1,1),
(2, 'Funcionalidades', 1, 1),
(3, 'Areas de Conocimientos', 2,1),
(4, 'Turnos',2,1),
(5, 'Aulas', 2, 1),
(6, 'Personas', 1, 1),
(7, 'Niveles', 2,1),
(8, 'Horas', 2,1),
(9, 'Materias', 2, 1),
(10, 'Grados', 2,1),
(11, 'Periodos',  2, 1),
(12, 'Perfiles', 1,1),
(13, 'Gestiones', 2,1),
(14, 'Usuarios',  1, 1),
(15, 'Docentes', 2, 1),
(16, 'Estudiantes', 1, 1),
(17,'Grupos',2,1),
(18,'Matriculas',3,1),
(19,'Notas',4,1),
(20,'Mensualidades',3,1),
(21, 'Horarios',2,1);

--
-- tabla `perfil`
--

INSERT INTO `perfil` (`id`, `nombre`,`activo`) VALUES
(1, 'Estudiantes', 1),
(2, 'Docente', 1),
(3, 'supAdmin',1),
(4, 'secretaria',1);

--  tabla `permisos`
--

INSERT INTO `permiso` (`perfil_id`, `funcionalidad_id`) VALUES
( 2, 19),
( 2, 3),
( 2, 4),
( 2, 5),
( 2, 7),
( 2, 8),
( 2, 9),
( 3, 1),
( 3, 2),
( 3, 3),
( 3, 4),
( 3, 5),
( 3, 6),
( 3, 7),
( 3, 8),
( 3, 9),
( 3, 10),
( 3,11),
( 3, 12),
( 3, 13),
( 3, 14),
( 3, 15),
( 3, 16),
( 3, 17),
( 3, 18),
( 3, 19),
( 3, 20),
( 3, 21),
( 4, 17),
( 4, 16),
( 4, 18),
( 4, 19),
(4,20);

--
--  tabla `persona`
--

INSERT INTO `persona` (`id`, `nombres`,`apellido`, `ci`, `ci_exp`,`Genero`, `fecha_nacimiento`, `telefono`, `direccion`, `correo`, `activo`) VALUES
(1, 'Andres', 'Silva', '000001', 'SC','M', '2020-12-28', NULL, NULL, NULL, 1),
(2, 'Pedro', 'Lopez Castro', '4545712', 'SC', 'M','2000-05-20', '74859612', 'calle1', 'pedro@gmail.com', 1),
(3, 'Jose', 'Peredo Rios', '7878787', 'SC','M', '2000-05-20', '74859612','calle2', 'jose@gmail.com', 1),
(4, 'Miguel', 'Calle Gonzales', '8898989', 'SC', 'M','2000-05-20', '74859612', 'calle3', 'miguel@gmail.com', 1),
(5, 'Manuel', 'Castro Montano', '1211212', 'SC','M', '2000-05-20', '74859612','calle1', 'manuel@gmail.com', 1),
(6, 'Simon', 'Mercado Peredo', '3636636', 'SC','M', '2000-05-20', '74859612', 'calle2', 'simon@gmail.com', 1),
(7, 'Maria', 'Rodriguez Farel', '7447474', 'SC', 'F','2000-05-20', '74859612','calle3', 'maria@gmail.com', 1);

INSERT INTO persona values(8, 'Juan', 'Silva', '3659854', 'LP', 'F','1995-05-20', '7482434','calle4', 'Juan@gmail.com', 1);
Update persona set persona.nombres = 'juana' where persona.id = 8;

INSERT INTO `persona` (`id`, `nombres`,`apellido`, `ci`, `ci_exp`,`Genero`, `fecha_nacimiento`, `telefono`, `direccion`, `correo`, `activo`) VALUES
(9, 'Angelica', 'Del Aguila Cuellar',  '556231','SC', 'F', '1965-01-13', '77756000', 'Av. San Aurelio 3er anillo', 'angelicadac@gmail.com',1),
(10, 'Lilian', 'Hurtado Justiniano',  '118542', 'CB', 'F','1971-05-25', '75264989','Av. Santos Dumont 8vo anillo', 'lilianhurtado@gmail.com', 1);
INSERT INTO persona values (11, 'Joaquin', 'chumacero',  '1234567', 'LP', 'M','2005-05-25', '66264989','Av. Santos Dumont 4to anillo', 'joaquin@gmail.com', 1);


--
-- tabla `usuarios`
--

INSERT INTO `usuario` (`id`, `login`, `pass`, `perfil_id`, `activo`) VALUES
(1, 'admin', 'admin123', 3, 1),
(5, '12121212', '654897', 4, 1);

--
--  tabla `estudiante`
--

INSERT INTO `estudiante` (`id`, `login`, `pass`, `perfil_id`, `codigo_rude`, `activo`) VALUES
(2, '45457124', '123456', 1, '45454545', 1),
(3, '78787878', '321456', 1, '56565656', 1),
(4, '89898989', '321456', 1, '96969696',1);
INSERT INTO estudiante values (8, 'juan', 123456,1,'89568965', 1);
INSERT INTO estudiante values (11, 'Joaquin', 654321,1,'78965423', 1);



-- tabla docente

INSERT INTO `Docente` (`id`, `login`, `pass`, `perfil_id`, `codigo_docente`, `activo`) VALUES
(6, '36363636', '654891', 2, '25252525', 1),
(7, '74747474', '321564', 2, '54545454',1),
(9, 'angel', '231564', 2, '26458975',1),
(10, 'lilian', '34343564', 2, '98653212',1);

--
-- tabla `gestion`
--

INSERT INTO `gestion` (`id`, `anio`, `fecha_inicio_clases`, `fecha_final_clases`, `numeros_periodos`, `tipo_periodo`, `activo`) VALUES
(1, 2022, '2022-02-13', '2022-12-01', 4, 'BIMESTRAL', 1);

--
-- tabla `periodos`
--

INSERT INTO `periodo` (`id`, `fecha_inicio`, `fecha_fin`, `numero`, `gestion_id`, `activo`) VALUES
(1, '2022-02-03', '2022-04-30', 1,1,1),
(2, '2022-04-01', '2022-05-31', 2, 1,1),
(3, '2022-06-01', '2022-08-31', 3, 1, 1),
(4, '2022-09-01', '2022-12-01', 4, 1, 1);

--
-- tabla `nivel`
--

INSERT INTO `nivel` (`id`, `nombre`, `numero`, `activo`) VALUES
(1, 'Inicial', 1, 1),
(2, 'Primaria', 2, 1 ),
(3, 'Secundaria', 3, 1);

--
--  tabla `grado`
--

INSERT INTO `grado` (`id`, `nombre`, `numero`, `nivel_id`, `activo`) VALUES
(1, 'Pre Kinder', 1, 1, 1),
(2, 'Kinder', 2, 1, 1),
(3, 'Primero', 3, 2,1),
(4, 'Segundo', 4, 2, 1),
(5, 'Tercero', 5, 2, 1),
(6, 'Cuarto', 6, 2, 1),
(7, 'Quinto', 7, 2,1),
(8, 'Sexto', 8, 2, 1),
(9, 'Primero', 9, 3, 1),
(10, 'Segundo', 10, 3,1),
(11, 'Tercero', 11, 3,1),
(12, 'Cuarto', 12, 3, 1),
(13, 'Quinto', 13, 3, 1),
(14, 'Sexto', 14, 3, 1);

--
--  tabla `turno`
--

INSERT INTO `turno` (`id`, `nombre`, `hora_ini`, `hora_fin`, `activo`) VALUES
(1, 'Manhana', '07:30:00', '12:30:00', 1),
(2, 'Tarde', '13:30:00', '18:30:00', 1);


--
--  tabla `grupo`
--

INSERT INTO `grupo` (`id`, `codigo`, `nombre`, `cupos`, `gestion_id`, `turno_id`, `grado_id`, `aula_id`, `activo`) VALUES
(1, '1A', 'Primero primaria A', 30, 1, 1, 3, 1, 1),
(2, '1B', 'Primero primaria B', 30, 1, 1, 3, 2, 1),
(3, '2A', 'Segundo primaria A', 30, 1, 1, 4, 3, 1),
(4, '3A', 'Tercero primaria A', 30, 1, 1, 5, 4, 1),
(5, '1A', 'Primero sec. A', 30, 1, 1, 9, 5, 1),
(6, '2A', 'Segundo sec. A', 30, 1, 1, 10, 6, 1),
(7, '3A', 'Tercero sec. A', 30, 1, 1,11, 7, 1),
(8, '4A', 'Cuarto sec. A', 30, 1, 1, 12, 8, 1);



--
-- tabla `materia`
--

INSERT INTO `materia` (`id`, `nombre`, `sigla`, `area_conocimiento_id`, `activo`) VALUES
(1, 'Matematicas', 'MAT', 2, 1),
(2, 'Lenguaje', 'LEN', 1, 1),
(3, 'Educacion Musical', 'MUS', 1, 1),
(4, 'Ciencias Sociales', 'CISO', 1, 1);

--
--  tabla `grupo_materia`
--

INSERT INTO `grupo_materia` (`id`, `docente_id`, `materia_id`, `grupo_id`, `activo` ) VALUES
/*grupo materias para primero sec A*/
(1,6,1,5,1),
(2,7,2,5,1),
(3,9,3,5,1),
(4,10,4,5,1),
/*grupo de materias para primero primaria A*/
(5,6,1,1,1),
(6,7,2,1,1),
(7,9,3,1,1),
(8,10,4,1,1);

--
--  `hora`
--

INSERT INTO `hora` (`id`, `hora_ini`, `hora_fin`, `activo`) VALUES
(1, '07:30:00', '09:00:00', 1),
(2, '09:00:00', '10:30:00', 1),
(3, '11:00:00', '12:30:00',1),
(4, '13:30:00', '15:00:00', 1),
(5, '15:30:00', '16:30:00', 1),
(6, '17:00:00', '18:30:00', 1);
 
INSERT INTO `Horario` (`id`,  `Grupo_Materia_Id`,`Dia`, `Hora_Id`,`activo`) VALUES
/*Horario para primero secundaria A*/
(1,1,'Lunes',1,1),
(2,1,'Miercoles',1,1),
(3,2,'Martes',2,1),
(4,2,'Jueves',2,1),
/*Horario para Primero primaria A*/
(5,5,'Lunes',2,1),
(6,5,'Miercoles',2,1),
(7,6,'Martes',3,1),
(8,6,'Jueves',3,1);

--
-- tabla `matricula
--

INSERT INTO `matricula` (`id`, `fecha`, `monto`, `estudiante_id`, `grupo_id`, `observacion`, `anulado`) VALUES
(1, '2022-01-15', '20.00', 2, 1, 'todo ok', 0),
(2, '2022-01-16', '20.00', 3, 1, 'todo ok', 0),
(3, '2022-01-17', '20.00', 4, 5, 'todo ok', 0),
(4, '2022-01-12', '20.00', 8, 5, 'nice' , 0);
INSERT INTO MATRICULA VALUES (5, '2022-01-12', '20.00', 11, 5, 'nice' , 0);



--
-- tabla `nota`
--

INSERT INTO `nota` (`id`, `valor`, `grupo_materia_id`, `periodo_id`, `matricula_id`) VALUES
(1, 82.00, 1, 1, 3),
(2, 93.00, 2, 1, 3),
(3, 86.00 ,3, 1, 3),
(4, 98.00, 4, 1, 3 ),

(5, 83.00, 5, 1, 1),
(6, 83.00, 6, 1,1),
(7, 80.00, 7, 1, 1),
(8, 82.00, 8, 1, 1),

(9, 75.00, 1, 1, 4),
(10, 65.00, 2, 1,4),
(11, 74.00, 3, 1, 4),
(12, 95.00, 4, 1, 4);

insert into nota values(13,60.00,2,1,5);


delete from nota







