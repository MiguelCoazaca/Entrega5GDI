CREATE DATABASE GuiaRemisionMarvisur1;

USE GuiaRemisionMarvisur1;

-- Tabla Destinatario
CREATE TABLE Destinatario(
  codigo_dest CHAR(11) NOT NULL,
  nombre_dest VARCHAR(30) NOT NULL,
  telf_dest CHAR(9) NOT NULL, 
  PRIMARY KEY (codigo_dest)
)ENGINE = InnoDB;

-- Tabla Tipo_Destinatario
CREATE TABLE Tipo_Destinatario(
  codigo_dest CHAR(11) NOT NULL,
  tipo_dest CHAR(3) NOT NULL,
  PRIMARY KEY (codigo_dest),
  FOREIGN KEY (codigo_dest) REFERENCES Destinatario(codigo_dest)
)ENGINE = InnoDB;

-- Tabla Remitente
CREATE TABLE Remitente(
  codigo_rem CHAR(11) NOT NULL,
  nombre_rem VARCHAR(30) NOT NULL,
  telf_rem CHAR(9) NOT NULL,
  PRIMARY KEY (codigo_rem)
)ENGINE = InnoDB;

-- Tabla Tipo_Remitente 
CREATE TABLE Tipo_Remitente(
  codigo_rem CHAR(11) NOT NULL,
  tipo_rem CHAR(3) NOT NULL,
  PRIMARY KEY (codigo_rem),
  FOREIGN KEY (codigo_rem) REFERENCES Remitente(codigo_rem)
)ENGINE = InnoDB;

-- Tabla Vehiculo --
CREATE TABLE Vehiculo(
  placa VARCHAR(7) NOT NULL,
  certificado CHAR(8) NOT NULL,
  conf_vehicular CHAR(3) NOT NULL,
  marca VARCHAR(20) NOT NULL,
  PRIMARY KEY (Placa)
)ENGINE = InnoDB;

-- Tabla Conductor --
CREATE TABLE Conductor(
  licencia CHAR(9) NOT NULL,
  DNI CHAR(8) NOT NULL,
  nombre_cond VARCHAR(30) NOT NULL,
  PRIMARY KEY (licencia)
)ENGINE = InnoDB;

-- Tabla Ruta --
CREATE TABLE Ruta(
  codigo_ruta INT NOT NULL AUTO_INCREMENT,
  fecha_salida DATE NOT NULL,
  nombre_ruta VARCHAR(25) NOT NULL,
  hora_salida CHAR(5) NOT NULL,
  licencia CHAR(9) NOT NULL,
  placa VARCHAR(7) NOT NULL,
  PRIMARY KEY (codigo_ruta),
  FOREIGN KEY (placa) REFERENCES Vehiculo(placa),
  FOREIGN KEY (licencia) REFERENCES Conductor(licencia)
)ENGINE = InnoDB;

-- Tabla Encomienda
CREATE TABLE Encomienda(
  codigo_enc INT NOT NULL AUTO_INCREMENT,
  descripcion VARCHAR(45) NOT NULL,
  cantidad INT NOT NULL,
  unidad_medida CHAR(15) NOT NULL,
  peso FLOAT NOT NULL,
  unidad_peso CHAR(15) NOT NULL,
  codigo_dest CHAR(11) NOT NULL,
  codigo_rem CHAR(11) NOT NULL,
  codigo_ruta INT NOT NULL,
  PRIMARY KEY (codigo_enc),
  FOREIGN KEY (codigo_dest) REFERENCES Destinatario(codigo_dest),
  FOREIGN KEY (codigo_rem) REFERENCES Remitente(codigo_rem),
  FOREIGN KEY (codigo_ruta) REFERENCES Ruta(codigo_ruta)
)ENGINE = InnoDB;

-- Tabla Tipo_Flete
CREATE TABLE Tipo_Flete(
  codigo_flete INT NOT NULL AUTO_INCREMENT,
  Tipo_flete VARCHAR(10) NOT NULL,
  PRIMARY KEY (codigo_flete)
)ENGINE = InnoDB;

-- Tabla Guia_de_remision
CREATE TABLE Guia_de_remision(
  nro_guia_remision INT NOT NULL AUTO_INCREMENT,
  placa VARCHAR(7) NOT NULL,
  licencia CHAR(9) NOT NULL,
  codigo_rem CHAR(11) NOT NULL,
  codigo_dest CHAR(11) NOT NULL,
  codigo_enc INT NOT NULL,
  codigo_ruta INT NOT NULL,
  codigo_flete INT NOT NULL,
  departamento_salida CHAR(15) NOT NULL,
  provincia_salida CHAR(15) NOT NULL,
  distrito_salida CHAR(15) NOT NULL,
  domicilio_salida CHAR(20) NOT NULL,
  departamento_llegada CHAR(15) NOT NULL,
  provincia_llegada CHAR(15) NOT NULL,
  distrito_llegada CHAR(15) NOT NULL,
  domicilio_llegada CHAR(20) NOT NULL,
  valor_flete FLOAT NOT NULL,
  PRIMARY KEY (nro_guia_remision),

  FOREIGN KEY (licencia) REFERENCES Conductor(licencia),
  FOREIGN KEY (codigo_rem) REFERENCES Remitente(codigo_rem),
  FOREIGN KEY (codigo_dest) REFERENCES Destinatario(codigo_dest),
  FOREIGN KEY (codigo_enc) REFERENCES Encomienda(codigo_enc),
  FOREIGN KEY (codigo_ruta) REFERENCES Ruta(codigo_ruta),
  FOREIGN KEY (codigo_flete) REFERENCES Tipo_Flete(codigo_flete)
)ENGINE = InnoDB;


CREATE TABLE acciones (
  id INT NOT NULL AUTO_INCREMENT,
  accion VARCHAR(45) NULL,
  fecha DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id));

-- Tabla Cuerpo_Guia_Remision
CREATE TABLE Cuerpo_Guia_Remision(
  codigo_enc INT NOT NULL,
  nro_guia_remision INT NOT NULL,
  PRIMARY KEY (codigo_enc, nro_guia_remision),
  FOREIGN KEY (codigo_enc) REFERENCES Encomienda(codigo_enc),
  FOREIGN KEY (nro_guia_remision) REFERENCES Guia_de_remision(nro_guia_remision)
)ENGINE = InnoDB;

-- Índices
CREATE INDEX Ruta_nombre ON Ruta(nombre_ruta);
CREATE INDEX Ruta_fecha_salida ON Ruta(fecha_salida);
CREATE INDEX Ruta_hora_salida ON Ruta(hora_salida);
CREATE INDEX Remitente_nombre ON Remitente(nombre_rem);
CREATE INDEX Conductor_nombre ON Conductor(nombre_cond);




-- Insercion de DATOS

/*DANIELA*/
INSERT INTO Destinatario VALUES ('73379238', 'Mauricio Cardenas Vallejo', '958794511'); 
INSERT INTO Destinatario VALUES ('73337932', 'Jair Ronny Bravo Turriaga', '998313806'); 
INSERT INTO Destinatario VALUES ('54649398', 'Rodmi Franco Paredes', '922633215'); 
INSERT INTO Destinatario VALUES ('54454124', 'Luis Villanueva Zeballos', '987939994');  
INSERT INTO Destinatario VALUES ('73547592', 'Jhonny Perez Zavaleta', '923496213'); 
INSERT INTO Destinatario VALUES ('92746427', 'Corina Malpartida Lucar', '980801547');
INSERT INTO Destinatario VALUES ('73563893', 'Melissa Fernandez Paye', '960868444');
INSERT INTO Destinatario VALUES ('93764923', 'Maricielo Paye Lizarve', '935674359');
INSERT INTO Destinatario VALUES ('82736747', 'Johan Pades Delgado', '910700387');
INSERT INTO Destinatario VALUES ('03937848', 'Sophia Aguilar Bautista', '993600684');
INSERT INTO Destinatario VALUES ('20552103816', 'Agrolight Peru S.A.C', '923347900');
INSERT INTO Destinatario VALUES ('20538856674', 'Promhil S.A.C', '987128915');
INSERT INTO Destinatario VALUES ('10238759495', 'Alkofarma E.I.RL', '988402147');
INSERT INTO Destinatario VALUES ('17273894395', 'Alabama S.A', '959882226');
INSERT INTO Destinatario VALUES ('19277697959', 'Contix S.A.', '976911256');
INSERT INTO Destinatario VALUES ('25636488467', 'Inversiones Kayser S.A.C.', '986255083');
INSERT INTO Destinatario VALUES ('17278473299', 'Corporacion Energy Pro S.A.C', '993600684'); 
INSERT INTO Destinatario VALUES ('26133748748', 'Axelmoda E.I.RL', '910700387');
INSERT INTO Destinatario VALUES ('17252944237', 'Chesma S.A.C.', '947286643');
INSERT INTO Destinatario VALUES ('10293837482', 'Muscle Squad S.A.C.', '972147477');
/*MIGUEL*/
INSERT INTO Destinatario VALUES ('74239847', 'Juan Alberto Perez Perez', '973456123');
INSERT INTO Destinatario VALUES ('45239801', 'Marian Lucia Tejada Luna', '934123123');
INSERT INTO Destinatario VALUES ('29304101', 'Raul Alejandro Mendoza Lopez', '912345654');
INSERT INTO Destinatario VALUES ('47301294', 'Jose Antonio Salas Salas', '902123456');
INSERT INTO Destinatario VALUES ('72430129', 'Juan Jose Chavez Chavez', '923434458');
INSERT INTO Destinatario VALUES ('45329405', 'Angel Gabriel Montesinos Luz', '982012332');
INSERT INTO Destinatario VALUES ('45095386', 'Guillermo Andres Quispe Kai', '912535091');
INSERT INTO Destinatario VALUES ('63201928', 'Mario Pedro Lopez Zapana', '980877432');
INSERT INTO Destinatario VALUES ('47102943', 'Raul Jose Alvarez Fernandez', '967342458');
INSERT INTO Destinatario VALUES ('28102913', 'Rodrigo Josue Amezquita Perez', '987432567');
INSERT INTO Destinatario VALUES ('20552103819', 'Andres Javier Savedra Caceres', '987432567');
INSERT INTO Destinatario VALUES ('20201385874', 'Ramiro Paolo Suarez Perez', '967342423');
INSERT INTO Destinatario VALUES ('20212657845', 'Gian Franco Perez Lapiz', '965234703');
INSERT INTO Destinatario VALUES ('20207654876', 'Rodrigo Raul Mamani Mamani','912543657');
INSERT INTO Destinatario VALUES ('20207456789', 'Alberto Cespedes Mamani', '973452678');
INSERT INTO Destinatario VALUES ('20607456784', 'Nicolas Raul Perez Galdos', '923453678');
INSERT INTO Destinatario VALUES ('20503567891', 'Randy Casemiro Suarez Ramirez', '971567345');
INSERT INTO Destinatario VALUES ('20301234562', 'Andy Ramiro Polanco Fernandez', '912323098');
INSERT INTO Destinatario VALUES ('20588856674', 'Cristiano Ronaldo Aveiro Chang', '980123450');
INSERT INTO Destinatario VALUES ('20334176843', 'Sebastian Raul Chavez Huaman', '912333123');
/*FIN DESTINATARIO*/


