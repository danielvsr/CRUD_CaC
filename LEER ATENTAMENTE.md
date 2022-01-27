# CRUD_CaC
BASE DE DATOS UTILIZADA:
MySQL WORKBENCH 8.0

//CREACIÓN DE BASE DE DATOS:

CREATE DATABASE homebanking;

//CREACIÓN DE TABLAS:

CREATE TABLE `users` (
  `id` int unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(8) NOT NULL,
  `name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,  
  `email` varchar(45) NOT NULL,
  `gender` varchar(10) NOT NULL,
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`)
);

CREATE TABLE accounts (
id INT unsigned PRIMARY KEY AUTO_INCREMENT,
account_number INT unsigned,
type VARCHAR(40) NOT NULL,
currency VARCHAR(3) NOT NULL,
balance DOUBLE NOT NULL,
user_id INT NOT NULL
);

//INSERTAR EL PRIMER REGISTRO DE LA TABLA `users`:

INSERT INTO `users` VALUES ('admin','admin123','Daniel','Cardenas','admin@gmail.com','Male');

//CREAR RELACIÓN ENTRE LAS TABLAS - EN ESTE CASO EXISTÍA LA RELACIÓN POR LO QUE ME PIDE ELIMINARLA PRIMERO PARA CREARLA:

ALTER TABLE `homebanking`.`accounts` 
DROP FOREIGN KEY `FK_user`;
ALTER TABLE `homebanking`.`accounts` 
ADD CONSTRAINT `FK_user`
  FOREIGN KEY (`user_id`)
  REFERENCES `homebanking`.`users` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
