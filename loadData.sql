
--Insertar los datos a las tablas

--COMUNAS--
insert into comuna (id, nombre, id_region)
values
	(1,'Arica',1),
	(2,'Camarones',1),
	(3,'General Lagos',1),
	(4,'Putre',1),
	(5,'Alto Hospicio',2),
	(6,'Iquique',2),
	(7,'Camiña',2),
	(8,'Colchane',2),
	(9,'Huara',2),
	(10,'Pica',2),
	(11,'Pozo Almonte',2),
	(12,'Antofagasta',3),
	(13,'Mejillones',3),
	(14,'Sierra Gorda',3),
	(15,'Taltal',3),
	(16,'Calama',3),
	(17,'Ollague',3),
	(18,'San Pedro de Atacama',3),
	(19,'María Elena',3),
	(20,'Tocopilla',3),
	(21,'Chañaral',4),
	(22,'Diego de Almagro',4),
	(23,'Caldera',4),
	(24,'Copiapó',4),
	(25,'Tierra Amarilla',4),
	(26,'Alto del Carmen',4),
	(27,'Freirina',4),
	(28,'Huasco',4),
	(29,'Vallenar',4),
	(30,'Canela',5),
	(31,'Illapel',5),
	(32,'Los Vilos',5),
	(33,'Salamanca',5),
	(34,'Andacollo',5),
	(35,'Coquimbo',5),
	(36,'La Higuera',5),
	(37,'La Serena',5),
	(38,'Paihuaco',5),
	(39,'Vicuña',5),
	(40,'Combarbalá',5),
	(41,'Monte Patria',5),
	(42,'Ovalle',5),
	(43,'Punitaqui',5),
	(44,'Río Hurtado',5),
	(45,'Isla de Pascua',6),
	(46,'Calle Larga',6),
	(47,'Los Andes',6),
	(48,'Rinconada',6),
	(49,'San Esteban',6),
	(50,'La Ligua',6),
	(51,'Papudo',6),
	(52,'Petorca',6),
	(53,'Zapallar',6),
	(54,'Hijuelas',6),
	(55,'La Calera',6),
	(56,'La Cruz',6),
	(57,'Limache',6),
	(58,'Nogales',6),
	(59,'Olmué',6),
	(60,'Quillota',6),
	(61,'Algarrobo',6),
	(62,'Cartagena',6),
	(63,'El Quisco',6),
	(64,'El Tabo',6),
	(65,'San Antonio',6),
	(66,'Santo Domingo',6),
	(67,'Catemu',6),
	(68,'Llaillay',6),
	(69,'Panquehue',6),
	(70,'Putaendo',6),
	(71,'San Felipe',6),
	(72,'Santa María',6),
	(73,'Casablanca',6),
	(74,'Concón',6),
	(75,'Juan Fernández',6),
	(76,'Puchuncaví',6),
	(77,'Quilpué',6),
	(78,'Quintero',6),
	(79,'Valparaíso',6),
	(80,'Villa Alemana',6),
	(81,'Viña del Mar',6),
	(82,'Colina',7),
	(83,'Lampa',7),
	(84,'Tiltil',7),
	(85,'Pirque',7),
	(86,'Puente Alto',7),
	(87,'San José de Maipo',7),
	(88,'Buin',7),
	(89,'Calera de Tango',7),
	(90,'Paine',7),
	(91,'San Bernardo',7),
	(92,'Alhué',7),
	(93,'Curacaví',7),
	(94,'María Pinto',7),
	(95,'Melipilla',7),
	(96,'San Pedro',7),
	(97,'Cerrillos',7),
	(98,'Cerro Navia',7),
	(99,'Conchalí',7),
	(100,'El Bosque',7),
	(101,'Estación Central',7),
	(102,'Huechuraba',7),
	(103,'Independencia',7),
	(104,'La Cisterna',7),
	(105,'La Granja',7),
	(106,'La Florida',7),
	(107,'La Pintana',7),
	(108,'La Reina',7),
	(109,'Las Condes',7),
	(110,'Lo Barnechea',7),
	(111,'Lo Espejo',7),
	(112,'Lo Prado',7),
	(113,'Macul',7),
	(114,'Maipú',7),
	(115,'Ñuñoa',7),
	(116,'Pedro Aguirre Cerda',7),
	(117,'Peñalolén',7),
	(118,'Providencia',7),
	(119,'Pudahuel',7),
	(120,'Quilicura',7),
	(121,'Quinta Normal',7),
	(122,'Recoleta',7),
	(123,'Renca',7),
	(124,'San Miguel',7),
	(125,'San Joaquín',7),
	(126,'San Ramón',7),
	(127,'Santiago',7),
	(128,'Vitacura',7),
	(129,'El Monte',7),
	(130,'Isla de Maipo',7),
	(131,'Padre Hurtado',7),
	(132,'Peñaflor',7),
	(133,'Talagante',7),
	(134,'Codegua',8),
	(135,'Coínco',8),
	(136,'Coltauco',8),
	(137,'Doñihue',8),
	(138,'Graneros',8),
	(139,'Las Cabras',8),
	(140,'Machalí',8),
	(141,'Malloa',8),
	(142,'Mostazal',8),
	(143,'Olivar',8),
	(144,'Peumo',8),
	(145,'Pichidegua',8),
	(146,'Quinta de Tilcoco',8),
	(147,'Rancagua',8),
	(148,'Rengo',8),
	(149,'Requínoa',8),
	(150,'San Vicente de Tagua Tagua',8),
	(151,'La Estrella',8),
	(152,'Litueche',8),
	(153,'Marchihue',8),
	(154,'Navidad',8),
	(155,'Peredones',8),
	(156,'Pichilemu',8),
	(157,'Chépica',8),
	(158,'Chimbarongo',8),
	(159,'Lolol',8),
	(160,'Nancagua',8),
	(161,'Palmilla',8),
	(162,'Peralillo',8),
	(163,'Placilla',8),
	(164,'Pumanque',8),
	(165,'San Fernando',8),
	(166,'Santa Cruz',8),
	(167,'Cauquenes',9),
	(168,'Chanco',9),
	(169,'Pelluhue',9),
	(170,'Curicó',9),
	(171,'Hualañé',9),
	(172,'Licantén',9),
	(173,'Molina',9),
	(174,'Rauco',9),
	(175,'Romeral',9),
	(176,'Sagrada Familia',9),
	(177,'Teno',9),
	(178,'Vichuquén',9),
	(179,'Colbún',9),
	(180,'Linares',9),
	(181,'Longaví',9),
	(182,'Parral',9),
	(183,'Retiro',9),
	(184,'San Javier',9),
	(185,'Villa Alegre',9),
	(186,'Yerbas Buenas',9),
	(187,'Constitución',9),
	(188,'Curepto',9),
	(189,'Empedrado',9),
	(190,'Maule',9),
	(191,'Pelarco',9),
	(192,'Pencahue',9),
	(193,'Río Claro',9),
	(194,'San Clemente',9),
	(195,'San Rafael',9),
	(196,'Talca',9),
	(197,'Bulnes',10),
	(198,'Chillán',10),
	(199,'Chillán Viejo',10),
	(200,'Cobquecura',10),
	(201,'Coelemu',10),
	(202,'Coihueco',10),
	(203,'El Carmen',10),
	(204,'Ninhue',10),
	(205,'Ñiquen',10),
	(206,'Pemuco',10),
	(207,'Pinto',10),
	(208,'Portezuelo',10),
	(209,'Quirihue',10),
	(210,'Ránquil',10),
	(211,'Treguaco',10),
	(212,'Quillón',10),
	(213,'San Carlos',10),
	(214,'San Fabián',10),
	(215,'San Ignacio',10),
	(216,'San Nicolás',10),
	(217,'Yungay',10),
	(218,'Arauco',11),
	(219,'Cañete',11),
	(220,'Contulmo',11),
	(221,'Curanilahue',11),
	(222,'Lebu',11),
	(223,'Los Álamos',11),
	(224,'Tirúa',11),
	(225,'Alto Biobío',11),
	(226,'Antuco',11),
	(227,'Cabrero',11),
	(228,'Laja',11),
	(229,'Los Ángeles',11),
	(230,'Mulchén',11),
	(231,'Nacimiento',11),
	(232,'Negrete',11),
	(233,'Quilaco',11),
	(234,'Quilleco',11),
	(235,'San Rosendo',11),
	(236,'Santa Bárbara',11),
	(237,'Tucapel',11),
	(238,'Yumbel',11),
	(239,'Chiguayante',11),
	(240,'Concepción',11),
	(241,'Coronel',11),
	(242,'Florida',11),
	(243,'Hualpén',11),
	(244,'Hualqui',11),
	(245,'Lota',11),
	(246,'Penco',11),
	(247,'San Pedro de La Paz',11),
	(248,'Santa Juana',11),
	(249,'Talcahuano',11),
	(250,'Tomé',11),
	(251,'Carahue',12),
	(252,'Cholchol',12),
	(253,'Cunco',12),
	(254,'Curarrehue',12),
	(255,'Freire',12),
	(256,'Galvarino',12),
	(257,'Gorbea',12),
	(258,'Lautaro',12),
	(259,'Loncoche',12),
	(260,'Melipeuco',12),
	(261,'Nueva Imperial',12),
	(262,'Padre Las Casas',12),
	(263,'Perquenco',12),
	(264,'Pitrufquén',12),
	(265,'Pucón',12),
	(266,'Saavedra',12),
	(267,'Temuco',12),
	(268,'Teodoro Schmidt',12),
	(269,'Toltén',12),
	(270,'Vilcún',12),
	(271,'Villarrica',12),
	(272,'Angol',12),
	(273,'Collipulli',12),
	(274,'Curacautín',12),
	(275,'Ercilla',12),
	(276,'Lonquimay',12),
	(277,'Los Sauces',12),
	(278,'Lumaco',12),
	(279,'Purén',12),
	(280,'Renaico',12),
	(281,'Traiguén',12),
	(282,'Victoria',12),
	(283,'Corral',13),
	(284,'Lanco',13),
	(285,'Los Lagos',13),
	(286,'Máfil',13),
	(287,'Mariquina',13),
	(288,'Paillaco',13),
	(289,'Panguipulli',13),
	(290,'Valdivia',13),
	(291,'Futrono',13),
	(292,'La Unión',13),
	(293,'Lago Ranco',13),
	(294,'Río Bueno',13),
	(295,'Ancud',14),
	(296,'Castro',14),
	(297,'Chonchi',14),
	(298,'Curaco de Vélez',14),
	(299,'Dalcahue',14),
	(300,'Puqueldón',14),
	(301,'Queilén',14),
	(302,'Quemchi',14),
	(303,'Quellón',14),
	(304,'Quinchao',14),
	(305,'Calbuco',14),
	(306,'Cochamó',14),
	(307,'Fresia',14),
	(308,'Frutillar',14),
	(309,'Llanquihue',14),
	(310,'Los Muermos',14),
	(311,'Maullín',14),
	(312,'Puerto Montt',14),
	(313,'Puerto Varas',14),
	(314,'Osorno',14),
	(315,'Puero Octay',14),
	(316,'Purranque',14),
	(317,'Puyehue',14),
	(318,'Río Negro',14),
	(319,'San Juan de la Costa',14),
	(320,'San Pablo',14),
	(321,'Chaitén',14),
	(322,'Futaleufú',14),
	(323,'Hualaihué',14),
	(324,'Palena',14),
	(325,'Aisén',15),
	(326,'Cisnes',15),
	(327,'Guaitecas',15),
	(328,'Cochrane',15),
	(329,'O higgins',15),
	(330,'Tortel',15),
	(331,'Coihaique',15),
	(332,'Lago Verde',15),
	(333,'Chile Chico',15),
	(334,'Río Ibáñez',15),
	(335,'Antártica',16),
	(336,'Cabo de Hornos',16),
	(337,'Laguna Blanca',16),
	(338,'Punta Arenas',16),
	(339,'Río Verde',16),
	(340,'San Gregorio',16),
	(341,'Porvenir',16),
	(342,'Primavera',16),
	(343,'Timaukel',16),
	(344,'Natales',16),
	(345,'Torres del Paine',16),
	(346,'Cabildo',6);