/*DANIELA*/
INSERT INTO Tipo_Destinatario VALUES ('73379238', 'DNI'); 
INSERT INTO Tipo_Destinatario VALUES ('73337932', 'DNI');
INSERT INTO Tipo_Destinatario VALUES ('54649398', 'DNI');
INSERT INTO Tipo_Destinatario VALUES ('54454124', 'DNI');
INSERT INTO Tipo_Destinatario VALUES ('73547592', 'DNI');
INSERT INTO Tipo_Destinatario VALUES ('92746427', 'DNI');
INSERT INTO Tipo_Destinatario VALUES ('73563893', 'DNI');
INSERT INTO Tipo_Destinatario VALUES ('93764923', 'DNI');
INSERT INTO Tipo_Destinatario VALUES ('82736747', 'DNI');
INSERT INTO Tipo_Destinatario VALUES ('03937848', 'DNI');
INSERT INTO Tipo_Destinatario VALUES ('20552103816', 'RUC');
INSERT INTO Tipo_Destinatario VALUES ('20538856674', 'RUC');
INSERT INTO Tipo_Destinatario VALUES ('10238759495', 'RUC');
INSERT INTO Tipo_Destinatario VALUES ('17273894395', 'RUC');
INSERT INTO Tipo_Destinatario VALUES ('19277697959', 'RUC');
INSERT INTO Tipo_Destinatario VALUES ('25636488467', 'RUC');
INSERT INTO Tipo_Destinatario VALUES ('17278473299', 'RUC');
INSERT INTO Tipo_Destinatario VALUES ('26133748748', 'RUC');
INSERT INTO Tipo_Destinatario VALUES ('17252944237', 'RUC');
INSERT INTO Tipo_Destinatario VALUES ('10293837482', 'RUC');
/*MIGUEL*/
INSERT INTO Tipo_Destinatario VALUES ('74239847', 'DNI');
INSERT INTO Tipo_Destinatario VALUES ('45239801 ', 'DNI ');
INSERT INTO Tipo_Destinatario VALUES ('29304101', 'DNI');
INSERT INTO Tipo_Destinatario VALUES ('47301294', 'DNI');
INSERT INTO Tipo_Destinatario VALUES ('72430129', 'DNI');
INSERT INTO Tipo_Destinatario VALUES ('45329405', 'DNI');
INSERT INTO Tipo_Destinatario VALUES ('45095386', 'DNI');
INSERT INTO Tipo_Destinatario VALUES ('63201928', 'DNI');
INSERT INTO Tipo_Destinatario VALUES ('47102943', 'DNI');
INSERT INTO Tipo_Destinatario VALUES ('28102913', 'DNI');
INSERT INTO Tipo_Destinatario VALUES ('20552103819', 'RUC');
INSERT INTO Tipo_Destinatario VALUES ('20201385874', 'RUC');
INSERT INTO Tipo_Destinatario VALUES ('20212657845', 'RUC');
INSERT INTO Tipo_Destinatario VALUES ('20207654876', 'RUC');
INSERT INTO Tipo_Destinatario VALUES ('20207456789', 'RUC');
INSERT INTO Tipo_Destinatario VALUES ('20607456784', 'RUC');
INSERT INTO Tipo_Destinatario VALUES ('20503567891', 'RUC');
INSERT INTO Tipo_Destinatario VALUES ('20301234562', 'RUC');
INSERT INTO Tipo_Destinatario VALUES ('20588856674', 'RUC');
INSERT INTO Tipo_Destinatario VALUES ('20334176843', 'RUC');
/*fIN TIPO_DEST*/

/*DANIELA*/
INSERT INTO Remitente VALUES ('80567062', 'Melchor Mayhua Vallejo', '951254316');
INSERT INTO Remitente VALUES ('45023150', 'Christian Segales Zegarra', '950361045'); 
INSERT INTO Remitente VALUES ('73682010', 'Mauricio Subileta Taco', '972786385');
INSERT INTO Remitente VALUES ('43191633', 'Juan Tacca Barragan', '964350999');
INSERT INTO Remitente VALUES ('40514277', 'Moises Vargas Paniura', '925238512');
INSERT INTO Remitente VALUES ('10665585', 'Teo Vargas Valdivia', '943781677');
INSERT INTO Remitente VALUES ('77014633', 'Maria Velarde Angulo', '956683338');
INSERT INTO Remitente VALUES ('40059190', 'Elvis Villalta Mayta', '981078419');
INSERT INTO Remitente VALUES ('41228995', 'Dudmar Zavaleta Ortecho', '950055267');
INSERT INTO Remitente VALUES ('46900603', 'Jorge Aguilar Mamani', '955663364');
INSERT INTO Remitente VALUES ('92746427', 'Corina Malpartida Lucar', '980801547');
INSERT INTO Remitente VALUES ('73563893', 'Melissa Fernandez Paye', '960868444');
INSERT INTO Remitente VALUES ('93764923', 'Maricielo Paye Lizarve', '935674359');
INSERT INTO Remitente VALUES ('82736747', 'Johan Pades Delgado', '910700387');
INSERT INTO Remitente VALUES ('03937848', 'Sophia Aguilar Bautista', '993600684');
INSERT INTO Remitente VALUES ('20552103816', 'Agrolight Peru S.A.C', '923347900');
INSERT INTO Remitente VALUES ('20538856674', 'Promhil S.A.C', '987128915');
INSERT INTO Remitente VALUES ('10238759495', 'Alkofarma E.I.RL', '988402147');   
INSERT INTO Remitente VALUES ('17273894395', 'Alabama S.A', '959882226');
INSERT INTO Remitente VALUES ('19277697959', 'Contix S.A.', '976911256');
/*Rodrigo*/
INSERT INTO Remitente VALUES ('20502307836', 'Andres Javi Salms Caceres', '987567232');
INSERT INTO Remitente VALUES ('20201385874', 'Raymi Paris Perez Suarez', '967241312');
INSERT INTO Remitente VALUES ('20212657845', 'Gianina Francesca Perez Layaza','965234703');
INSERT INTO Remitente VALUES ('20227452676', 'Rodrigo Ramirez Marma Malaga', '901543457');
INSERT INTO Remitente VALUES ('20217322919', 'Ali Linares Aliaga Mamani', '972231688');
INSERT INTO Remitente VALUES ('21104326564', 'Nicola Ramirez Perez Galindo','923362189');
INSERT INTO Remitente VALUES ('20441239201', 'Ramiro Casimiro Ezz Martinez', '925423567');
INSERT INTO Remitente VALUES ('21345678022', 'Adriana Lima Linares Polanco', '902122790');
INSERT INTO Remitente VALUES ('21355357674', 'Cristiano Rony Human Fernandez', '980123451');
INSERT INTO Remitente VALUES ('20334276743', 'Sebastiani Lui Chavez Huamani','912215421');
/*Sergio*/
INSERT INTO Remitente VALUES ('73832872','Flavia Andrea Flores Gomez','937282718');
INSERT INTO Remitente VALUES ('29484829','Antonio Fabricio Luna Bozo','902382819');
INSERT INTO Remitente VALUES ('73828391','Irma Gabriela Orosco Flores','928383828');
INSERT INTO Remitente VALUES ('79494980','Pablo Valerio Pardo Ruiz','900836272');
INSERT INTO Remitente VALUES ('28438493','Carla Fabiana Dongo Berrio','939393610');
INSERT INTO Remitente VALUES ('75082829','Luana Kiara Ramirez Jaen','937377001');
INSERT INTO Remitente VALUES ('29483483','Oscar Joaquin Samanez Holgado','911938285');
INSERT INTO Remitente VALUES ('73711289','Sebastian Hector Bacca Nuñez','977362621');
INSERT INTO Remitente VALUES ('23839997','Angela Daniela Urruti Dongo','983737281');
INSERT INTO Remitente VALUES ('28484809','Anai Anabel Zeballos Chavez','947473812');
INSERT INTO Remitente VALUES ('70393982','Zoila Karen Umpire Cereceda','973838391');
INSERT INTO Remitente VALUES ('28438381','Patricia Mary Calderon Lopez','901928381');
INSERT INTO Remitente VALUES ('78328283','Joaquin Marcos Marquina Ambar','937282718');
INSERT INTO Remitente VALUES ('77565372','Estela Andrea Romaña Hernandez','910282718');
INSERT INTO Remitente VALUES ('70494848','Thomas Umberto Jefferson Dongo','933373728');
INSERT INTO Remitente VALUES ('28003838','Nilda Joaquina Ruiz Galdos','902828281');
INSERT INTO Remitente VALUES ('79393090','Luana Hermelinda Aires Fossca','937282718');
INSERT INTO Remitente VALUES ('73832672','Adriana Ramira Perez Indi','937282718');
INSERT INTO Remitente VALUES ('73832832','Danitza Javiera Quispe Mamani','937282718');
INSERT INTO Remitente VALUES ('73833372','Paolo Sergio Fernandez Suarez','937282718');
/*Gianfranco*/
INSERT INTO Remitente VALUES ('55210203816', 'Gabino Alarcón Grau', '961203669');
INSERT INTO Remitente VALUES ('13858742020', 'Miguela de Pina', '911777044');
INSERT INTO Remitente VALUES ('12652027845', 'Lalo Navarrete Santana', '953769161');
INSERT INTO Remitente VALUES ('20548762076', 'Rosalía Paz Alonso', '914561605');
INSERT INTO Remitente VALUES ('25678020749', 'Ascensión del Castellanos', '910605348');
INSERT INTO Remitente VALUES ('07456782064', 'Eduardo Diez Vallejo', '929350421');
INSERT INTO Remitente VALUES ('27891050356', 'Duilio Moliner Alvarez', '979276307');
INSERT INTO Remitente VALUES ('20123450362', 'Edelmiro Blazquez Aroca', '956797964');
INSERT INTO Remitente VALUES ('26705888564', 'Victor Céspedes Rosselló', '973556581');
INSERT INTO Remitente VALUES ('03341762843', 'Melchor Calvet Valderrama', '924810499');
/*FIN REMITENTE*/
/*DANIELA*/
INSERT INTO Tipo_Remitente VALUES ('80567062', 'DNI');
INSERT INTO Tipo_Remitente VALUES ('45023150', 'DNI');
INSERT INTO Tipo_Remitente VALUES ('73682010', 'DNI');
INSERT INTO Tipo_Remitente VALUES ('43191633', 'DNI');
INSERT INTO Tipo_Remitente VALUES ('40514277', 'DNI');
INSERT INTO Tipo_Remitente VALUES ('10665585', 'DNI');
INSERT INTO Tipo_Remitente VALUES ('77014633', 'DNI');
INSERT INTO Tipo_Remitente VALUES ('40059190', 'DNI');
INSERT INTO Tipo_Remitente VALUES ('41228995', 'DNI');
INSERT INTO Tipo_Remitente VALUES ('46900603', 'DNI');
INSERT INTO Tipo_Remitente VALUES ('92746427', 'DNI');
INSERT INTO Tipo_Remitente VALUES ('73563893', 'DNI');
INSERT INTO Tipo_Remitente VALUES ('93764923', 'DNI');
INSERT INTO Tipo_Remitente VALUES ('82736747', 'DNI');
INSERT INTO Tipo_Remitente VALUES ('03937848', 'DNI');
INSERT INTO Tipo_Remitente VALUES ('20552103816', 'RUC');
INSERT INTO Tipo_Remitente VALUES ('20538856674', 'RUC');
INSERT INTO Tipo_Remitente VALUES ('10238759495', 'RUC');
INSERT INTO Tipo_Remitente VALUES ('17273894395', 'RUC');
INSERT INTO Tipo_Remitente VALUES ('19277697959', 'RUC');
/*Rodrigo*/
INSERT INTO Tipo_Remitente VALUES ('20502307836', 'RUC');
INSERT INTO Tipo_Remitente VALUES ('20201385874', 'RUC');
INSERT INTO Tipo_Remitente VALUES ('20212657845', 'RUC');
INSERT INTO Tipo_Remitente VALUES ('20227452676', 'RUC');
INSERT INTO Tipo_Remitente VALUES ('20217322919', 'RUC');
INSERT INTO Tipo_Remitente VALUES ('21104326564', 'RUC');
INSERT INTO Tipo_Remitente VALUES ('20441239201', 'RUC');
INSERT INTO Tipo_Remitente VALUES ('21345678022', 'RUC');
INSERT INTO Tipo_Remitente VALUES ('21355357674', 'RUC');
INSERT INTO Tipo_Remitente VALUES ('20334276743', 'RUC');
/*Sergio*/
INSERT INTO Tipo_Remitente VALUES ('73832672','DNI');
INSERT INTO Tipo_Remitente VALUES ('29484829','DNI');
INSERT INTO Tipo_Remitente VALUES ('73828391','DNI');
INSERT INTO Tipo_Remitente VALUES ('79494980','DNI');
INSERT INTO Tipo_Remitente VALUES ('28438493','DNI');
INSERT INTO Tipo_Remitente VALUES ('75082829','DNI');
INSERT INTO Tipo_Remitente VALUES ('29483483','DNI');
INSERT INTO Tipo_Remitente VALUES ('73711289','DNI');
INSERT INTO Tipo_Remitente VALUES ('23839997','DNI');
INSERT INTO Tipo_Remitente VALUES ('28484809','DNI');
INSERT INTO Tipo_Remitente VALUES ('70393982','DNI');
INSERT INTO Tipo_Remitente VALUES ('28438381','DNI');
INSERT INTO Tipo_Remitente VALUES ('78328283','DNI');
INSERT INTO Tipo_Remitente VALUES ('77565372','DNI');
INSERT INTO Tipo_Remitente VALUES ('70494848','DNI');
INSERT INTO Tipo_Remitente VALUES ('28003838','DNI');
INSERT INTO Tipo_Remitente VALUES ('79393090','DNI');
INSERT INTO Tipo_Remitente VALUES ('73832872','DNI');
INSERT INTO Tipo_Remitente VALUES ('73832832','DNI');
INSERT INTO Tipo_Remitente VALUES ('73833372','DNI');	

