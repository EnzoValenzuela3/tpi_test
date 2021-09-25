-- -------------------------------------------
-- ESTUDIO GRAL DE TRABAJO TPI (2 REDACCION DE INSTRUCCIONES)
-- 1_REDACCION DE INGRESOS
-- SE SOLICITA REDACTAR LOS PROCEDIMIENTOS DE ALTA Y BAJA DE LAS SIGUIENTES ENTIDADES 
-- Concesionaria,Pedido,PedidoDetalle,Automovil,yAutomovilEstacion
-- ---------------------------------------------------------------------------------------------------------------------------------
-- Regimen de entidades
-- -------------------------------------------
--  `mydb`.`consecionaria`____________________concesionaria(V)
--  `Id` INT(11) NOT NULL,
--  `Nombre` VARCHAR(45) NULL DEFAULT NULL,
--  `Eliminado` BIT(1) NULL DEFAULT NULL,
--  `FechaEliminado` DATETIME NULL DEFAULT NULL,
--  PRIMARY KEY (`Id`)
-- -------------------------------------------
-- `mydb`.`pedido`____________________________pedido(V)
--  `Id` INT(11) NOT NULL,
--  `FechaDeVenta` DATETIME NULL DEFAULT NULL,
--  `FechaDeEntrega` DATETIME NULL DEFAULT NULL,
--  `Eliminado` BIT(1) NULL DEFAULT NULL,
--  `FechaEliminado` DATETIME NULL DEFAULT NULL,
--  `consecionaria_Id` INT(11) NOT NULL,
--   PRIMARY KEY (`Id`),
--   FOREIGN KEY (`consecionaria_Id`)
--   REFERENCES `mydb`.`consecionaria` (`Id`)
-- -------------------------------------------
--  `mydb`.`pedido_detalle`___________________pedido_detalle(V)
-- `Id` INT(11) NOT NULL,
-- `modelo_Id` INT(11) NOT NULL,
-- `Eliminado` BIT(1) NULL DEFAULT NULL,
-- `FechaEliminado` DATETIME NULL DEFAULT NULL,
-- `pedido_Id` INT(11) NOT NULL,
-- `modelo_Id1` INT(11) NOT NULL,
-- PRIMARY KEY (`Id`, `modelo_Id`),
-- CONSTRAINT `fk_pedido_detalle_pedido1`
-- FOREIGN KEY (`pedido_Id`)
-- REFERENCES `mydb`.`pedido` (`Id`)
-- CONSTRAINT `fk_pedido_detalle_modelo1`
-- FOREIGN KEY (`modelo_Id1`)
-- REFERENCES `mydb`.`modelo` (`Id`)
-- -----------------------------------------------------
-- `mydb`.`automovil`___________________________________automovil(V)
--  `Id` INT(11) NOT NULL,
--  `Chasis` VARCHAR(45) NULL DEFAULT NULL,
--  `FechaInicio` DATETIME NULL DEFAULT NULL,
--  `FechaFin` DATETIME NULL DEFAULT NULL,
--  `Eliminado` BIT(1) NULL DEFAULT NULL,
--  `FechaEliminado` DATETIME NULL DEFAULT NULL,
--  `pedido_detalle_Id` INT(11) NOT NULL,
--  `pedido_detalle_modelo_Id` INT(11) NOT NULL,
--  PRIMARY KEY (`Id`),
--  CONSTRAINT `fk_automovil_pedido_detalle1`
--    FOREIGN KEY (`pedido_detalle_Id` , `pedido_detalle_modelo_Id`)
--    REFERENCES `mydb`.`pedido_detalle` (`Id` , `modelo_Id`)
-- -----------------------------------------------------
-- `mydb`.`automovil_estacion`__________________________automovil_estacion
-- `FechaIngresoEstacion` DATETIME NULL DEFAULT NULL,
-- `FechaEgresoEstacion` DATETIME NULL DEFAULT NULL,
-- `Eliminado` BIT(1) NULL DEFAULT NULL,
-- `FechaEliminado` DATETIME NULL DEFAULT NULL,
-- `estacion_Id` INT(11) NOT NULL,
-- `automovil_Id` INT(11) NOT NULL,
-- CONSTRAINT `fk_automovil_estacion_estacion1`
-- FOREIGN KEY (`estacion_Id`)
-- REFERENCES `mydb`.`estacion` (`Id`)
-- CONSTRAINT `fk_automovil_estacion_automovil1`
-- FOREIGN KEY (`automovil_Id`)
-- REFERENCES `mydb`.`automovil` (`Id`)
-- -----------------------------------------------------
-- APELACION DE LA BASE DE DATOS
USE `mydb` ;
-- -----------------------------------------------------
-- ABM DE ALTA Y BAJA DE ENTIDAD "Concesionaria"
-- -----------------------------------------------------
-- drop procedure if exists alta_concesionaria;
CREATE PROCEDURE alta_concesionaria(IN`I_Id`INT,IN`I_Nombre` VARCHAR(45),`I_Eliminado` BIT(1),`I_FechaEliminado`);
 BEGIN;
INSERT INTO `mydb`.`consecionaria` VALUES(`I_Id`,`I_Nombre`,`I_Eliminado`,`I_FechaEliminado`)
 END;
-- ---
-- drop trigger if exists Baja_Comcesionaria;(trata de eliminar los registros cuyo bit eliminado da 1)
CREATE PROCEDURE baja_concesionaria(in`ID_S`int);
 BEGIN;