--Tabla de Modelo--
insert into  modelo (id, nombre, marca, tipo) values (1, '2G4GZ5GVXB9053795', 'Mazda', 'MX-5');
insert into  modelo (id, nombre, marca, tipo) values (2, '5GAKRDED8CJ619141', 'Hyundai', 'Santa Fe');
insert into  modelo (id, nombre, marca, tipo) values (3, 'JTDKDTB39E1054887', 'Chevrolet', 'Suburban 2500');
insert into  modelo (id, nombre, marca, tipo) values (4, 'WAUTFAFH7BN696647', 'GMC', 'Savana 2500');
insert into  modelo (id, nombre, marca, tipo) values (5, 'WAUKF98E57A292824', 'Kia', 'Sportage');
insert into  modelo (id, nombre, marca, tipo) values (6, 'WAUBFAFL3CN951361', 'Ford', 'Windstar');
insert into  modelo (id, nombre, marca, tipo) values (7, '3N1CN7AP4EK205035', 'Acura', 'TL');
insert into  modelo (id, nombre, marca, tipo) values (8, 'SALVP1BG6FH867018', 'Dodge', 'Durango');
insert into  modelo (id, nombre, marca, tipo) values (9, 'SCFEBBBC3AG144980', 'Chevrolet', 'SSR');
insert into  modelo (id, nombre, marca, tipo) values (10, '2G4GW5EV2B9610906', 'Dodge', 'Ram 1500');