/*GIANFRANCO*/
INSERT INTO Tipo_Remitente VALUES ('55210203816', 'RUC');
INSERT INTO Tipo_Remitente VALUES ('13858742020', 'RUC');
INSERT INTO Tipo_Remitente VALUES ('12652027845', 'RUC');
INSERT INTO Tipo_Remitente VALUES ('20548762076', 'RUC');
INSERT INTO Tipo_Remitente VALUES ('25678020749', 'RUC');
INSERT INTO Tipo_Remitente VALUES ('07456782064', 'RUC');
INSERT INTO Tipo_Remitente VALUES ('27891050356', 'RUC');
INSERT INTO Tipo_Remitente VALUES ('20123450362', 'RUC');
INSERT INTO Tipo_Remitente VALUES ('26705888564', 'RUC');
INSERT INTO Tipo_Remitente VALUES ('03341762843', 'RUC');
/*Fin Tipo_Rem*/
/*DANIELA*/
INSERT INTO Conductor VALUES ('H71315807', '71315807', 'Jorge Alca Palma');
INSERT INTO Conductor VALUES ('H29510107', '29510107', 'Bernandino Chacon Alvarez');
INSERT INTO Conductor VALUES ('H40982404', '40982404', 'Cristian Jhon Chirinos Cancino');
INSERT INTO Conductor VALUES ('Z29725438', '29725438', 'Henry Richard Gamero Huallpa');
INSERT INTO Conductor VALUES ('H44539594', '44539594', 'Luis Garambero Iberos');
INSERT INTO Conductor VALUES ('H40918367', '40918367', 'Juan Ancco Calisaya');
INSERT INTO Conductor VALUES ('U43547640', '43547640', 'Elvis Hilasaca Sulla');
INSERT INTO Conductor VALUES ('Z24889281', '24889281', 'Raymundo Humani Miranda');
INSERT INTO Conductor VALUES ('T30846408', '30846408', 'Santos Feliciano Humani Rojas');
INSERT INTO Conductor VALUES ('Q80026373', '80026373', 'Jose Luis Laupa Vargas');
INSERT INTO Conductor VALUES ('H46172030', '46172030', 'Irving Rodrigo Barriga Mestas');
INSERT INTO Conductor VALUES ('H47053704', '47053704', 'Wilver Bautista Vilcatoma');
INSERT INTO Conductor VALUES ('H42160989', '42160989', 'Milla Calizaya Gutierrez');
INSERT INTO Conductor VALUES ('F21532964', '21532964', 'Omar Llamccaya Gamero');
INSERT INTO Conductor VALUES ('Q42520478', '42520478', 'Elvin Ronal Castañeda Honorio');
INSERT INTO Conductor VALUES ('H43283872', '43283872', 'Percy Moreno Bulnes');
INSERT INTO Conductor VALUES ('F45272388', '45272388', 'Jorge Iviedo Marquez');
INSERT INTO Conductor VALUES ('F26363848', '26363848', 'Omar Medina Pajuelo');
INSERT INTO Conductor VALUES ('H42513742', '42513742', 'Carlos Navarro Foraquita');
INSERT INTO Conductor VALUES ('H28237823', '28237823', 'Edgar Perca Paco');
/*SERGIO*/
INSERT INTO conductor VALUES ('D37282819','37282819','Federico André Ramirez López');
INSERT INTO conductor VALUES ('F28483804','28483804','Karen Gabriela Núñez Andrade');
INSERT INTO conductor VALUES ('H73373726','73373726','Hector Gabriel Quipse Flores');
INSERT INTO conductor VALUES ('R28482818','28482818','Antonio Fausto Soares Zúñiga');
INSERT INTO conductor VALUES ('F74828291','74828291','Bruno Daniel Kriss Galvez');
INSERT INTO conductor VALUES ('F59393922','59393922','Vania Nilda Lucescu Vélez');
INSERT INTO conductor VALUES ('H38389291','38389291','María Lucía Bacca Berrío');
INSERT INTO conductor VALUES ('D48382817','48382817','Irma Flavia Deniss Juárez');
INSERT INTO conductor VALUES ('E73929281','73929281','Mauricio Samuel Corzo Núñez');
INSERT INTO conductor VALUES ('L38483924','38483924','Joaquin Karlo Velázquez Ruíz');
INSERT INTO conductor VALUES ('U73828191','73828191','Oscar Yoni López Berrío');
INSERT INTO conductor VALUES ('C48382912','48382912','Samir Paolo Méndez Orosco');
INSERT INTO conductor VALUES ('F63281993','63281993','Nora Sofía Xesspes Holgado');
INSERT INTO conductor VALUES ('Y38933891','38933891','Carlo André Muñoz Paredes');
INSERT INTO conductor VALUES ('U84292828','84292828','Nilda Sonia Ossco Lazo');
INSERT INTO conductor VALUES ('C19383195','19383195','Javier Mario Rojas Ríos');
INSERT INTO conductor VALUES ('J53832319','53832319','Luciano Santiago Gómez Carpio');
INSERT INTO conductor VALUES ('P88492392','88492392','Paula Irma Medina Hernández');
INSERT INTO conductor VALUES ('J49393826','49393826','Alberto Hugo Flores Salvio');
INSERT INTO conductor VALUES ('A33292819','33292819','Sebastián Jorge Paredes Málaga');
/*Fin Conductor*/

/*DANIELA*/
INSERT INTO Vehiculo VALUES ('V6Q-745', '38483848', 'C-3', 'Volvo');
INSERT INTO Vehiculo VALUES ('V1X-858', '95832560', 'C-3', 'Volvo');
INSERT INTO Vehiculo VALUES ('V1X-867', '55832561', 'C-2', 'Freightliner');
INSERT INTO Vehiculo VALUES ('V1X-855', '65832561', 'C-3', 'Volvo');
INSERT INTO Vehiculo VALUES ('V1X-860', '37421035', 'C-3', 'Volvo');
INSERT INTO Vehiculo VALUES ('V1X-862', '44669166', 'C-4', 'Freightliner');
INSERT INTO Vehiculo VALUES ('F6I-725', '17421035', 'C-4', 'Freightliner');
INSERT INTO Vehiculo VALUES ('D7R-820', '74210352', 'C-4', 'Freightliner');
INSERT INTO Vehiculo VALUES ('F7S-847', '74210353', 'C-3', 'Volvo');
INSERT INTO Vehiculo VALUES ('F6W-819', '97479623', 'C-2', 'Freightliner');
INSERT INTO Vehiculo VALUES ('F5Z-737', '74796335', 'C-3', 'Volvo');
INSERT INTO Vehiculo VALUES ('F6O-715', '55479424', 'C-3', 'Volvo');
INSERT INTO Vehiculo VALUES ('F6W-782', '96410439', 'C-2', 'Volvo');
INSERT INTO Vehiculo VALUES ('V3S-879', '82702718', 'C-3', 'Freightliner');
INSERT INTO Vehiculo VALUES ('V5L-756', '39027083', 'C-3', 'Freightliner');
INSERT INTO Vehiculo VALUES ('G5Z-543', '71467347', 'C-2', 'Volvo');
INSERT INTO Vehiculo VALUES ('V7F-123', '18473718', 'C-2', 'Volvo');
INSERT INTO Vehiculo VALUES ('G3J-847', '92732483', 'C-2', 'Volvo');
INSERT INTO Vehiculo VALUES ('V7G-943', '92832743', 'C-4', 'Freightliner');
INSERT INTO Vehiculo VALUES ('V1J-756', '62848232', 'C-4', 'Freightliner');
/*SERGIO*/
INSERT INTO vehiculo VALUES ('F5K-812','84839291','C-3','VOLVO');
INSERT INTO vehiculo VALUES ('G7U-948','48292919','C-2','FREIGHTLINER');
INSERT INTO vehiculo VALUES ('J9P-482','27392382','C-4','FREIGHTLINER');
INSERT INTO vehiculo VALUES ('D3H-387','49292724','C-2','VOLVO');
INSERT INTO vehiculo VALUES ('I7Y-304','39839927','C-3','VOLVO');
INSERT INTO vehiculo VALUES ('S4L-832','39282896','C-2','FREIGHTLINER');
INSERT INTO vehiculo VALUES ('O4T-748','27392382','C-4','FREIGHTLINER');
INSERT INTO vehiculo VALUES ('W1Q-487','48389282','C-3','VOLVO');
/*Fin Vehiculo*/

