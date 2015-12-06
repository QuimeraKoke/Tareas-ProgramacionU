INSERT INTO `Concesionario` (`nombre`) VALUES
('Cons1'),
('Cons2'),
('Cons3'),
('Cons4'),
('Cons5');

INSERT INTO `Chofer` (`rut`, `Concesionario_nombre`,`nombre`) VALUES
('10000000-0','Cons1','Francisco Silva'),
('20000000-0','Cons2','Jose Rojas'),
('30000000-0','Cons3','Patricio Carlos'),
('40000000-0','Cons4','Erika Galindo'),
('50000000-0','Cons5','Soyla Cerda');

INSERT INTO `Bus` (`patente`, `Concesionario_nombre`) VALUES
('PB1111','Cons1'),
('PB1112','Cons1'),
('PB2222','Cons2'),
('PB3333','Cons3'),
('PB4444','Cons4'),
('PB5555','Cons5');


INSERT INTO `Paradero` (`id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16);

INSERT INTO `Recorrido` (`nombre`) VALUES
('A06'),
('A07'),
('B01'),
('F02');

INSERT INTO `Usuario` (`id`) VALUES
(1),
(2),
(3),
(4),
(5);


INSERT INTO `ViajeB` (`bus_patente`,`chofer_rut`,`hora`, `recorrido_nombre`) VALUES
('PB1111', '10000000-0', '2015-10-19 03:00:00.000000','B01'),
('PB2222', '20000000-0', '2015-10-19 03:10:00.000000', 'B01'),
('PB3333', '30000000-0', '2015-10-19 03:05:00.000000', 'F02'),
('PB4444', '40000000-0', '2015-10-19 03:05:00.000000', 'A06'),
('PB5555', '50000000-0', '2015-10-19 03:20:00.000000', 'A07'),
('PB1112', '10000000-0', '2015-10-20 03:00:00.000000','B01');

INSERT INTO `ParaderoEnRecorrido` (`recorrido_nombre`, `paradero_id`, `numero`) VALUES
('A06', 6, '1'),
('A06', 7, '2'),
('A06',9, '3'),
('A06', 10, '4'),
('A06', 11, '5'),
('A06',15, '6'),
('A07', 8, '1'),
('A07', 11, '2'),
('A07', 13, '3'),
('A07', 16, '4'),
('B01', 1, '1'),
('B01', 3, '2'),
('B01', 4, '3'),
('B01', 9, '4'),
('B01', 14, '5'),
('F02', 2, '1'),
('F02', 4, '2'),
('F02', 5, '3'),
('F02', 12, '4'),
('F02',16, '5');

INSERT INTO `UsuarioEnBus` (`viajeB_patente`, `viajeB_Chofer_rut`, `viajeB_Recorrido_nombre`, `usuario_id`, `paradero_id`, `hora`, `bip_id`) VALUES
('PB1111', '10000000-0','B01',1,3, '2015-10-19 03:14:00',1),
('PB2222', '20000000-0','B01', 2, 1, '2015-10-19 03:10:00',3),
('PB3333', '30000000-0','F02', 3,5, '2015-10-19 03:20:00',4),
('PB4444', '40000000-0','A06',4, 7, '2015-10-19 03:15:00',2),
('PB5555', '50000000-0','A07',5, 8, '2015-10-19 03:25:00',5);

INSERT INTO `QuejasBus` (`usuario_id`, `viajeB_Bus_patente`, `viajeB_Chofer_rut`, `viajeB_Recorrido_nombre`, `viajeB_Usuario_id`, `viajeB_Paradero_id`, `viajeB_Bip_id`,`tipo`,`mensaje`) VALUES
(1, 'PB1111', '10000000-0','B01', 1,3,2, 2, 'el conductor era grosero'),
(2, 'PB2222', '20000000-0','B01', 2,1,2, 3, 'el recorrido es muy largo y no pasa por mi casa');

INSERT INTO `bip` (`id`) VALUES 
('1'),
('2'),
('3'),
('4'),
('5');

INSERT INTO `conductor` (`rut`, `nombre`) VALUES 
('11-1', 'Elsa Polindo'),
('22-2', 'Arnold Schwarzenegger'),
('33-3', 'Silvester Calzzone'),
('44-4', 'Jorge Gutierrez'),
('55-5', 'Alejandra Olguin'),
('66-6', 'Jaime Capponi'),
('77-7', 'Jorge Perez');

INSERT INTO `estacion` (`nombre`) VALUES 
('A'),
('B'),
('C'),
('D'),
('E'),
('F'),
('X');

INSERT INTO `linea` (`nombre`) VALUES 
('Linea1'),
('Linea2');

INSERT INTO `combinaciones` (`paradero_id`, `estacion_nombre`) VALUES 
('1', 'A'),
('3', 'B'),
('2', 'B'),
('4', 'X'),
('2', 'D'),
('5', 'C'),
('9', 'E'),
('10', 'E'),
('11', 'E'),
('16', 'F'),
('13', 'F');

INSERT INTO `tren` (`patente`) VALUES 
('1111'),
('2222'),
('3333'),
('4444'),
('5555');

INSERT INTO `estacionenlinea` (`Estacion_nombre`, `Linea_nombre`, `numero`) VALUES 
('A', 'Linea1', '1'),
('B', 'Linea1', '2'),
('X', 'Linea1', '3'),
('C', 'Linea1', '4'),
('D', 'Linea2', '1'),
('X', 'Linea2', '1'),
('E', 'Linea2', '1'),
('F', 'Linea2', '1');

INSERT INTO `viajem` (`linea_nombre`, `conductor_rut`, `tren_patente`, `hora`, `direccion`) VALUES 
('Linea1', '11-1', '1111', '2015-12-01 00:00:00', '0'),
('Linea1', '11-1', '1111', '2015-12-02 00:00:00', '0'),
('Linea1', '11-1', '1111', '2015-12-03 00:00:00', '0'),
('Linea2', '22-2', '2222', '2015-12-01 00:00:00', '0'),
('Linea2', '22-2', '2222', '2015-12-02 00:00:00', '0'),
('Linea2', '22-2', '2222', '2015-12-03 00:00:00', '0');

INSERT INTO `usuarioenmetro` (`usuario_id`, `viajeM_Linea_nombre`, `viajeM_Conductor_rut`, `viajeM_Tren_patente`, `bip_id`, `estacion_nombre`, `hora`) VALUES 
('1', 'Linea1', '11-1', '1111', '1', 'A', '2015-12-01 00:00:00'),
('2', 'Linea2', '22-2', '2222', '2', 'D', '2015-12-01 00:00:00');

INSERT INTO `quejasmetro` (`usuario_id`, `viajeM_Usuario_id`, `viajeM_Linea_name`, `viajeM_Conductor_rut`, `viajeM_Metro_patente`, `viajeM_Bip_id`, `viajeM_Estacion_name`, `mensaje`, `tipo`) VALUES 
('1', '1', 'Linea1', '11-1', '1111', '1', 'A', 'Perro muerto en el vagon', '1');