--Tabla de pago--
insert into pago (id, monto, fecha_pago) values (1, 87238, '2019-11-02');
insert into pago (id, monto, fecha_pago) values (2, 80322, '2020-06-03');
insert into pago (id, monto, fecha_pago) values (3, 93968, '2019-07-12');
insert into pago (id, monto, fecha_pago) values (4, 64983, '2020-11-28');
insert into pago (id, monto, fecha_pago) values (5, 96440, '2020-12-16');
insert into pago (id, monto, fecha_pago) values (6, 95118, '2021-02-09');
insert into pago (id, monto, fecha_pago) values (7, 68610, '2020-08-28');
insert into pago (id, monto, fecha_pago) values (8, 84613, '2021-02-19');
insert into pago (id, monto, fecha_pago) values (9, 95024, '2020-10-17');
insert into pago (id, monto, fecha_pago) values (10, 84505, '2019-08-13');

--Tabla de Sueldo--
insert into sueldo (id, monto) values (1, 4276227);
insert into sueldo (id, monto) values (2, 1536209);
insert into sueldo (id, monto) values (3, 3481348);
insert into sueldo (id, monto) values (4, 327240);
insert into sueldo (id, monto) values (5, 3846353);
insert into sueldo (id, monto) values (6, 2063611);
insert into sueldo (id, monto) values (7, 1303823);
insert into sueldo (id, monto) values (8, 757268);
insert into sueldo (id, monto) values (9, 3759168);
insert into sueldo (id, monto) values (10, 3944749);