/*DANIELA*/
INSERT INTO Ruta VALUES (1, '2022-01-12', 'Arequipa-Lima', '17:30', 'H71315807','V6Q-745');
INSERT INTO Ruta VALUES (2, '2022-01-12', 'Arequipa-Tacna', '19:30', 'H29510107','V1X-858');
INSERT INTO Ruta VALUES (3, '2022-01-12', 'Arequipa-Moquegua', '17:00', 'H40982404','V1X-867');
INSERT INTO Ruta VALUES (4, '2022-01-12', 'Arequipa-Puno', '21:30', 'Z29725438','V1X-855');
INSERT INTO Ruta VALUES (5, '2022-01-20', 'Lima-Cajamarca', '17:00', 'H44539594','V1X-860');   
INSERT INTO Ruta VALUES (6, '2022-01-20', 'Lima-Chincha', '17:30', 'H40918367','V1X-862');
INSERT INTO Ruta VALUES (7, '2022-01-21', 'Lima-Ayacucho', '07:30', 'U43547640','F6I-725');
INSERT INTO Ruta VALUES (8, '2022-01-21', 'Lima-Huanuco', '21:30', 'Z24889281','D7R-820');
INSERT INTO Ruta VALUES (9, '2022-02-10', 'Lima-Arequipa', '12:00', 'T30846408','F7S-847');
INSERT INTO Ruta VALUES (10, '2022-02-10', 'Moquegua-Arequipa', '19:00', 'Q80026373','F6W-819');
INSERT INTO Ruta VALUES (11, '2022-02-13', 'Puno-Arequipa', '21:30', 'H46172030','F5Z-737');
INSERT INTO Ruta VALUES (12, '2022-03-22', 'Cajamarca-Lima', '23:00', 'H47053704','F6O-715');
INSERT INTO Ruta VALUES (13, '2022-03-30', 'Chincha-Lima', '11:00', 'H42160989','F6W-782');
INSERT INTO Ruta VALUES (14, '2022-04-03', 'Ayacucho-Lima', '20:30', 'F21532964','V3S-879');
INSERT INTO Ruta VALUES (15, '2022-04-04', 'Arequipa-Lima', '17:30', 'Q42520478','V5L-756');
INSERT INTO Ruta VALUES (16, '2022-04-13', 'Puno-Arequipa', '21:30', 'H43283872','G5Z-543');
INSERT INTO Ruta VALUES (17, '2022-04-13', 'Cajamarca-Lima', '23:00', 'F45272388','V7F-123');
INSERT INTO Ruta VALUES (18, '2022-04-15', 'Chincha-Lima', '11:00', 'F26363848','G3J-847');
INSERT INTO Ruta VALUES (19, '2022-04-15', 'Ayacucho-Lima', '20:30', 'H42513742','V7G-943');
INSERT INTO Ruta VALUES (20, '2022-04-15', 'Arequipa-Lima', '17:30', 'H28237823','V1J-756');
/*SERGIO*/
INSERT INTO Ruta VALUES (41,'2022-07-17','Chiclayo-Arequipa','17:15','C48382912','J9P-482');
INSERT INTO Ruta VALUES (42,'2022-07-28','Puno-Tacna','08:00','E73929281','S4L-832');
INSERT INTO Ruta VALUES (43,'2022-07-29','Ayacucho-Lima','13:30','H38389291','I7Y-304');
INSERT INTO Ruta VALUES (44,'2022-07-29','Piura-Ica','11:00','U84292828','W1Q-487');
INSERT INTO Ruta VALUES (45,'2022-07-31','Lima-Cuzco','12:00','Y38933891','S4L-832');
INSERT INTO Ruta VALUES (46,'2022-08-05','Moquegua-Ancash','18:45','J49393826','S4L-832');
INSERT INTO Ruta VALUES (47,'2022-08-05','Arequipa-Loreto','14:30','F74828291','D3H-387');
INSERT INTO Ruta VALUES (48,'2022-08-12','Pasco-Cajamarca','07:00','U84292828','W1Q-487');
INSERT INTO Ruta VALUES (49,'2022-08-15','Piura-Lima','11:30','U84292828','G7U-948');
INSERT INTO Ruta VALUES (50,'2022-08-15','Tacna-Ica','22:00','J53832319','W1Q-487');
INSERT INTO Ruta VALUES (51,'2022-08-25','Junin-Loreto','20:30','H73373726','I7Y-304');
INSERT INTO Ruta VALUES (52,'2022-08-26','Cuzco-Arequipa','15:00','F59393922','W1Q-487');
INSERT INTO Ruta VALUES (53,'2022-08-26','Trujillo-Tumbes','21:30','H38389291','J9P-482');
INSERT INTO Ruta VALUES (54,'2022-08-30','San Martín-Junin','12:00','P88492392','F5K-812');
INSERT INTO Ruta VALUES (55,'2022-09-01','Ucayali-Arequipa','23:00','F74828291','O4T-748');
INSERT INTO Ruta VALUES (56,'2022-09-06','Madre de Dios-Ancash','18:30','U73828191','J9P-482');
INSERT INTO Ruta VALUES (57,'2022-09-06','Lima-Ica','11:30','J53832319','G7U-948');
INSERT INTO Ruta VALUES (58,'2022-09-20','Moquegua-Loreto','09:00','U84292828','S4L-832');
INSERT INTO Ruta VALUES (59,'2022-09-21','Pasco-Ancash','22:30','L38483924','I7Y-304');
INSERT INTO Ruta VALUES (60,'2022-09-27','Moquegua-Lima','07:15','F63281993','S4L-832');
/*Fin Ruta*/