select * from `mydb`.`consecionaria`where `ID`=`ID_S`;-- seleccionar un registro segun id especifico
set`Eliminado`=1;-- afirmar la eliminacion
set `FechaEliminado`=now.DATETIME;
 END;
-- ---
-- -----------------------------------------------------
-- ABM DE ALTA Y BAJA DE ENTIDAD "Pedido"
-- -----------------------------------------------------
-- drop procedure if exists alta_pedido;
CREATE PROCEDURE alta_pedido(IN`I_Id`INT,IN`I_FechaDeVenta`DATETIME,IN`I_FechaDeEntrega`DATETIME,`I_Eliminado`BIT(1),`I_FechaEliminado`DATETIME,IN`I_consecionaria_Id`INT);
 BEGIN;
INSERT INTO `mydb`.`pedido` VALUES(`I_Id`,`I_FechaDeVenta`,`I_FechaDeEntrega`,`I_Eliminado`,`I_FechaEliminado`,`I_consecionaria_Id`);
 END;
-- ---
-- drop trigger if exists Baja_pedido;(trata de eliminar los registros cuyo bit eliminado da 1)
CREATE PROCEDURE baja_pedido(in`ID_S`int);
 BEGIN;
select * from `mydb`.`pedido`where `ID`=`ID_S`;-- seleccionar un registro segun id especifico
set`Eliminado`=1;-- afirmar la eliminacion
set `FechaEliminado`=now.DATETIME;
 END;
-- ---
-- -----------------------------------------------------
-- ABM DE ALTA Y BAJA DE ENTIDAD "Pedido_detalle"
-- -----------------------------------------------------
-- drop procedure if exists alta_pedido;
CREATE PROCEDURE alta_pedido_detalle(IN`I_Id`INT(11),IN`I_modelo_Id`INT(11),`I_Eliminado`BIT(1),`I_FechaEliminado`DATETIME,IN`I_pedido_Id`INT(11),IN`I_modelo_Id1`INT(11));
 BEGIN;
INSERT INTO `mydb`.`pedido_detalle` VALUES(`I_Id`,`I_modelo_Id`,`I_Eliminado`,`I_FechaEliminado`,`I_pedido_Id`,`I_modelo_Id1`);
 END;
-- ---
-- drop trigger if exists Baja_pedido_detalle;(trata de eliminar los registros cuyo bit eliminado da 1)
CREATE PROCEDURE baja_pedido_detalle(in`ID_S`int);
 BEGIN;
select * from `mydb`.`pedido_detalle`where `ID`=`ID_S`;-- seleccionar un registro segun id especifico
set`Eliminado`=1;-- afirmar la eliminacion
set `FechaEliminado`=now.DATETIME;
 END;
-- ---
-- -----------------------------------------------------
-- ABM DE ALTA Y BAJA DE ENTIDAD "Automovil"
-- -----------------------------------------------------
-- drop procedure if exists alta_automovil;
CREATE PROCEDURE alta_concesionaria(IN`I_Id`INT(11),`I_Chasis`VARCHAR(45),`I_FechaInicio` DATETIME,`I_FechaFin`DATETIME,`I_Eliminado` BIT(1),`I_FechaEliminado` DATETIME,IN`I_pedido_detalle_Id`INT(11),IN`I_pedido_detalle_modelo_Id`INT(11));
 BEGIN;
INSERT INTO `mydb`.`automovil` VALUES(`I_Id`,`I_Chasis`,`I_FechaInicio`,`I_FechaFin`,`I_Eliminado`,`I_FechaEliminado`,`I_pedido_detalle_Id`,`I_pedido_detalle_modelo_Id`);
 END;
-- ---
-- drop trigger if exists Baja_Automovil;(trata de eliminar los registros cuyo bit eliminado da 1)
CREATE PROCEDURE baja_automovil(in`ID_S`int);
 BEGIN;
select * from `mydb`.`automovil`where `ID`=`ID_S`;-- seleccionar un registro segun id especifico
set`Eliminado`=1;-- afirmar la eliminacion
set `FechaEliminado`=now.DATETIME;
 END;
-- ---
-- -----------------------------------------------------
-- ABM DE ALTA Y BAJA DE ENTIDAD "Automovil_Estacion"
-- -----------------------------------------------------
-- drop procedure if exists alta_automovil_estacion;
CREATE PROCEDURE alta_automovil_estacion (`FechaIngresoEstacion_S` DATETIME,`FechaEgresoEstacion_S` DATETIME,`Eliminado_S` BIT(1),`FechaEliminado_S` DATETIME,`estacion_Id_S` INT(11),`automovil_Id_S` INT(11));
 BEGIN;
INSERT INTO `mydb`.`automovil_estacion` VALUES(`FechaIngresoEstacion_S`,`FechaEgresoEstacion_S`,`Eliminado_S`,`FechaEliminado_S`,`estacion_Id_S`,`automovil_Id_S`);
 END;
-- ---
-- drop trigger if exists Baja_automovil_estacion;(trata de eliminar los registros cuyo bit eliminado da 1)
CREATE PROCEDURE baja_automovil_estacion(`FechaIngresoEstacion_I` DATETIME);
 BEGIN;
select * from `mydb`.`automovil_estacion` where`FechaIngresoEstacion`=`FechaIngresoEstacion_I`;-- seleccionar un registro segun id especifico
set`Eliminado`=1;-- afirmar la eliminacion
set `FechaEliminado`=now.DATETIME;
 END;
-- ---
-- -----------------------------------------------------