--Tabla de Cliente--
insert into cliente (id, first_name, last_name, gender, fecha_de_nacimiento) values (1, 'Derrek', 'Flaunier', 'Female', '1972-10-02');
insert into cliente (id, first_name, last_name, gender, fecha_de_nacimiento) values (2, 'Stewart', 'Heeron', 'Female', '1971-12-16');
insert into cliente (id, first_name, last_name, gender, fecha_de_nacimiento) values (3, 'Cynde', 'O''Roan', 'Bigender', '1978-06-24');
insert into cliente (id, first_name, last_name, gender, fecha_de_nacimiento) values (4, 'Guenevere', 'Phillput', 'Polygender', '1965-01-24');
insert into cliente (id, first_name, last_name, gender, fecha_de_nacimiento) values (5, 'Emmey', 'Bodocs', 'Genderfluid', '1955-06-06');
insert into cliente (id, first_name, last_name, gender, fecha_de_nacimiento) values (6, 'Ardene', 'Haythorn', 'Non-binary', '1968-03-29');
insert into cliente (id, first_name, last_name, gender, fecha_de_nacimiento) values (7, 'Nealson', 'Jephson', 'Genderqueer', '1983-08-03');
insert into cliente (id, first_name, last_name, gender, fecha_de_nacimiento) values (8, 'Aviva', 'Sesons', 'Genderqueer', '1963-04-28');
insert into cliente (id, first_name, last_name, gender, fecha_de_nacimiento) values (9, 'Berrie', 'D''eath', 'Female', '1994-11-12');
insert into cliente (id, first_name, last_name, gender, fecha_de_nacimiento) values (10, 'Karl', 'Beggan', 'Non-binary', '1944-01-08');