/*DANIELA*/
INSERT INTO Tipo_Flete VALUES (1, 'pagado');
INSERT INTO Tipo_Flete VALUES (2, 'destino');
/*Fin Tipo_Flete*/
/*DANIELA*/
INSERT INTO Encomienda VALUES (1, 'Dice contener maletines', 3, 'caja', 1, 'kg', '17273894395', '80567062', 2);  
INSERT INTO Encomienda VALUES (2, 'Dice contener celulares', 10, 'caja', 5, 'kg', '73379238', '45023150', 2);   
INSERT INTO Encomienda VALUES (3, 'Dice contener cucharas', 1, 'paquete', 10, 'kg', '73337932', '20552103816', 2);
INSERT INTO Encomienda VALUES (4, 'Dice contener microscopio', 1, 'caja', 6, 'kg', '54649398', '10238759495', 5);  
INSERT INTO Encomienda VALUES (5, 'Dice contener documentos', 1, 'paquete', 0.5, 'kg', '54454124', '10238759495', 7);  
INSERT INTO Encomienda VALUES (6, 'Dice contener binoculares', 1, 'caja', 3, 'kg', '73547592', '10238759495', 8);
INSERT INTO Encomienda VALUES (7, 'Dice contener sillas', 6, 'caja', 30, 'kg', '92746427', '73682010', 11);
INSERT INTO Encomienda VALUES (8, 'Dice contener almohadas', 20, 'bulto', 3, 'kg', '73563893', '40514277', 8);  
INSERT INTO Encomienda VALUES (9, 'Dice contener cama', 1, 'caja', 60, 'kg', '73563893', '40514277', 8);  
INSERT INTO Encomienda VALUES (10, 'Dice contener maquillaje', 1, 'caja', 2, 'kg', '92746427', '19277697959', 15);
INSERT INTO Encomienda VALUES (11, 'Dice contener microscopio', 1, 'caja', 6, 'kg', '20538856674', '10238759495', 9);  
INSERT INTO Encomienda VALUES (12, 'Dice contener cargadores', 10, 'bulto', 2, 'kg', '73563893', '19277697959', 17);
/*Braulio*/
INSERT INTO Encomienda VALUES (13, 'Dice contener libros', 7, 'caja', 10, 'kg', '82736747', '73711289', 7);
INSERT INTO Encomienda VALUES (14, 'Dice contener tazas', 15, 'caja', 9, 'kg', '17278473299', '19277697959', 19);
INSERT INTO Encomienda VALUES (15, 'Dice contener PC', 2, 'paquete', 20, 'kg', '47102943', '20334276743', 9);
INSERT INTO Encomienda VALUES (16, 'Dice contener gorros', 14, 'bulto', 7.5, 'kg', '29304101', '17273894395', 6);
INSERT INTO Encomienda VALUES (17, 'Dice contener billeteras', 9, 'caja', 5, 'kg', '73337932', '40514277', 1);
INSERT INTO Encomienda VALUES (18, 'Dice contener polos', 20, 'bulto', 7, 'kg', '26133748748', '45023150', 2);
INSERT INTO Encomienda VALUES (19, 'Dice contener pantalones', 2, 'caja', 8, 'kg', '28102913', '82736747', 20);
INSERT INTO Encomienda VALUES (20, 'Dice contener canilleras', 6, 'paquete', 3, 'kg', '20334176843', '19277697959', 11);
/*Miguel*/
INSERT INTO Encomienda VALUES (21, 'Dice contener relojes', 4, 'paquete', 9, 'kg', '29304101', '10238759495', 12);  
INSERT INTO Encomienda VALUES (22, 'Dice contener laptops', 15, 'caja', 20, 'kg', '25636488467', '21355357674', 20);  
INSERT INTO Encomienda VALUES (23, 'Dice contener celulares', 34, 'paquete', 10, 'kg', '20552103819', '21355357674', 14);  
INSERT INTO Encomienda VALUES (24, 'Dice contener sillas', 8, 'caja', 70, 'kg', '20503567891', '78328283', 2);  
INSERT INTO Encomienda VALUES (25, 'Dice contener consolas', 10, 'caja', 40, 'kg', '63201928', '70393982', 15);  
INSERT INTO Encomienda VALUES (26, 'Dice contener televisiones', 12, 'caja', 100, 'kg', '20201385874', '73832872', 18);  
INSERT INTO Encomienda VALUES (27, 'Dice contener tazas', 24, 'paquete', 5, 'kg', '20334176843', '93764923', 11);  
INSERT INTO Encomienda VALUES (28, 'Dice contener impresoras', 5, 'caja', 50, 'kg', '17273894395', '70494848', 8);
/*Rodrigo*/
INSERT INTO Encomienda VALUES (29, 'Dice contener teclados', 20, 'caja', 4, 'kg', '45239801', '20201385874', 53);  
INSERT INTO Encomienda VALUES (30, 'Dice contener mouses', 5, 'caja', 3, 'kg', '20588856674', '20217322919', 48);   
INSERT INTO Encomienda VALUES (31, 'Dice contener tarjetas grafica', 1, 'caja', 2, 'kg', '20212657845', '70393982', 52);
INSERT INTO Encomienda VALUES (32, 'Dice contener parlantes', 10, 'paquete', 4, 'kg', '20607456784', '20212657845', 44);  
INSERT INTO Encomienda VALUES (33, 'Dice contener monitores', 10, 'caja', 7.6, 'kg', '72430129', '20227452676', 60);  
INSERT INTO Encomienda VALUES (34, 'Dice contener camaras web', 1, 'bulto', 0.5, 'kg', '47301294', '20334276743', 59);
INSERT INTO Encomienda VALUES (35, 'Dice contener cases', 10, 'caja', 10.5, 'kg', '47102943', '28003838', 43);
INSERT INTO Encomienda VALUES (36, 'Dice contener lamparas', 3, 'bulto', 4, 'kg', '19277697959', '21355357674', 46);
/*SERGIO*/
INSERT INTO Encomienda VALUES (37, 'Dice contener rones', 6, 'caja', 10, 'kg', '20552103819', '10665585', 46);
INSERT INTO Encomienda VALUES (38, 'Dice contener leche', 4, 'paquete', 8, 'kg', '28102913', '80567062', 51);
INSERT INTO Encomienda VALUES (39, 'Dice contener piqueos', 1, 'paquete', 0.5, 'kg', '20552103819', '93764923', 49);
INSERT INTO Encomienda VALUES (40, 'Dice contener uvas', 1, 'bulto', 3, 'kg', '20503567891', '93764923', 56);
INSERT INTO Encomienda VALUES (41, 'Dice contener pollos', 2, 'caja', 16, 'kg', '63201928', '75082829', 45);
INSERT INTO Encomienda VALUES (42, 'Dice contener ollas', 6, 'caja', 13, 'kg', '20588856674', '29484829', 48);
INSERT INTO Encomienda VALUES (43, 'Dice contener gaseosas', 3, 'paquete', 5, 'kg', '47102943', '19277697959', 54);
INSERT INTO Encomienda VALUES (44, 'Dice contener cervezas', 12, 'paquete', 4, 'kg', '72430129', '28484809', 47);
/*Giafranco*/
INSERT INTO Encomienda VALUES (45, 'Dice contener Cartucheras', 10, 'paquete', 2, 'kg', '54454124', '73832832', 45);
INSERT INTO Encomienda VALUES (46, 'Dice contener Portaretratos', 5, 'caja', 3, 'kg', '03937848', '79393090', 46);
INSERT INTO Encomienda VALUES (47, 'Dice contener Celulares', 20, 'caja', 6, 'kg', '92746427', '79393090', 47);
INSERT INTO Encomienda VALUES (48, 'Dice contener Autopartes', 2, 'caja', 10, 'kg', '73379238', '79494980', 48);
INSERT INTO Encomienda VALUES (49, 'Dice contener Libros', 5, 'bulto', 4, 'kg', '17273894395', '20441239201', 49);
INSERT INTO Encomienda VALUES (50, 'Dice contener Jeans', 10, 'bulto', 6, 'kg', '73563893', '17273894395', 50);
INSERT INTO Encomienda VALUES (51, 'Dice contener Zapatillas', 3, 'caja', 2, 'kg', '10293837482', '43191633', 51);
INSERT INTO Encomienda VALUES (52, 'Dice contener Audífonos', 40, 'paquete', 3, 'kg', '20212657845', '40059190',52);
/*Fin Encomienda*/

