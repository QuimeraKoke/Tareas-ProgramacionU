SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `Tarea1` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `Tarea1` ;

-- -----------------------------------------------------
-- Table `Tarea1`.`Concesionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tarea1`.`Concesionario` (
  `Nombre` VARCHAR(45) NULL,
  `RUT` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`RUT`))
ENGINE = InnoDB;
INSERT INTO `Concesionario` (`Nombre`, `RUT`) VALUES
('Cons1', '11111111-1'),
('Cons2', '22222222-2'),
('Cons3', '33333333-3'),
('Cons4', '44444444-4'),
('Cons5', '55555555-5');

-- -----------------------------------------------------
-- Table `Tarea1`.`Conductor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tarea1`.`Conductor` (
  `RUT` VARCHAR(10) NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Concesionario_RUT` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`RUT`),
  INDEX `fk_Conductor_Concesionario1_idx` (`Concesionario_RUT` ASC),
  CONSTRAINT `fk_Conductor_Concesionario1`
    FOREIGN KEY (`Concesionario_RUT`)
    REFERENCES `Tarea1`.`Concesionario` (`RUT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
INSERT INTO `Conductor` (`RUT`, `Nombre`, `Concesionario_RUT`) VALUES
('10000000-0', 'Juanito', (SELECT RUT from Tarea1.Concesionario WHERE RUT='11111111-1')),
('20000000-0', 'Pedrito', (SELECT RUT from Tarea1.Concesionario WHERE RUT='22222222-2')),
('30000000-0', 'Dieguito', (SELECT RUT from Tarea1.Concesionario WHERE RUT='33333333-3')),
('40000000-0', 'Jaimito', (SELECT RUT from Tarea1.Concesionario WHERE RUT='44444444-4')),
('50000000-0', 'Pepito', (SELECT RUT from Tarea1.Concesionario WHERE RUT='55555555-5'));

-- -----------------------------------------------------
-- Table `Tarea1`.`Bus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tarea1`.`Bus` (
  `Patente` VARCHAR(6) NOT NULL,
  `Concesionario_RUT` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Patente`),
  INDEX `fk_Bus_Concesionario_idx` (`Concesionario_RUT` ASC),
  CONSTRAINT `fk_Bus_Concesionario`
    FOREIGN KEY (`Concesionario_RUT`)
    REFERENCES `Tarea1`.`Concesionario` (`RUT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
INSERT INTO `Bus` (`Patente`, `Concesionario_RUT`) VALUES
('PB1111', (SELECT RUT from Tarea1.Concesionario WHERE RUT='11111111-1')),
('PB1112', (SELECT RUT from Tarea1.Concesionario WHERE RUT='11111111-1')),
('PB2222', (SELECT RUT from Tarea1.Concesionario WHERE RUT='22222222-2')),
('PB3333', (SELECT RUT from Tarea1.Concesionario WHERE RUT='33333333-3')),
('PB4444', (SELECT RUT from Tarea1.Concesionario WHERE RUT='44444444-4')),
('PB5555', (SELECT RUT from Tarea1.Concesionario WHERE RUT='55555555-5'));

-- -----------------------------------------------------
-- Table `Tarea1`.`Paradero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tarea1`.`Paradero` (
  `id` INT NOT NULL,
  `Calle` VARCHAR(200) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

INSERT INTO `Paradero` (`id`, `Calle`) VALUES
(1, 'C'),
(2, 'F'),
(3, '4'),
(4, '4'),
(5, 'J'),
(6, '6'),
(7, '6'),
(8, '7'),
(9, 'I'),
(10, '8'),
(11, 'B'),
(12, 'J'),
(13, '10'),
(14, '10'),
(15, 'B'),
(16, 'F');
-- -----------------------------------------------------
-- Table `Tarea1`.`Recorrido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tarea1`.`Recorrido` (
  `Nombre` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Nombre`))
ENGINE = InnoDB;
INSERT INTO `Recorrido` (`Nombre`) VALUES
('A06'),
('A07'),
('B01'),
('F02');

-- -----------------------------------------------------
-- Table `Tarea1`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tarea1`.`Usuario` (
  `id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;
INSERT INTO `Usuario` (`id`) VALUES
(1),
(2),
(3),
(4),
(5);

-- -----------------------------------------------------
-- Table `Tarea1`.`Viaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tarea1`.`Viaje` (
  `Conductor_RUT` VARCHAR(10) NOT NULL,
  `Bus_Patente` VARCHAR(6) NOT NULL,
  `Recorrido_Nombre` VARCHAR(10) NOT NULL,
  `hora` TIMESTAMP NULL,
  PRIMARY KEY (`Conductor_RUT`, `Bus_Patente`, `Recorrido_Nombre`),
  INDEX `fk_Conductor_has_Bus_Bus1_idx` (`Bus_Patente` ASC),
  INDEX `fk_Conductor_has_Bus_Conductor1_idx` (`Conductor_RUT` ASC),
  INDEX `fk_Conductor_has_Bus_Recorrido1_idx` (`Recorrido_Nombre` ASC),
  CONSTRAINT `fk_Conductor_has_Bus_Conductor1`
    FOREIGN KEY (`Conductor_RUT`)
    REFERENCES `Tarea1`.`Conductor` (`RUT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Conductor_has_Bus_Bus1`
    FOREIGN KEY (`Bus_Patente`)
    REFERENCES `Tarea1`.`Bus` (`Patente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Conductor_has_Bus_Recorrido1`
    FOREIGN KEY (`Recorrido_Nombre`)
    REFERENCES `Tarea1`.`Recorrido` (`Nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
INSERT INTO `Viaje` (`Bus_Patente`, `Conductor_RUT`, `hora`, `Recorrido_Nombre`) VALUES
((SELECT Patente from Tarea1.Bus WHERE Patente='PB1111'), (SELECT RUT from Tarea1.Conductor WHERE RUT='10000000-0'), '2015-10-19 03:00:00.000000',(SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre ='B01')),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB2222'), (SELECT RUT from Tarea1.Conductor WHERE RUT='20000000-0'), '2015-10-19 03:10:00.000000', (SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre ='B01')),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB3333'), (SELECT RUT from Tarea1.Conductor WHERE RUT='30000000-0'), '2015-10-19 03:05:00.000000', (SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre ='F02')),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB4444'), (SELECT RUT from Tarea1.Conductor WHERE RUT='40000000-0'), '2015-10-19 03:05:00.000000', (SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre ='A06')),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB5555'), (SELECT RUT from Tarea1.Conductor WHERE RUT='50000000-0'), '2015-10-19 03:20:00.000000', (SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre ='A07')),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB1112'), (SELECT RUT from Tarea1.Conductor WHERE RUT='10000000-0'), '2015-10-20 03:00:00.000000',(SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre ='B01'));


-- -----------------------------------------------------
-- Table `Tarea1`.`ViajeUsuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tarea1`.`ViajeUsuario` (
  `Usuario_id` INT NOT NULL,
  `Viaje_Conductor_RUT` VARCHAR(10) NOT NULL,
  `Viaje_Bus_Patente` VARCHAR(6) NOT NULL,
  `Viaje_Recorrido_Nombre` VARCHAR(10) NOT NULL,
  `Paradero_id` INT NOT NULL,
  `hora` TIMESTAMP NOT NULL,
  PRIMARY KEY (`Usuario_id`, `Viaje_Conductor_RUT`, `Viaje_Bus_Patente`, `Viaje_Recorrido_Nombre`, `Paradero_id`),
  INDEX `fk_Usuario_has_Viaje_Viaje1_idx` (`Viaje_Conductor_RUT` ASC, `Viaje_Bus_Patente` ASC, `Viaje_Recorrido_Nombre` ASC),
  INDEX `fk_Usuario_has_Viaje_Usuario1_idx` (`Usuario_id` ASC),
  INDEX `fk_Usuario_has_Viaje_Paradero1_idx` (`Paradero_id` ASC),
  CONSTRAINT `fk_Usuario_has_Viaje_Usuario1`
    FOREIGN KEY (`Usuario_id`)
    REFERENCES `Tarea1`.`Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Viaje_Viaje1`
    FOREIGN KEY (`Viaje_Conductor_RUT` , `Viaje_Bus_Patente` , `Viaje_Recorrido_Nombre`)
    REFERENCES `Tarea1`.`Viaje` (`Conductor_RUT` , `Bus_Patente` , `Recorrido_Nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Viaje_Paradero1`
    FOREIGN KEY (`Paradero_id`)
    REFERENCES `Tarea1`.`Paradero` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
INSERT INTO `ViajeUsuario` (`Viaje_Bus_Patente`, `Viaje_Conductor_RUT`, `Viaje_Recorrido_Nombre`, `Usuario_id`, `Paradero_id`, `hora`) VALUES
((SELECT Patente from Tarea1.Bus WHERE Patente='PB1111'), (SELECT RUT from Tarea1.Conductor WHERE RUT='10000000-0'), (SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'B01'), (SELECT id FROM Tarea1.Usuario WHERE id =1),(SELECT id FROM Tarea1.Paradero WHERE id = 3), '2015-10-19 03:14:00'),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB2222'), (SELECT RUT from Tarea1.Conductor WHERE RUT='20000000-0'), (SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'B01'),(SELECT id FROM Tarea1.Usuario WHERE id = 2), (SELECT id FROM Tarea1.Paradero WHERE id = 1), '2015-10-19 03:10:00'),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB3333'), (SELECT RUT from Tarea1.Conductor WHERE RUT='30000000-0'), (SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'F02'),(SELECT id FROM Tarea1.Usuario WHERE id = 3),(SELECT id FROM Tarea1.Paradero WHERE id =  5), '2015-10-19 03:20:00'),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB4444'), (SELECT RUT from Tarea1.Conductor WHERE RUT='40000000-0'), (SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'A06'), (SELECT id FROM Tarea1.Usuario WHERE id =4), (SELECT id FROM Tarea1.Paradero WHERE id = 7), '2015-10-19 03:15:00'),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB5555'), (SELECT RUT from Tarea1.Conductor WHERE RUT='50000000-0'), (SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'A07'), (SELECT id FROM Tarea1.Usuario WHERE id =5), (SELECT id FROM Tarea1.Paradero WHERE id = 8), '2015-10-19 03:25:00');