--Tabla de Vehiculo--
insert into vehiculo (id, patente, fecha_fabricacion) values (1, 'UP-LN-AP', '2020-11-21');
insert into vehiculo (id, patente, fecha_fabricacion) values (2, 'Z6-JP-6J', '2020-07-31');
insert into vehiculo (id, patente, fecha_fabricacion) values (3, 'HL-WH-V1', '2021-03-08');
insert into vehiculo (id, patente, fecha_fabricacion) values (4, '7A-JP-P6', '2020-10-23');
insert into vehiculo (id, patente, fecha_fabricacion) values (5, 'H4-B3-2J', '2019-10-21');
insert into vehiculo (id, patente, fecha_fabricacion) values (6, 'Q5-JZ-G6', '2020-08-19');
insert into vehiculo (id, patente, fecha_fabricacion) values (7, 'L0-PO-L3', '2019-07-28');
insert into vehiculo (id, patente, fecha_fabricacion) values (8, 'NR-KE-R2', '2019-10-24');
insert into vehiculo (id, patente, fecha_fabricacion) values (9, '3O-7I-0G', '2019-11-26');
insert into vehiculo (id, patente, fecha_fabricacion) values (10, 'YX-94-PT', '2020-05-06');

--Tabla de Cliente_Vehiculo--






--Tabla de Lugar --
/*falta la foranea!!!!!

insert into lugar (id, piso, numero) values (1, 0, 1);
insert into lugar (id, piso, numero) values (2, 5, 2);
insert into lugar (id, piso, numero) values (3, 2, 3);
insert into lugar (id, piso, numero) values (4, 9, 4);
insert into lugar (id, piso, numero) values (5, 1, 5);
insert into lugar (id, piso, numero) values (6, 4, 6);
insert into lugar (id, piso, numero) values (7, 10, 7);
insert into lugar (id, piso, numero) values (8, 7, 8);
insert into lugar (id, piso, numero) values (9, 5, 9);
insert into lugar (id, piso, numero) values (10, 2, 10);

*/


--Tabla de lugar_cliente_vehiculo--



--Tabla de Empleado--
/*
insert into empleado (rut, first_name, last_name, tipo) values ('12.994.020-8', 'Nert', 'Trafford', 'Guardia');
insert into empleado (rut, first_name, last_name, tipo) values ('14.723.649-8', 'Matty', 'Scrimgeour', 'Guardia');
insert into empleado (rut, first_name, last_name, tipo) values ('17.015.625-7', 'Harriot', 'Gunby', 'Portero');
insert into empleado (rut, first_name, last_name, tipo) values ('10.629.591-K', 'Jermain', 'Flather', 'Portero');
insert into empleado (rut, first_name, last_name, tipo) values ('15.281.374-3', 'Emmery', 'Izatson', 'Guardia');
insert into empleado (rut, first_name, last_name, tipo) values ('12.348.185-1', 'Darrin', 'Folland', 'Cajero');
insert into empleado (rut, first_name, last_name, tipo) values ('12.287.931-1', 'Blake', 'Askell', 'Guardia');
insert into empleado (rut, first_name, last_name, tipo) values ('15.791.787-4', 'Lutero', 'Raulston', 'Guardia');
insert into empleado (rut, first_name, last_name, tipo) values ('17.241.324-2', 'Shantee', 'Brandreth', 'Conserje');
insert into empleado (rut, first_name, last_name, tipo) values ('12.705.287-3', 'Alphard', 'Seiler', 'Guardia');
*/