/*DANIELA*/
INSERT INTO Guia_de_remision VALUES (1, 'V1X-858', 'H29510107', '80567062','17273894395', 1, 2, 2, 'Arequipa', 'Arequipa', 'Jacobo Hunter', 'Fundo El Pepito', 'Tacna', 'Tacna', 'Jorge Basadre', 'Av. Miraflores 103', 5.00);
INSERT INTO Guia_de_remision VALUES (2, 'V1X-858', 'H29510107', '45023150','73379238', 2, 2, 1, 'Arequipa', 'Arequipa', 'Jose Luis B y R', 'Urb. 3 de octubre', 'Tacna', 'Tacna', 'Jorge Basadre', 'JorgeBasadre N°45', 25.00);
INSERT INTO Guia_de_remision VALUES (3, 'V1X-858', 'H29510107', '20552103816','73337932', 3, 2, 2, 'Arequipa', 'Arequipa', 'Paucarpata', 'Av. Los Alpes 102', 'Tacna', 'Tacna', 'Tarata', 'Av. Camilaca N°54', 50.00);
INSERT INTO Guia_de_remision VALUES (4, 'V1X-860', 'H44539594', '10238759495','54649398', 4, 5, 2, 'Lima', 'Lima', 'San Isidro', 'Javier Prado 162', 'Cajamarca', 'Cajamarca', 'Chota', 'Av.Alpes N23', 30.00);
INSERT INTO Guia_de_remision VALUES (5, 'F6I-725', 'U43547640', '10238759495','54454124', 5, 7, 2, 'Lima', 'Lima', 'San Isidro', 'Javier Prado 162', 'Cajamarca', 'Ayacucho', 'Huamanga', 'San JuanBautista N23', 2.50);
INSERT INTO Guia_de_remision VALUES (6, 'D7R-820', 'Z24889281', '10238759495','73547592', 6, 8, 2, 'Lima', 'Lima', 'San Isidro', 'Javier Prado 162', 'Huanuco', 'Puerto Inca', 'Codo del Pozuzo', 'Av. Lázaro nro.111', 15.00);
INSERT INTO Guia_de_remision VALUES (7, 'F5Z-737', 'H46172030', '73682010','92746427', 7, 11, 1, 'Puno', 'Puno', 'Acora', 'Av. La paz nro.14', 'Arequipa', 'Arequipa', 'Cerro Colorado', 'Av. aviacion nro.12', 150.00);
INSERT INTO Guia_de_remision VALUES (8, 'D7R-820', 'Z24889281', '40514277','73563893', 8, 8, 2, 'Lima', 'Lima', 'Barranco', 'Av Lima 452', 'Huanuco', 'Leoncio Prado ', 'Tingo María', 'Av. Los Incas nro.12', 15.00);
INSERT INTO Guia_de_remision VALUES (9, 'D7R-820', 'Z24889281', '40514277','73563893', 9, 8, 2, 'Lima', 'Lima', 'Barranco', 'Av Lima 123', 'Huanuco', 'Leoncio Prado ', 'Tingo María', 'Av. Los Incas nro.12', 300.00);
INSERT INTO Guia_de_remision VALUES (10,'V5L-756', 'Q42520478', '19277697959','92746427', 10, 15, 2, 'Arequipa', 'Arequipa', 'Paucarpata', 'Av. Los Alpes 102', 'Lima', 'Lima', 'San Isidro', 'Javier Prado 162', 10.00);
INSERT INTO Guia_de_remision VALUES (11,'F7S-847', 'T30846408', '10238759495','20538856674', 11, 9, 2, 'Lima', 'Lima', 'Los olivos', 'Ca. Los Claveles', 'Arequipa', 'Arequipa', 'Paucarpata', 'Av. Los Alpes 11', 30.00);
INSERT INTO Guia_de_remision VALUES (12,'V7F-123', 'F45272388', '19277697959','73563893', 12, 17, 1, 'Cajamarca', 'Jaén', 'San Ignacio', 'Urb. Las Palmas', 'Lima', 'Lima', 'San Isidro', 'Javier Prado 152', 50.00);
/*Braulio*/
INSERT INTO Guia_de_remision VALUES (13,'F6I-725', 'U43547640', '73711289','82736747', 13, 7, 1, 'Lima', 'Lima', 'Miraflores', 'Larcomar', 'Ayacucho', 'Huamanga', 'San Jorge', 'Av.Peru', 50.00);
INSERT INTO Guia_de_remision VALUES (14,'V7G-943', 'H42513742', '19277697959','17278473299', 14, 19, 2, 'Ayacucho', 'La Mar', 'Anchihuay', 'Av.Lima', 'Lima', 'Lima', ' La Victoria', 'Matute', 45.00);
INSERT INTO Guia_de_remision VALUES (15, 'F7S-847', 'T30846408', '20334276743','47102943', 15,9, 1, 'Lima', 'Cañete', 'San Vicente', 'Av.Ejercito', 'Arequipa', 'Arequipa', 'Yanahuara', 'Metropolitana', 100.00);
INSERT INTO Guia_de_remision VALUES (16, 'V1X-862', 'H40918367', '17273894395', '29304101', 16,6,1, 'Lima', 'Lima', 'Molina', '28 de Julio', 'Ica', 'Chincha', 'Chavin', 'Av.Puno', 37.50);
INSERT INTO Guia_de_remision VALUES (17, 'V6Q-745', 'H71315807', '40514277', '73337932', 17,1, 2, 'Arequipa', 'Islay', 'Mollendo', 'Cordova', 'Lima', 'Lima', 'San Isidro', 'Ferre', 25.00);
INSERT INTO Guia_de_remision VALUES (18, 'V1X-858', 'H29510107', '45023150', '26133748748', 18,2, 2, 'Arequipa', 'Arequipa', 'Selva Alegre', 'Marina', 'Tacna', 'Tacna', 'Pocollay', 'Internacional', 35.00);
INSERT INTO Guia_de_remision VALUES (19, 'V1J-756', 'H29510107', '82736747', '28102913', 19,20, 1, 'Arequipa', 'Caylloma', 'Chivay', '2 de Mayo', 'Lima', 'Callao', 'Callao', 'Huascar', 40.00);
INSERT INTO Guia_de_remision VALUES (20, 'F5Z-737', 'H46172030', '19277697959', '20334176843', 20,11, 1, 'Puno', 'Puno', 'Acora',  '25 de Julio', 'Arequipa', 'Arequipa', 'Cercado', 'La Merced',15.00);
/*MIguel*/
INSERT INTO Guia_de_remision VALUES (21, 'V1J-756', 'H28237823', '10238759495',  '29304101', 21, 20, 1, 'Arequipa', 'Arequipa', 'Cerro Colorado', 'C. Miguel Grau 110', 'Lima', 'Lima', 'San Isidro', 'Plaza Esquilache 506', 45.00);
INSERT INTO Guia_de_remision VALUES (22, 'V5L-756', 'Q42520478', '21355357674', '25636488467', 22, 15, 2, 'Arequipa', 'Arequipa', 'JLByR', 'C. Los Lirios 205', 'Lima', 'Lima', 'Miraflores', 'Larcomar', 100.00);
INSERT INTO Guia_de_remision VALUES (23, 'D7R-820', 'Z24889281', '21355357674',  '20552103819', 23, 8, 1, 'Lima', 'Lima', 'La Molina', 'Calle Miami 407', 'Huanuco', 'Huanuco', 'Amarilis', 'Av. San Marcos 307', 50.00);
INSERT INTO Guia_de_remision VALUES (24, 'V1X-860', 'H44539594', '78328283', '20503567891', 24, 5, 2, 'Lima', 'Lima', 'Comas', '', 'Cajamarca', 'Cajamarca', 'Jaen', 'Oroya 306', 350.00);
INSERT INTO Guia_de_remision VALUES (25, 'F6W-819', 'Q80026373', '70393982',  '63201928', 25, 10, 2, 'Moquegua', 'Moquegua', 'Coalaque', 'Plaza 201', 'Arequipa', 'Arequipa', 'Yanahuara', 'La Paz 501', 200.00);
INSERT INTO Guia_de_remision VALUES (26, 'F7S-847', 'T30846408', '73832872', '20201385874', 26, 9, 1, 'Lima', 'Lima', 'San Borja', 'C. San Felipe 305', 'Arequipa', 'Arequipa', 'Miraflores', 'Av. Progreso 406', 500.00);
INSERT INTO Guia_de_remision VALUES (27, 'V1X-862', 'H40918367', '93764923',  '20334176843', 27, 6, 2, 'Lima', 'Lima', 'Los Olivos', 'Parque  Naranjal 215', 'Chincha', 'Chincha', 'Alto Larán', 'Urb. San Juan D-10', 25.00);
INSERT INTO Guia_de_remision VALUES (28, 'F6I-725', 'U43547640', '70494848',  '17273894395', 28, 7, 1, 'Lima', 'Lima', 'San Isidro', 'Las Golondrinas', 'Ayacucho', 'Ayacucho', 'Huamanga', 'Vallejo 105', 250.00);
/*Rodrigo*/
INSERT INTO Guia_de_remision VALUES (29, 'J9P-482', 'H38389291', '20201385874','45239801', 29, 53, 1, 'Trujillo', 'Laredo', 'Liñan', 'Jr amapolas', 'Tumbes', 'Chimbi', 'Carrion', 'Av Tupac 201', 20.00);
INSERT INTO Guia_de_remision VALUES (30, 'W1Q-487', 'U84292828', '20217322919','20588856674', 30, 48, 2, 'Pasco', 'Huayllay', 'Almoran', 'Av Liñan 403', 'Cajamarca', 'Cajamarca', 'Cajamarca', 'Av Union 345', 15.00);
INSERT INTO Guia_de_remision VALUES (31, 'W1Q-487', 'F59393922', '70393982','20212657845', 31, 52, 1, 'Arequipa', 'Arequipa', 'Arequipa', 'Miraflores 301', 'Tacna', 'Ugarte', 'Jr La union 302', 'Elias Aguirre 404', 10.00);
INSERT INTO Guia_de_remision VALUES (32, 'W1Q-487', 'U84292828', '20212657845','20607456784', 32, 44, 2, 'Cuzco', 'Cuzco', 'Cuzco', 'Las piedras 24', 'Arequipa', 'Arequipa', 'Arequipa', 'Av La paz 416', 20.00);
INSERT INTO Guia_de_remision VALUES (33, 'S4L-832', 'F63281993', '20227452676','72430129', 33, 60, 1, 'Moquegua', 'Comuna', 'Comuna', 'Los Alpes 201', 'Lima', 'Lima', 'Barranco', 'Jr Lozano 403', 38.00);
INSERT INTO Guia_de_remision VALUES (34, 'I7Y-304', 'L38483924', '20334276743','47301294', 34, 59, 2, 'Pasco', 'Huachon', 'Huachon', 'Av amapolas 403', 'Ancash', 'Ancash', 'Av Venezuela', 'Alfonso Ohigins 105', 2.50);
INSERT INTO Guia_de_remision VALUES (35, 'I7Y-304', 'H38389291', '28003838','47102943', 35, 43, 1, 'Ayacucho', 'Chanchara', 'Chanchara', 'Av Lozano 504', 'Lima', 'Lima', 'barranco', 'Calari 304', 52.50);
INSERT INTO Guia_de_remision VALUES (36, 'S4L-832', 'J49393826', '21355357674','19277697959', 36, 46, 2, 'Moquegua', 'Comuna', 'Comuna', 'Jr La paz 503', 'Ancash', 'Ancash', '*', 'Alarcon 403', 20.00);
/*Sergio*/
INSERT INTO Guia_de_remision VALUES (37, 'S4L-832','J49393826','10665585','20552103819',37,46,1,'Moquegua','Ilo','Chojata','Av.Industrial','Ancash','Huaylas','Huaraz','Av.confraternidad',50.00);
INSERT INTO Guia_de_remision VALUES (38, 'I7Y-304','H73373726','80567062','28102913',38,51,2,'Junin','Junin','Jauja','Urb.Ricardo Palma','Loreto','Iquitos','Nauta','Av.Colonial 512',40.00);
INSERT INTO Guia_de_remision VALUES (39, 'G7U-948','U84292828','93764923','20552103819',39,49,2,'Piura','Sullana','Bellavista','Urb.La Alborada 301','Lima','Cañete','San Luis','Fundo Monterrico',2.50);
INSERT INTO Guia_de_remision VALUES (40, 'J9P-482','U73828191','93764923','20503567891',40,56,1,'Madre de Dios','Tambopata','Las Piedras','Av.Las Castañas 101','Ancash','Bolognesi','Mormurullo','Jr.Tupac Amaru 203',15.00);
INSERT INTO Guia_de_remision VALUES (41, 'S4L-832','Y38933891','75082829','63201928',41,45,2,'Lima','Huaura','Huacho','Av.Salaverry 405','Cuzco','Paucartambo','Caicay','Av.28 Julio 504',80);
INSERT INTO Guia_de_remision VALUES (42, 'W1Q-487','U84292828','29484829','20588856674',42,48,1,'Pasco','Oxapampa','Oxapampa','Urb.Vila 404','Cajamarca','Cajamarca','Cajabamba','Av.Mexico 206',65.00);
INSERT INTO Guia_de_remision VALUES (43, 'F5K-812','P88492392','19277697959','47102943',43,54,2,'San Martin','San Martin','Moyobamba','Calle Imperial 102','Junin','Junin','Junin','Jr.Molle 105',25.00);
INSERT INTO Guia_de_remision VALUES (44, 'D3H-387','F74828291','28484809','72430129',44,47,2,'Arequipa','Arequipa','Arequipa','Av.Ejercito 403','Loreto','Iquitos','Iquitos','Av.Iquitos 108',16.00);
/*Gianfranco*/
INSERT INTO Guia_de_remision VALUES (45, 'S4L-832', 'Y38933891', '73832832', '54454124', 45, 45, 1, 'Lima', 'Lima', 'Ancón', 'Av Grau 504', 'Cuzco', 'Cuzco', 'Cuzco', 'La Perla 303', 10.00);
INSERT INTO Guia_de_remision VALUES (46, 'S4L-832', 'J49393826', '79393090', '03937848', 46, 46, 2, 'Moquegua', 'Ilo', 'Ilo', 'Jirón Pichincha 504', 'Ancash', 'Huaraz', 'Independencia', 'Calle abtao 305', 15.00);
INSERT INTO Guia_de_remision VALUES (47, 'D3H-387', 'F74828291', '79393090', '92746427', 47, 47, 1, 'Arequipa', 'Arequipa', 'Paucarpata', 'AV EEUU 409', 'Loreto', 'Loreto', 'Ugarteche', 'Los Alpes 321', 30.00);
INSERT INTO Guia_de_remision VALUES (48, 'W1Q-487', 'U84292828', '79494980', '73379238', 48, 48, 1, 'Pasco', 'Yauli', 'Morocha', 'AV los olivos 34', 'Cajamarca', 'San Ignacio', 'Chirinos', 'Los baldez 89', 50.00 );
INSERT INTO Guia_de_remision VALUES (49, 'G7U-948', 'U84292828', '20441239201', '17273894395', 49, 49, 2, 'Piura', 'Paita', 'Arenal', 'Los Alcez 54', 'Lima', 'Lima', 'Barranco', 'AV. Polta 3', 20.00);
INSERT INTO Guia_de_remision VALUES (50, 'W1Q-487', 'J53832319', '17273894395', '73563893', 50, 50, 2, 'Tacna', 'Tacna', 'Tarata', 'Wuilca 302', 'Ica', 'Pisco', 'Paracas', 'Salpi 37', 30.00); 
INSERT INTO Guia_de_remision VALUES (51, 'I7Y-304', 'H73373726', '43191633', '10293837482', 51, 51, 1, 'Junin', 'Junin', 'Satipo', 'Las Orquideas 603', 'Loreto', 'Loreto', 'Ugarteche', 'Los Alpes 321', 10.00);
/*FIN GUIA REMISION*/