-- -----------------------------------------------------
-- Table `Tarea1`.`Itinerario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tarea1`.`Itinerario` (
  `Viaje_Conductor_RUT` VARCHAR(10) NOT NULL,
  `Viaje_Bus_Patente` VARCHAR(6) NOT NULL,
  `Viaje_Recorrido_Nombre` VARCHAR(10) NOT NULL,
  `Paradero_id` INT NOT NULL,
  `tiempo` TIMESTAMP NOT NULL,
  PRIMARY KEY (`Viaje_Conductor_RUT`, `Viaje_Bus_Patente`, `Viaje_Recorrido_Nombre`, `Paradero_id`),
  INDEX `fk_Viaje_has_Paradero_Paradero1_idx` (`Paradero_id` ASC),
  INDEX `fk_Viaje_has_Paradero_Viaje1_idx` (`Viaje_Conductor_RUT` ASC, `Viaje_Bus_Patente` ASC, `Viaje_Recorrido_Nombre` ASC),
  CONSTRAINT `fk_Viaje_has_Paradero_Viaje1`
    FOREIGN KEY (`Viaje_Conductor_RUT` , `Viaje_Bus_Patente` , `Viaje_Recorrido_Nombre`)
    REFERENCES `Tarea1`.`Viaje` (`Conductor_RUT` , `Bus_Patente` , `Recorrido_Nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Viaje_has_Paradero_Paradero1`
    FOREIGN KEY (`Paradero_id`)
    REFERENCES `Tarea1`.`Paradero` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
INSERT INTO `Itinerario` (`Viaje_Bus_Patente`, `Viaje_Conductor_RUT`, `Viaje_Recorrido_Nombre`, `Paradero_id`, `tiempo`) VALUES
((SELECT Patente from Tarea1.Bus WHERE Patente='PB1111'), (SELECT RUT from Tarea1.Conductor WHERE RUT='10000000-0'), (SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'B01'),(SELECT id FROM Tarea1.Paradero WHERE id =  1), '2015-10-19 03:05:00'),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB1111'), (SELECT RUT from Tarea1.Conductor WHERE RUT='10000000-0'), (SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'B01'),(SELECT id FROM Tarea1.Paradero WHERE id =  3), '2015-10-19 03:14:00'),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB1111'), (SELECT RUT from Tarea1.Conductor WHERE RUT='10000000-0'),(SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'B01'), (SELECT id FROM Tarea1.Paradero WHERE id = 4), '2015-10-19 03:28:00'),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB1111'), (SELECT RUT from Tarea1.Conductor WHERE RUT='10000000-0'),(SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre =  'B01'),(SELECT id FROM Tarea1.Paradero WHERE id =  9), '2015-10-19 03:30:00'),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB1111'), (SELECT RUT from Tarea1.Conductor WHERE RUT='10000000-0'), (SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'B01'), (SELECT id FROM Tarea1.Paradero WHERE id = 14), '2015-10-19 03:40:00'),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB2222'), (SELECT RUT from Tarea1.Conductor WHERE RUT='20000000-0'), (SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'B01'),(SELECT id FROM Tarea1.Paradero WHERE id =  1), '2015-10-19 03:10:00'),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB2222'), (SELECT RUT from Tarea1.Conductor WHERE RUT='20000000-0'),(SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre =  'B01'), (SELECT id FROM Tarea1.Paradero WHERE id = 3), '2015-10-19 03:20:00'),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB2222'), (SELECT RUT from Tarea1.Conductor WHERE RUT='20000000-0'), (SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'B01'),(SELECT id FROM Tarea1.Paradero WHERE id =  4), '2015-10-19 03:30:00'),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB2222'), (SELECT RUT from Tarea1.Conductor WHERE RUT='20000000-0'), (SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'B01'),(SELECT id FROM Tarea1.Paradero WHERE id =  9), '2015-10-19 03:38:00'),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB2222'), (SELECT RUT from Tarea1.Conductor WHERE RUT='20000000-0'), (SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'B01'), (SELECT id FROM Tarea1.Paradero WHERE id = 14), '2015-10-19 03:50:00'),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB3333'), (SELECT RUT from Tarea1.Conductor WHERE RUT='30000000-0'), (SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'F02'),(SELECT id FROM Tarea1.Paradero WHERE id =  2), '2015-10-19 03:10:00'),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB3333'), (SELECT RUT from Tarea1.Conductor WHERE RUT='30000000-0'), (SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'F02'),(SELECT id FROM Tarea1.Paradero WHERE id =  4), '2015-10-19 03:15:00'),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB3333'), (SELECT RUT from Tarea1.Conductor WHERE RUT='30000000-0'), (SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'F02'),(SELECT id FROM Tarea1.Paradero WHERE id =  5), '2015-10-19 03:20:00'),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB3333'), (SELECT RUT from Tarea1.Conductor WHERE RUT='30000000-0'), (SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'F02'),(SELECT id FROM Tarea1.Paradero WHERE id =  12), '2015-10-19 03:25:00'),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB3333'), (SELECT RUT from Tarea1.Conductor WHERE RUT='30000000-0'), (SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'F02'),(SELECT id FROM Tarea1.Paradero WHERE id =  16), '2015-10-19 03:40:00'),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB4444'), (SELECT RUT from Tarea1.Conductor WHERE RUT='40000000-0'), (SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'A06'), (SELECT id FROM Tarea1.Paradero WHERE id = 6), '2015-10-19 03:10:00'),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB4444'), (SELECT RUT from Tarea1.Conductor WHERE RUT='40000000-0'),(SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre =  'A06'), (SELECT id FROM Tarea1.Paradero WHERE id = 7), '2015-10-19 03:15:00'),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB4444'), (SELECT RUT from Tarea1.Conductor WHERE RUT='40000000-0'), (SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'A06'), (SELECT id FROM Tarea1.Paradero WHERE id = 9), '2015-10-19 03:20:00'),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB4444'), (SELECT RUT from Tarea1.Conductor WHERE RUT='40000000-0'), (SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'A06'), (SELECT id FROM Tarea1.Paradero WHERE id = 10), '2015-10-19 03:25:00'),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB4444'), (SELECT RUT from Tarea1.Conductor WHERE RUT='40000000-0'),(SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre =  'A06'), (SELECT id FROM Tarea1.Paradero WHERE id = 11), '2015-10-19 03:35:00'),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB4444'), (SELECT RUT from Tarea1.Conductor WHERE RUT='40000000-0'), (SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'A06'), (SELECT id FROM Tarea1.Paradero WHERE id = 15), '2015-10-19 03:40:00'),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB5555'), (SELECT RUT from Tarea1.Conductor WHERE RUT='50000000-0'), (SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'A07'),(SELECT id FROM Tarea1.Paradero WHERE id =  8), '2015-10-19 03:25:00'),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB5555'), (SELECT RUT from Tarea1.Conductor WHERE RUT='50000000-0'),(SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre =  'A07'), (SELECT id FROM Tarea1.Paradero WHERE id = 11), '2015-10-19 03:35:00'),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB5555'), (SELECT RUT from Tarea1.Conductor WHERE RUT='50000000-0'), (SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'A07'), (SELECT id FROM Tarea1.Paradero WHERE id = 13), '2015-10-19 03:45:00'),
((SELECT Patente from Tarea1.Bus WHERE Patente='PB5555'), (SELECT RUT from Tarea1.Conductor WHERE RUT='50000000-0'),(SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre =  'A07'), (SELECT id FROM Tarea1.Paradero WHERE id = 16), '2015-10-19 03:55:00');

