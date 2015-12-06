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

INSERT INTO `combinaciones` (`paredero_id`, `estacion_nombre`) VALUES 
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
('1', '1', 'Linea1', '11-1', '1111', '1', 'A', 'ola ke ase', '1');