INSERT INTO Cuerpo_Guia_Remision VALUES (1,1);
INSERT INTO Cuerpo_Guia_Remision VALUES (2,2);
INSERT INTO Cuerpo_Guia_Remision VALUES (3,3);
INSERT INTO Cuerpo_Guia_Remision VALUES (4,4);
INSERT INTO Cuerpo_Guia_Remision VALUES (5,5);
INSERT INTO Cuerpo_Guia_Remision VALUES (6,6);
INSERT INTO Cuerpo_Guia_Remision VALUES (7,7);
INSERT INTO Cuerpo_Guia_Remision VALUES (8,8);
INSERT INTO Cuerpo_Guia_Remision VALUES (8,9);
INSERT INTO Cuerpo_Guia_Remision VALUES (10,11);
INSERT INTO Cuerpo_Guia_Remision VALUES (12,12);
INSERT INTO Cuerpo_Guia_Remision VALUES (13,13);
INSERT INTO Cuerpo_Guia_Remision VALUES (14,14);
INSERT INTO Cuerpo_Guia_Remision VALUES (15,15);
INSERT INTO Cuerpo_Guia_Remision VALUES (16,16);
INSERT INTO Cuerpo_Guia_Remision VALUES (17,17);
INSERT INTO Cuerpo_Guia_Remision VALUES (18,18);
INSERT INTO Cuerpo_Guia_Remision VALUES (19,19);
INSERT INTO Cuerpo_Guia_Remision VALUES (20,20);
INSERT INTO Cuerpo_Guia_Remision VALUES (21,21);
INSERT INTO Cuerpo_Guia_Remision VALUES (22,22);
INSERT INTO Cuerpo_Guia_Remision VALUES (23,23);
INSERT INTO Cuerpo_Guia_Remision VALUES (24,24);
INSERT INTO Cuerpo_Guia_Remision VALUES (25,25);
INSERT INTO Cuerpo_Guia_Remision VALUES (26,26);
INSERT INTO Cuerpo_Guia_Remision VALUES (27,27);
INSERT INTO Cuerpo_Guia_Remision VALUES (28,28);
INSERT INTO Cuerpo_Guia_Remision VALUES (29,29);
INSERT INTO Cuerpo_Guia_Remision VALUES (30,30);
INSERT INTO Cuerpo_Guia_Remision VALUES (31,31);
INSERT INTO Cuerpo_Guia_Remision VALUES (32,32);
INSERT INTO Cuerpo_Guia_Remision VALUES (33,33);
INSERT INTO Cuerpo_Guia_Remision VALUES (34,34);
INSERT INTO Cuerpo_Guia_Remision VALUES (35,35);
INSERT INTO Cuerpo_Guia_Remision VALUES (36,36);
INSERT INTO Cuerpo_Guia_Remision VALUES (37,37);
INSERT INTO Cuerpo_Guia_Remision VALUES (38,38);
INSERT INTO Cuerpo_Guia_Remision VALUES (39,39);
INSERT INTO Cuerpo_Guia_Remision VALUES (40,40);
INSERT INTO Cuerpo_Guia_Remision VALUES (41,41);
INSERT INTO Cuerpo_Guia_Remision VALUES (42,42);
INSERT INTO Cuerpo_Guia_Remision VALUES (43,43);
INSERT INTO Cuerpo_Guia_Remision VALUES (44,44);
INSERT INTO Cuerpo_Guia_Remision VALUES (45,45);
INSERT INTO Cuerpo_Guia_Remision VALUES (46,46);
INSERT INTO Cuerpo_Guia_Remision VALUES (47,47);
INSERT INTO Cuerpo_Guia_Remision VALUES (48,48);
INSERT INTO Cuerpo_Guia_Remision VALUES (49,49);
INSERT INTO Cuerpo_Guia_Remision VALUES (50,50);
INSERT INTO Cuerpo_Guia_Remision VALUES (51,51);

/*FIN CUERPO_GUIA_REMISION*/


-- Procedimientos --------------------------------------------------------------------------

DELIMITER $
CREATE PROCEDURE sp_select_guia()
BEGIN
	Select * from Guia_de_remision;
END $

DELIMITER $
Create procedure sp_select_remitente()
begin
	SELECT * FROM Remitente;
end$

DELIMITER $
Create procedure sp_select_destinatario()
begin
	SELECT * FROM Destinatario;
end$


DELIMITER $
Create Procedure sp_select_encomienda()
begin 
  SELECT * FROM Encomienda;
end $

DELIMITER $
Create Procedure sp_select_vehiculo()
begin 
  SELECT * FROM Vehiculo;
end $

-- Guia de Remision --------------------------------------------------------------------------

DELIMITER $
CREATE PROCEDURE sp_insert_guia_rem
	(in 
		_Placa VARCHAR(7),
    _Licencia CHAR(9),
    _CodigoRem CHAR(11),
    _CodigoDest CHAR(11),
    _CodigoEnc INT,
    _CodigoRuta INT,
    _CodigoFlete INT,
    _DepartamentoSalida CHAR(15),
    _ProvinciaSalida CHAR(15),
    _DistritoSalida CHAR(15),
    _DomicilioSalida CHAR(20),
    _DepartamentoLlegada CHAR(15),
    _ProvinciaLlegada CHAR(15),
    _DistritoLlegada CHAR(15),
    _DomicilioLlegada CHAR(20),
    _ValorFlete FLOAT)
BEGIN
	INSERT INTO guia_de_remision (placa,licencia,codigo_rem,codigo_dest,codigo_enc,codigo_ruta,codigo_flete,departamento_salida,provincia_salida,distrito_salida,domicilio_salida,departamento_llegada,provincia_llegada,distrito_llegada,domicilio_llegada,valor_flete)
	VALUES (_Placa,_Licencia,_CodigoRem,_CodigoDest,_CodigoEnc,_CodigoRuta,_CodigoFlete,_DepartamentoSalida,_ProvinciaSalida,_DistritoSalida,_DomicilioSalida,_DepartamentoLlegada,_ProvinciaLlegada,_DistritoLlegada,_DomicilioLlegada,_ValorFlete);
END $



DELIMITER $
CREATE PROCEDURE sp_update_guia_rem
	(
		in _nGuiaRem INT,
		in _Placa VARCHAR(7),
		in _Licencia CHAR(9),
        in _CodigoRem CHAR(11),
        in _CodigoDest CHAR(11),
        in _CodigoEnc INT,
        in _CodigoRuta INT,
        in _CodigoFlete INT,
        in _DepartamentoSalida CHAR(15),
        in _ProvinciaSalida CHAR(15),
        in _DistritoSalida CHAR(15),
        in _DomicilioSalida CHAR(20),
        in _DepartamentoLlegada CHAR(15),
        in _ProvinciaLlegada CHAR(15),
        in _DistritoLlegada CHAR(15),
        in _DomicilioLlegada CHAR(20),
        in _ValorFlete FLOAT
	)
BEGIN
	UPDATE guia_de_remision
    SET placa = _Placa,
		licencia = _Licencia,
        codigo_rem = _CodigoRem,
        codigo_dest = _CodigoDest,
        codigo_enc = _CodigoEnc,
        codigo_ruta = _CodigoRuta,
        codigo_flete = _CodigoFlete,
        departamento_salida = _DepartamentoSalida,
        provincia_salida = _ProvinciaSalida,
        distrito_salida = _DistritoSalida,
        domicilio_salida = _DomicilioSalida,
        departamento_llegada = _DepartamentoLlegada,
        provincia_llegada = _ProvinciaLlegada,
        distrito_llegada = _DistritoLlegada,
        domicilio_llegada = _DomicilioLlegada,
        valor_flete = _ValorFlete,
        nro_guia_remision = _nGuiaRem
	WHERE nro_guia_remision = _nGuiaRem;
END $


DELIMITER $
CREATE PROCEDURE sp_delete_guia_rem
	(
		in nGuiaRem INT
    )
BEGIN
  DELETE FROM cuerpo_guia_remision WHERE nro_guia_remision = nGuiaRem;
	DELETE FROM guia_de_remision WHERE nro_guia_remision = nGuiaRem;
END $











-- DESTINATARIO --------------------------------------------------------------------------

DELIMITER $
CREATE PROCEDURE sp_insert_destinatario
	(in 
		_Codigo char(11), 
        _Nombre varchar(30), 
        _Telf char(9)
	)
BEGIN
	INSERT INTO Destinatario VALUES (_Codigo, _Nombre, _Telf);
    IF char_length(_Codigo) = 8 THEN 
		INSERT INTO Tipo_Destinatario VALUES (_Codigo, 'DNI'); 
	ELSEIF char_length(_Codigo) = 11 then 
		INSERT INTO Tipo_Destinatario VALUES (_Codigo, 'RUC'); 
	END IF;
END $


DELIMITER $
CREATE PROCEDURE sp_update_destinatario
	(in 
		_Codigo_dest char(11), 
        _Nombre_dest varchar(30), 
        _Telf_dest char(9)
	)
BEGIN
	UPDATE Destinatario
    SET 
		codigo_dest = _Codigo_dest,
        nombre_dest = _Nombre_dest,
        telf_dest = _Telf_dest
        WHERE codigo_dest = _Codigo_dest;
END $

DELIMITER $
CREATE PROCEDURE sp_delete_destinatario
	(
		in _Codigo_dest CHAR(11)
    )
BEGIN
	DELETE FROM Destinatario WHERE codigo_dest = _Codigo_dest;
END $




-- REMITENTE --------------------------------------------------------------------------
DROP PROCEDURE sp_insert_remitente;
DELIMITER $
CREATE PROCEDURE sp_insert_remitente
	(in 
		_Codigo char(11), 
        _Nombre varchar(30), 
        _Telf char(9)
	)
BEGIN
	INSERT INTO Remitente VALUES (_Codigo, _Nombre, _Telf);
    IF char_length(_Codigo) = 8 THEN 
		INSERT INTO tipo_remitente VALUES (_Codigo, 'DNI'); 
	ELSEIF char_length(_Codigo) = 11 THEN 
		INSERT INTO tipo_remitente VALUES (_Codigo, 'RUC'); 
	END IF;
END $

DELIMITER $
CREATE PROCEDURE sp_update_remitente
	(in 
		_Codigo_rem char(11), 
        _Nombre_rem varchar(30), 
        _Telf_rem char(9)
	)
BEGIN
	UPDATE Remitente
    SET 
		codigo_rem = _Codigo_rem,
        nombre_rem = _Nombre_rem,
        telf_rem = _Telf_rem
        WHERE codigo_rem = _Codigo_rem;
END $

DROP PROCEDURE sp_delete_remitente
DELIMITER $
CREATE PROCEDURE sp_delete_remitente
	(
		in _Codigo_rem CHAR(11)
    )
BEGIN
  delete from Guia_de_remision where codigo_rem= _Codigo_rem;
	delete from Tipo_Remitente where codigo_rem= _Codigo_rem;
	DELETE FROM Remitente WHERE codigo_rem = _Codigo_rem;

END $

-- ENCOMIENDA --------------------------------------------------------------------------


DELIMITER $
CREATE PROCEDURE sp_insert_enc
	(in
        descripcion VARCHAR(45),
		cantidad INT,
		unidad_medida CHAR(15),
		peso FLOAT,
		unidad_peso CHAR(15),
		codigo_dest CHAR(11),
		codigo_rem CHAR(11),
		codigo_ruta INT 
    )
BEGIN
	INSERT INTO Encomienda(descripcion,cantidad,unidad_medida,peso,unidad_peso,codigo_dest,codigo_rem,codigo_ruta)
    VALUES (descripcion,cantidad,unidad_medida,peso,unidad_peso,codigo_dest,codigo_rem,codigo_ruta);
END $