-- -----------------------------------------------------
-- Table `Tarea1`.`ParaderosEnRecorridos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tarea1`.`ParaderosEnRecorridos` (
  `Recorrido_Nombre` VARCHAR(10) NOT NULL,
  `Paradero_id` INT NOT NULL,
  `numero` INT NOT NULL,
  PRIMARY KEY (`Recorrido_Nombre`, `Paradero_id`),
  INDEX `fk_Recorrido_has_Paradero_Paradero1_idx` (`Paradero_id` ASC),
  INDEX `fk_Recorrido_has_Paradero_Recorrido1_idx` (`Recorrido_Nombre` ASC),
  CONSTRAINT `fk_Recorrido_has_Paradero_Recorrido1`
    FOREIGN KEY (`Recorrido_Nombre`)
    REFERENCES `Tarea1`.`Recorrido` (`Nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Recorrido_has_Paradero_Paradero1`
    FOREIGN KEY (`Paradero_id`)
    REFERENCES `Tarea1`.`Paradero` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
INSERT INTO `ParaderosEnRecorridos` (`Recorrido_Nombre`, `Paradero_id`, `numero`) VALUES
((SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'A06'),(SELECT id FROM Tarea1.Paradero WHERE id =  6), '1'),
((SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'A06'),(SELECT id FROM Tarea1.Paradero WHERE id =  7), '2'),
((SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'A06'), (SELECT id FROM Tarea1.Paradero WHERE id = 9), '3'),
((SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'A06'),(SELECT id FROM Tarea1.Paradero WHERE id =  10), '4'),
((SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'A06'),(SELECT id FROM Tarea1.Paradero WHERE id =  11), '5'),
((SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'A06'), (SELECT id FROM Tarea1.Paradero WHERE id = 15), '6'),
((SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'A07'),(SELECT id FROM Tarea1.Paradero WHERE id =  8), '1'),
((SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'A07'),(SELECT id FROM Tarea1.Paradero WHERE id =  11), '2'),
((SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'A07'),(SELECT id FROM Tarea1.Paradero WHERE id =  13), '3'),
((SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'A07'),(SELECT id FROM Tarea1.Paradero WHERE id =  16), '4'),
((SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'B01'),(SELECT id FROM Tarea1.Paradero WHERE id =  1), '1'),
((SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'B01'),(SELECT id FROM Tarea1.Paradero WHERE id =  3), '2'),
((SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'B01'),(SELECT id FROM Tarea1.Paradero WHERE id =  4), '3'),
((SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'B01'),(SELECT id FROM Tarea1.Paradero WHERE id =  9), '4'),
((SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'B01'),(SELECT id FROM Tarea1.Paradero WHERE id =  14), '5'),
((SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'F02'),(SELECT id FROM Tarea1.Paradero WHERE id =  2), '1'),
((SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'F02'),(SELECT id FROM Tarea1.Paradero WHERE id =  4), '2'),
((SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'F02'),(SELECT id FROM Tarea1.Paradero WHERE id =  5), '3'),
((SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'F02'),(SELECT id FROM Tarea1.Paradero WHERE id =  12), '4'),
((SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'F02'), (SELECT id FROM Tarea1.Paradero WHERE id = 16), '5');

-- -----------------------------------------------------
-- Table `Tarea1`.`Quejas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tarea1`.`Quejas` (
  `Usuario_id` INT NOT NULL,
  `ViajeUsuario_Usuario_id` INT NOT NULL,
  `ViajeUsuario_Viaje_Conductor_RUT` VARCHAR(10) NOT NULL,
  `ViajeUsuario_Viaje_Bus_Patente` VARCHAR(6) NOT NULL,
  `ViajeUsuario_Viaje_Recorrido_Nombre` VARCHAR(10) NOT NULL,
  `ViajeUsuario_Paradero_id` INT NOT NULL,
  `texto` TEXT NOT NULL,
  `tipo` INT NOT NULL,
  PRIMARY KEY (`Usuario_id`, `ViajeUsuario_Usuario_id`, `ViajeUsuario_Viaje_Conductor_RUT`, `ViajeUsuario_Viaje_Bus_Patente`, `ViajeUsuario_Viaje_Recorrido_Nombre`, `ViajeUsuario_Paradero_id`),
  INDEX `fk_Usuario_has_ViajeUsuario_ViajeUsuario1_idx` (`ViajeUsuario_Usuario_id` ASC, `ViajeUsuario_Viaje_Conductor_RUT` ASC, `ViajeUsuario_Viaje_Bus_Patente` ASC, `ViajeUsuario_Viaje_Recorrido_Nombre` ASC, `ViajeUsuario_Paradero_id` ASC),
  INDEX `fk_Usuario_has_ViajeUsuario_Usuario1_idx` (`Usuario_id` ASC),
  CONSTRAINT `fk_Usuario_has_ViajeUsuario_Usuario1`
    FOREIGN KEY (`Usuario_id`)
    REFERENCES `Tarea1`.`Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_ViajeUsuario_ViajeUsuario1`
    FOREIGN KEY (`ViajeUsuario_Usuario_id` , `ViajeUsuario_Viaje_Conductor_RUT` , `ViajeUsuario_Viaje_Bus_Patente` , `ViajeUsuario_Viaje_Recorrido_Nombre` , `ViajeUsuario_Paradero_id`)
    REFERENCES `Tarea1`.`ViajeUsuario` (`Usuario_id` , `Viaje_Conductor_RUT` , `Viaje_Bus_Patente` , `Viaje_Recorrido_Nombre` , `Paradero_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
INSERT INTO `Quejas` (`Usuario_id`, `ViajeUsuario_Viaje_Bus_Patente`, `ViajeUsuario_Viaje_Conductor_RUT`, `ViajeUsuario_Viaje_Recorrido_Nombre`, `ViajeUsuario_Usuario_id`, `ViajeUsuario_Paradero_id`, `tipo`, `texto`) VALUES
((SELECT id FROM Tarea1.Usuario WHERE id =1), (SELECT Patente from Tarea1.Bus WHERE Patente='PB1111'), (SELECT RUT from Tarea1.Conductor WHERE RUT='10000000-0'), (SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'B01'),(SELECT id FROM Tarea1.Usuario WHERE id = 1), (SELECT id FROM Tarea1.Paradero WHERE id =3), 2, 'el conductor era grosero'),
((SELECT id FROM Tarea1.Usuario WHERE id =2), (SELECT Patente from Tarea1.Bus WHERE Patente='PB2222'), (SELECT RUT from Tarea1.Conductor WHERE RUT='20000000-0'), (SELECT Nombre FROM Tarea1.Recorrido WHERE Nombre = 'B01'),(SELECT id FROM Tarea1.Usuario WHERE id = 2), (SELECT id FROM Tarea1.Paradero WHERE id =1), 3, 'el recorrido es muy largo y no pasa por mi casa');

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