DELIMITER $
CREATE PROCEDURE sp_update_enc
	(
		in codigoEnc INT,
        in Descripcion VARCHAR(45),
		in Cantidad INT,
		in unidadMedida CHAR(15),
		in Peso FLOAT,
		in unidadPeso CHAR(15),
		in codigoDest CHAR(11),
		in codigoRem CHAR(11),
		in codigoRuta INT 
    )
BEGIN
	UPDATE Encomienda 
    SET descripcion = Descripcion,
		cantidad = Cantidad,
        unidad_medida = unidadMedida,
        peso = Peso,
        unidad_peso = unidadPeso,
        codigo_dest = codigoDest,
        codigo_rem = codigoRem,
        codigo_ruta = codigoRuta
		
	WHERE codigo_enc = codigoEnc;
END $

select*from encomienda

DELIMITER $
CREATE PROCEDURE sp_delete_enc
	(
		in codigoEnc INT
    )
BEGIN
	DELETE FROM Encomienda WHERE codigo_enc = codigoEnc;
END $




-- VEHICULO --------------------------------------------------------------------------

DROP PROCEDURE sp_insert_vehiculo;
DELIMITER $
CREATE PROCEDURE sp_insert_vehiculo
	(in 
		_Placa VARCHAR(7), 
		_Certificado CHAR(8), 
		_Conf_vehicular CHAR(3), 	
        _Marca VARCHAR(20)
	)
BEGIN
	INSERT INTO Vehiculo VALUES (_Placa, _Certificado, _Conf_vehicular, _Marca);
END $


DELIMITER $
CREATE PROCEDURE sp_update_vehiculo
	(in 
		_Placa VARCHAR(7), 
		_Certificado CHAR(8), 
		_Conf_vehicular CHAR(3), 	
        _Marca VARCHAR(20)
	)
BEGIN
	UPDATE Vehiculo
    SET 
		placa = _Placa,
        certificado = _Certificado,
        conf_vehicular = _Conf_vehicular,
        marca = _Marca
        WHERE placa = _Placa;
END $


DELIMITER $
CREATE PROCEDURE sp_delete_vehiculo
	(
		in _Placa CHAR(11)
    )
BEGIN
	DELETE FROM Vehiculo WHERE placa = _Placa;
END $

CALL sp_delete_vehiculo('D3H-387');
SELECT * FROM Vehiculo;

-- 10 PROCEDIMIENTOS / CONSULTAS

-- -------------------------------------------------------------------------------------------------
-- CONSULTA 1
-- -------------------------------------------------------------------------------------------------
delimiter //
create procedure sp_lista_guia_remision_codigos_filtro_ruta()
begin
    SELECT Guia_de_remision.nro_guia_remision AS 'Códigos de guía de remisión'
FROM Ruta INNER JOIN Guia_de_remision 
ON Ruta.codigo_ruta = Guia_de_remision.codigo_ruta 
WHERE nombre_ruta = 'Arequipa-Tacna' AND fecha_salida = '2022-01-12' AND hora_salida = '19:30';

end//


-- -------------------------------------------------------------------------------------------------
-- CONSULTA 2
-- -------------------------------------------------------------------------------------------------
delimiter //
create procedure sp_lista_guia_remision_filtro_remitente()
begin
    SELECT guia.nro_guia_remision, enc.descripcion, rt.fecha_salida
FROM Guia_de_remision guia INNER JOIN Encomienda enc
ON guia.codigo_enc = enc.codigo_enc
INNER JOIN Remitente rem
ON rem.codigo_rem = guia.codigo_rem
INNER JOIN Ruta rt
ON rt.codigo_ruta = guia.codigo_ruta 
WHERE rem.nombre_rem = 'Alkofarma E.I.RL';

end//



-- -------------------------------------------------------------------------------------------------
-- CONSULTA 3
-- -------------------------------------------------------------------------------------------------
delimiter //
create procedure sp_lista_guia_remision_remitente_destinatario_filtro_ruta()
begin
    SELECT enc.codigo_enc, enc.descripcion, rem.nombre_rem, rem.telf_rem,
dest.nombre_dest, dest.telf_dest
FROM Encomienda enc 
INNER JOIN Ruta rt
ON enc.codigo_ruta = rt.codigo_ruta 
INNER JOIN Remitente rem
ON rem.codigo_rem = enc.codigo_rem
INNER JOIN Destinatario dest
ON dest.codigo_dest = enc.codigo_dest
WHERE nombre_ruta = 'Arequipa-Tacna' AND fecha_salida = '2022-01-12' AND hora_salida = '19:30';

end//



-- -------------------------------------------------------------------------------------------------
-- CONSULTA 4
-- -------------------------------------------------------------------------------------------------
delimiter //
create procedure sp_total_filtro_mes()
begin
    SELECT SUM(valor_flete) AS 'Total mes Enero'
FROM Guia_de_remision 
INNER JOIN Ruta
ON Guia_de_remision.codigo_ruta = Ruta.codigo_ruta
WHERE MONTH(Ruta.fecha_salida) = '01';

end//




-- -------------------------------------------------------------------------------------------------
-- CONSULTA 5
-- -------------------------------------------------------------------------------------------------
delimiter //
Create procedure sp_lista_rutas_mas_usadas()
begin
	SELECT Ruta.nombre_ruta, count(guia.codigo_ruta) AS 'Veces usada'
FROM  Guia_de_remision guia
INNER JOIN Ruta
ON guia.codigo_ruta = Ruta.codigo_ruta
GROUP BY guia.codigo_ruta
ORDER BY count(guia.codigo_ruta) DESC LIMIT 5;

end //



-- -------------------------------------------------------------------------------------------------
-- CONSULTA 6
-- -------------------------------------------------------------------------------------------------
delimiter //
Create procedure sp_lista_rutas_menos_usadas()
begin
	SELECT Ruta.nombre_ruta, count(guia.codigo_ruta) AS 'Veces usada'
FROM  Guia_de_remision guia
INNER JOIN Ruta
ON guia.codigo_ruta = Ruta.codigo_ruta
GROUP BY guia.codigo_ruta
ORDER BY count(guia.codigo_ruta) ASC LIMIT 5;

end //



-- -------------------------------------------------------------------------------------------------
-- CONSULTA 7
-- -------------------------------------------------------------------------------------------------
delimiter //
Create procedure sp_vehiculo_filtro_conductor()
begin
	SELECT Conductor.nombre_cond, Vehiculo.placa, Vehiculo.marca
FROM Ruta INNER JOIN Vehiculo
ON Ruta.placa = Vehiculo.placa
INNER JOIN Conductor
On Conductor.licencia = Ruta.licencia
WHERE Conductor.nombre_cond = 'Elvis Hilasaca Sulla';

end //



-- -------------------------------------------------------------------------------------------------
-- CONSULTA 8
-- -------------------------------------------------------------------------------------------------
delimiter //
Create procedure sp_lista_destinatario_pagoTotal_fleteDestino_ruta()
begin
	SELECT nro_guia_remision, guia_de_remision.codigo_dest, nombre_dest, 
domicilio_llegada, valor_flete AS 'TOTAL A PAGAR (S/.)'
FROM Tipo_flete 
INNER JOIN guia_de_remision
ON guia_de_remision.codigo_flete= Tipo_flete.codigo_flete 
INNER JOIN Destinatario
ON Destinatario.codigo_dest = Guia_de_remision.codigo_dest
INNER JOIN Ruta
ON Ruta.codigo_ruta = Guia_de_remision.codigo_ruta 
WHERE Tipo_flete.tipo_flete = 'destino'
AND nombre_ruta = 'Arequipa-Tacna' AND fecha_salida = '2022-01-12' AND hora_salida = '19:30';

end //


-- -------------------------------------------------------------------------------------------------
-- CONSULTA 9
-- -------------------------------------------------------------------------------------------------
delimiter //
Create procedure sp_lista_clientes_naturales()
begin
	SELECT destinatario.nombre_dest AS 'Cliente Natural',
  destinatario.codigo_dest AS 'Numero DNI'
  FROM destinatario INNER JOIN tipo_destinatario
  ON destinatario.codigo_dest = tipo_destinatario.codigo_dest 
  WHERE tipo_destinatario.tipo_dest = 'DNI'
  UNION ALL
  SELECT remitente.nombre_rem AS 'Cliente Natural',
  remitente.codigo_rem AS 'Numero DNI'
  FROM remitente INNER JOIN tipo_remitente
  ON remitente.codigo_rem = tipo_remitente.codigo_rem
  WHERE tipo_remitente.tipo_rem = 'DNI';


end //



-- -------------------------------------------------------------------------------------------------
-- CONSULTA 10
-- -------------------------------------------------------------------------------------------------
delimiter //
Create procedure sp_lista_clientes_juridicos()
begin
	SELECT destinatario.nombre_dest AS 'Cliente Juridico',
destinatario.codigo_dest AS 'Numero RUC'
FROM destinatario INNER JOIN tipo_destinatario
ON destinatario.codigo_dest = tipo_destinatario.codigo_dest 
WHERE tipo_destinatario.tipo_dest = 'RUC'
UNION ALL
SELECT remitente.nombre_rem AS 'Cliente Juridico',
remitente.codigo_rem AS 'Numero RUC'
FROM remitente INNER JOIN tipo_remitente
ON remitente.codigo_rem = tipo_remitente.codigo_rem
WHERE tipo_remitente.tipo_rem = 'RUC';

end //




-- TRIGGERS --------------------------------------------------------------------------
delimiter //
create trigger tr_before_delete_vehiculo before delete on 
Vehiculo for each row
begin
	delete from Guia_de_remision where placa=old.placa;
	delete from Ruta where placa=old.placa;
end//


delimiter //
create trigger tr_before_delete_remitente before delete on 
Remitente for each row
begin
	delete from Guia_de_remision where codigo_rem=old.codigo_rem;
	delete from Tipo_Remitente where codigo_rem=old.codigo_rem;
end//


delimiter //
create trigger tr_before_delete_destinatario before delete on 
Destinatario for each row
begin
	delete from Guia_de_remision where codigo_dest=old.codigo_dest;
	delete from Tipo_Destinatario where codigo_dest=old.codigo_dest;
end//



delimiter //
create trigger registraInsercion after insert on Guia_de_remision
for each row 
begin
  insert into acciones(accion) 
  value (concat('Se inserto una nueva Guia de Remision. Codigo: ',NEW.nro_guia_remision));
end//

delimiter //
create trigger registraActualizacion after update on Guia_de_remision
for each row 
begin
  insert into acciones(accion) 
  value (concat('Se actualizo una Guia de Remision. Codigo: ',NEW.nro_guia_remision));
end//

delimiter //
create trigger registraEliminacion after delete on Guia_de_remision
for each row 
begin
  insert into acciones(accion) 
  value (concat('Se elimino una nueva Guia de Remision. Codigo: ',OLD.nro_guia_remision));
end//




