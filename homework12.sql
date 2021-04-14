/*В курсовом проекте представлена модель базы данных для небольшого медициснкого центра.
 *Есть учет пациентов, запись назначений, диагнозов и результатов анализов в мед карту.
 *Реализован простой механизм хранения данных о времени приема пациентов.
 *
 *Созданы представлени таблиц для вывода пациентов, которые записаны на завтра для напоминания о приеме,
 *вывод пациентов с плохими анализами для вызова на лечение и подсчет прибыли за день с указанием доктора. 
 */

DROP DATABASE IF EXISTS med;
CREATE DATABASE med;
USE med;


DROP table if exists patients;
create table patients(
	id bigint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	firstname VARCHAR(100),
	lastname VARCHAR(100),
	email VARCHAR(100),
	phone BIGINT UNSIGNED,
	gender CHAR(1),
	birthday DATE,
	created_at DATETIME DEFAULT NOW(),
	
	INDEX idx_patients_name (firstname, lastname)
) COMMENT = 'Список пациентов';

DROP table if exists specialty;
create table specialty(
	id serial,
	description VARCHAR(100)
) COMMENT = 'Специальности врачей';

DROP table if exists doctors;
create table doctors(
	id serial,
	firstname VARCHAR(100),
	lastname VARCHAR(100),
	specialty_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (specialty_id) REFERENCES specialty(id),
	
	INDEX idx_doctors_name (firstname, lastname)
) COMMENT = 'Список докторов';

DROP table if exists specialty_doctors;
create table specialty_doctors(
	doctors_id bigint UNSIGNED NOT NULL,
	specialty_id bigint UNSIGNED NOT NULL,
	
	FOREIGN KEY (doctors_id) REFERENCES doctors(id),
	FOREIGN KEY (specialty_id) REFERENCES specialty(id)
) COMMENT = 'Соотношение врачи - специальности';

DROP table if exists diagnosis;
create table diagnosis(
	id serial,
	description VARCHAR(100)
) COMMENT = 'Список диагнозов';

DROP table if exists medical_services;
create table medical_services(
	id serial,
	price decimal(10,2),
	descripton VARCHAR(100)
) COMMENT = 'Прайс лист на услуги';

DROP table if exists test_results;
create table test_results(
	id serial,
	description VARCHAR(100),
	status ENUM('positive', 'negative', 'undefined')	
) COMMENT = 'Результаты анализов';

DROP table if exists rooms;
create table rooms(
	id serial,
	room_number bigint UNSIGNED NOT NULL,
	desccription VARCHAR(100),
	specialty_id bigint UNSIGNED NOT NULL,
	
	FOREIGN KEY (specialty_id) REFERENCES specialty(id)
) COMMENT = 'Список кабинетов для приема';

DROP table if exists visits;
create table visits(
	id serial,
	appointment_time DATETIME DEFAULT NOW(),
	patients_id bigint UNSIGNED NOT NULL,
	doctors_id bigint UNSIGNED NOT NULL,
	medical_services_id bigint UNSIGNED NOT NULL,
	rooms_id bigint UNSIGNED NOT NULL,
	
	FOREIGN KEY (patients_id) REFERENCES patients(id),
	FOREIGN KEY (doctors_id) REFERENCES doctors(id),
	FOREIGN KEY (medical_services_id) REFERENCES medical_services(id),
	FOREIGN KEY (rooms_id) REFERENCES rooms(id)
) COMMENT = 'Данные по визитам пациентов';

DROP table if exists prescriptions;
create table prescriptions(
	id serial,
	description VARCHAR(100)
) COMMENT = 'Назначения врачей';

DROP table if exists medical_card;
create table medical_card(
	id serial,
	visit_id bigint UNSIGNED NOT NULL,
	patients_id bigint UNSIGNED NOT NULL,
	diagnosis_id bigint UNSIGNED NOT NULL,
	prescription_id bigint UNSIGNED NOT NULL,
	test_results_id bigint UNSIGNED NOT NULL,
	
	FOREIGN KEY (patients_id) REFERENCES patients(id),
	FOREIGN KEY (diagnosis_id) REFERENCES diagnosis(id),
	FOREIGN KEY (prescription_id) REFERENCES prescriptions(id),
	FOREIGN KEY (test_results_id) REFERENCES test_results(id)
) COMMENT = 'Медицинские карты пациентов';

INSERT INTO `patients` (`firstname`,`lastname`,`email`,`phone`,`gender`,`birthday`,`created_at`) VALUES ("Matthew","Stafford","libero@vulputatelacusCras.com","79243754806","M","2007-06-30","2010-08-05 08:23:02"),("Carter","Hays","rhoncus@malesuadaut.co.uk","79996982223","M","1984-10-02","2014-08-25 21:07:18"),("Walter","Barrett","morbi.tristique@lobortismauris.ca","79569578396","M","1988-09-13","2010-11-08 23:51:17"),("Kenyon","Yang","posuere.at.velit@perconubia.org","79227121555","F","2001-03-04","2014-11-30 22:11:15"),("Chelsea","Leon","ornare@neceuismodin.com","79757661175","M","1971-06-05","2018-12-29 14:21:16"),("Yvette","Dennis","diam.Duis@ultricesposuere.net","79292199258","M","1952-03-22","2018-04-03 16:30:24"),("Hayden","Jackson","mi.enim@duinectempus.com","79933792213","F","1980-06-13","2021-11-08 07:32:51"),("Karleigh","Kidd","hendrerit@mauris.org","79997899610","F","1954-05-16","2018-09-13 16:51:25"),("Brady","Maldonado","tristique.neque@lorem.net","79751882488","F","1972-07-31","2016-05-19 09:53:40"),("Isadora","Kline","mauris@Curabituregestasnunc.ca","79998960053","F","1954-07-04","2014-11-29 21:02:31"),("Ori","Perkins","Nunc.mauris.sapien@vulputate.co.uk","79626313349","M","1973-08-02","2022-02-18 19:56:28"),("Teagan","Frost","magnis.dis.parturient@Praesentinterdumligula.co.uk","79525930552","M","1966-09-19","2016-07-13 05:19:19"),("Axel","Stuart","ullamcorper@malesuadaiderat.org","79869915981","M","1973-02-19","2022-03-31 20:36:41"),("Isaac","Welch","a.malesuada@Etiam.com","79200035358","F","1992-08-11","2018-01-23 00:16:52"),("Chelsea","Holloway","Phasellus.elit.pede@ultriciesligulaNullam.com","79957931391","M","1953-05-07","2019-08-16 16:32:26"),("Desiree","Weber","ligula.Donec.luctus@non.ca","79420731107","F","2015-09-06","2021-11-11 12:06:49"),("Michael","Dean","molestie.arcu@fringillapurus.edu","79427751399","M","1981-10-09","2017-11-26 12:14:37"),("Alfonso","Salazar","Aliquam.fringilla@justoeu.edu","79424412894","M","1981-10-31","2021-05-08 22:51:02"),("Channing","Lindsay","amet.consectetuer.adipiscing@eusemPellentesque.org","79060357084","M","1979-04-19","2021-12-23 01:04:35"),("May","Morin","dis@malesuadaaugue.com","79697556106","M","1975-10-17","2015-03-28 05:37:10"),("Quinlan","Floyd","dis@tellusAeneanegestas.com","79144495644","F","2004-12-21","2019-09-05 18:57:25"),("Thaddeus","Cline","at.pede.Cras@nislsem.org","79523877884","M","1951-12-12","2010-12-16 22:56:23"),("Orli","Sullivan","neque.venenatis.lacus@rutrum.edu","79337664466","M","1972-05-12","2013-07-31 13:24:59"),("Gloria","Orr","mattis.Cras.eget@vitae.edu","79530195687","F","2014-03-27","2010-04-14 13:43:58"),("Eagan","Kline","Pellentesque@tinciduntvehicula.ca","79410157770","M","2016-08-28","2013-03-16 13:27:17"),("Hall","Carpenter","quam.elementum.at@Namligulaelit.co.uk","79636748617","M","1972-09-03","2020-08-04 15:40:37"),("Wade","Burt","aliquam.eu.accumsan@tempusmauris.org","79445449446","F","2000-04-20","2014-09-14 12:49:08"),("Akeem","Lamb","neque@Crasdictum.co.uk","79325694086","M","2011-03-23","2011-03-24 18:35:21"),("Dennis","Allison","nisl.elementum.purus@anteipsum.co.uk","79951402230","M","1976-04-09","2014-03-03 19:29:46"),("Tiger","Mcdonald","urna@natoque.edu","79776029968","F","1996-04-21","2010-07-20 11:59:44"),("Xerxes","Boone","tincidunt.congue@neque.ca","79235707311","M","2010-07-03","2018-11-19 23:22:43"),("Charity","Albert","Nunc.sollicitudin@commodoauctorvelit.net","79991271968","F","2009-01-31","2010-09-11 22:10:31"),("Xanthus","Hester","magna.Suspendisse.tristique@semNullainterdum.co.uk","79277314354","F","1968-02-27","2021-04-28 12:47:52"),("Connor","Walter","Suspendisse.sagittis@Phasellusdolorelit.com","79852387394","F","2008-09-26","2021-03-01 10:21:03"),("Adele","Mccarthy","id.ante@erat.edu","79382734993","M","2004-01-07","2018-08-26 17:03:52"),("Scarlett","Schwartz","in.lobortis@lectuspede.edu","79849176201","M","2018-06-15","2013-09-24 08:20:08"),("Wang","Summers","magna.Ut@mattisInteger.org","79095137434","F","2005-02-24","2013-10-17 11:47:34"),("Thaddeus","Hopkins","suscipit.est.ac@dictum.net","79614250465","F","1957-02-27","2015-01-12 07:35:05"),("Michael","Graves","sollicitudin@Crasdolor.edu","79496441768","M","1961-05-12","2022-03-04 00:59:47"),("Mallory","Gamble","Donec.est.mauris@posuereenim.org","79501176793","M","1964-07-06","2017-06-10 22:26:17"),("Jaden","Howe","lacus.Quisque.purus@aptenttacitisociosqu.net","79744559024","F","2018-04-20","2010-12-07 02:46:49"),("Ira","Roberson","in@aceleifend.edu","79131412091","M","1971-06-25","2010-07-09 20:37:37"),("Keiko","Mcdowell","Donec.felis@massanonante.co.uk","79650252404","F","1981-12-21","2020-06-25 14:04:12"),("Noelle","Vargas","natoque.penatibus.et@ipsumdolor.net","79784408972","F","1988-07-10","2020-11-17 18:33:30"),("Hillary","Holloway","vel.sapien.imperdiet@accumsan.org","79428058948","F","1993-08-07","2015-09-15 14:10:12"),("Evan","Rocha","lectus.Nullam@interdum.net","79970142234","F","2011-01-01","2014-06-05 09:16:30"),("Flavia","Kerr","sed.turpis@ipsum.org","79111993953","M","1979-03-11","2017-01-14 02:28:43"),("Gabriel","Sullivan","dui.nec@libero.ca","79462166333","M","1980-02-01","2016-11-12 09:28:13"),("Imani","Livingston","metus.vitae@leoVivamusnibh.co.uk","79504417557","M","1962-01-14","2014-12-10 15:00:50"),("Lucian","Wooten","Pellentesque.ultricies.dignissim@morbitristique.ca","79654624286","F","1961-03-26","2012-02-27 22:45:42"),("John","Wallace","purus@mauris.co.uk","79056555394","F","1989-03-23","2015-02-21 17:35:39"),("Uta","Yang","dapibus.quam.quis@id.net","79891049818","F","1980-08-14","2020-01-18 02:00:30"),("Chandler","Sharpe","nisl.Quisque.fringilla@ante.edu","79939523452","F","2012-04-16","2013-01-20 09:36:23"),("Lani","Wiley","lorem.lorem@mollisDuissit.ca","79860019915","M","1962-06-18","2013-09-18 06:03:55"),("Galvin","Holland","placerat@non.ca","79882857719","F","2000-03-19","2020-07-09 00:29:05"),("Maxine","Wilkins","sem@augueutlacus.org","79799040021","F","1953-02-12","2012-12-25 06:00:07"),("Carl","Mckenzie","ut.nulla.Cras@lobortis.org","79443983648","F","1969-10-11","2016-09-23 18:59:51"),("Emerald","Mclaughlin","cubilia.Curae@Donec.com","79723063366","M","1976-12-13","2016-04-15 11:16:28"),("Desiree","Stein","Fusce.aliquam@Ut.com","79052354943","M","1987-08-06","2020-08-15 21:07:57"),("Dillon","Lynch","non.dapibus@laoreetlectusquis.com","79037778909","M","1977-01-16","2020-09-23 00:12:11"),("Warren","Mueller","Vivamus@vulputate.ca","79017186856","M","2019-12-26","2019-11-16 12:17:20"),("Zephr","Davidson","sapien.molestie.orci@bibendumDonec.edu","79626940404","F","1998-08-14","2015-06-10 17:28:14"),("Dante","Robles","Duis.a@sitametdapibus.ca","79965487179","M","2021-06-19","2020-06-21 15:55:52"),("Keely","Estes","imperdiet.nec@Aliquamultricesiaculis.edu","79060659697","M","2017-09-16","2014-12-22 23:38:23"),("Chadwick","Cameron","Nullam.feugiat@aarcu.org","79615000909","F","2007-12-29","2020-02-25 19:27:44"),("Reese","Moreno","eleifend.Cras.sed@Sed.edu","79898870004","M","1965-05-31","2018-04-10 07:32:36"),("Piper","Mcconnell","sed@ornareliberoat.ca","79128749676","M","1969-04-25","2015-04-24 01:51:51"),("Cain","Lane","at.pretium@temporest.co.uk","79194825034","M","1983-09-08","2015-08-25 21:36:15"),("Megan","Gray","Aliquam.fringilla@Fuscefermentumfermentum.net","79814673896","M","2012-12-23","2012-06-06 13:06:16"),("Mercedes","Fuller","lobortis.mauris@augueeu.com","79018860708","M","1997-07-24","2021-02-03 03:12:15"),("Montana","Reynolds","Cras@mi.net","79066491243","F","1968-11-19","2011-09-09 11:20:44"),("Tiger","Robles","posuere.at.velit@justo.co.uk","79980929365","F","1961-02-12","2017-11-12 02:46:39"),("Felicia","Mccarthy","non.dapibus.rutrum@massaQuisque.com","79782077461","F","2016-11-21","2014-01-14 10:31:35"),("Odette","Forbes","posuere.vulputate@Etiam.ca","79510472963","M","2018-10-27","2014-02-05 11:26:11"),("Naomi","Cabrera","sem@orcitincidunt.com","79019476703","M","1967-12-10","2016-02-09 04:26:47"),("Garrison","Mueller","luctus@lobortisaugue.org","79861149658","F","1968-01-30","2012-03-03 17:14:40"),("Melodie","Blackwell","ac.libero.nec@utquamvel.co.uk","79666380762","M","1987-04-20","2018-10-04 09:28:38"),("Len","English","Suspendisse@etmagnisdis.net","79996902463","F","1997-11-17","2014-08-13 07:45:11"),("Cade","Rocha","pharetra.Nam.ac@risusquis.ca","79130930310","M","1993-02-07","2019-10-02 08:18:59"),("Bo","Sweet","dictum@tortordictum.net","79533234588","F","1977-11-26","2020-12-18 02:08:10"),("Mohammad","Park","sit.amet.nulla@natoquepenatibuset.ca","79942504498","M","2018-02-25","2018-04-02 12:41:21"),("Ivor","Curtis","neque.tellus.imperdiet@orci.net","79797883763","M","1980-11-07","2019-11-15 11:26:11"),("Upton","Cotton","et.euismod@accumsaninterdum.com","79353954805","F","1995-12-06","2010-03-11 04:31:25"),("Garrett","Strong","ornare@aliquetlobortisnisi.com","79246592398","F","1975-01-25","2011-03-20 18:25:20"),("Laith","White","quis@quis.org","79860301224","F","1978-11-07","2020-09-20 19:12:42"),("Calista","Mendoza","commodo.tincidunt@Donecegestas.edu","79140261525","M","1980-06-26","2016-12-12 10:07:52"),("Charles","Phillips","magna.sed.dui@primisin.edu","79000655545","M","1999-09-23","2013-02-21 12:57:11"),("Lev","Bryan","amet.nulla@justositamet.org","79575163970","F","1958-04-28","2020-11-09 20:28:06"),("Connor","Terrell","aliquet.nec.imperdiet@scelerisquescelerisque.com","79175153789","F","1968-03-03","2015-11-08 17:05:04"),("Brittany","Mills","ipsum.dolor@congueIn.com","79905809382","F","1975-07-26","2017-11-20 09:36:41"),("Abel","Moreno","imperdiet.erat.nonummy@ami.net","79851981238","F","2001-10-02","2012-07-18 14:18:19"),("Wade","Sanders","nec@egetodio.com","79657719526","M","1957-11-04","2011-11-02 05:33:19"),("Buckminster","Joyner","lorem@inceptoshymenaeosMauris.com","79274460158","M","1983-11-20","2013-01-07 18:43:05"),("Chandler","Vargas","ornare.lectus@orciquis.ca","79820743002","F","1996-07-18","2022-01-31 12:00:38"),("Aaron","Tillman","Nunc.pulvinar.arcu@Donec.net","79057631132","M","1958-05-31","2013-10-26 18:36:31"),("Aiko","Perkins","lectus.convallis@ataugue.com","79945408085","M","1955-09-10","2011-10-07 10:55:09"),("Karen","Powers","a@at.co.uk","79412781271","F","1954-08-19","2010-08-31 06:47:10"),("Octavius","Estrada","Curae@sociisnatoque.org","79174673567","M","1961-10-03","2010-05-01 00:43:54"),("Howard","Barnes","In@CuraePhasellus.ca","79406785927","F","2019-01-07","2016-10-18 11:06:19"),("Orson","Donovan","semper.rutrum@consectetuer.edu","79203968171","M","1995-10-12","2012-09-26 08:59:13");

INSERT INTO `specialty` (`description`) VALUES ("Anesthesiologists"), ("Cardiologists"), ("Surgeons"), ("Dermatologists"), ("Endocrinologists"), ("Gastroenterologists"), ("Nephrologists"), ("Oncologists"), ("Ophthalmologists"), ("Pediatricians"), ("Radiologists"), ("Psychiatrists"), ("Otolaryngologists");

INSERT INTO `doctors` (`firstname`, `lastname`, `specialty_id`) VALUES ("Simon","Schwartz",5),("Theodore","Schroeder",8),("Davis","Moon",7),("Kessie","Jimenez",3),("Alea","Grant",2),("Lesley","Ruiz",5),("Noel","Sampson",3),("Dieter","Sargent",8),("Demetria","Ochoa",11),("Keegan","Morgan",8),("Abel","Taylor",2),("Camille","Compton",9),("Leroy","Whitfield",10),("Germane","Stuart",1),("Cole","Mcclure",13),("Xandra","Nielsen",6),("Clinton","Oneil",10),("Burton","Hampton",13),("Hannah","Castaneda",10),("Carolyn","Cain",7),("Cleo","Ramos",8),("Rhiannon","Fleming",1),("Virginia","Harrington",6),("Lacota","Cooper",4),("Blossom","Everett",4),("Adele","Spears",4),("Roth","Griffin",10),("Isaiah","Rollins",7),("Ori","Bauer",11),("Amir","Acosta",4),("Oscar","Shepherd",4),("Julian","Barnes",12),("Matthew","Mason",11),("Kendall","Oliver",1),("Dominique","Jenkins",6),("Donovan","Cain",6),("Dalton","Galloway",7),("Samson","Glass",11),("Richard","Cooley",12),("Baxter","Harrison",11),("Lars","Shaw",3),("Florence","Farrell",9),("Kirk","William",1),("Nissim","Parks",9),("Hayden","Jackson",2),("Cassady","Sanford",11),("Scarlet","Jefferson",4),("Cadman","Murray",5),("Travis","Estrada",10),("Gretchen","Powers",4);

INSERT INTO `specialty_doctors` (`specialty_id`, `doctors_id`) VALUES (11,30),(8,5),(5,11),(2,9),(3,17),(13,11),(6,37),(3,19),(7,10),(10,19),(11,6),(2,20),(10,19),(5,30),(2,40),(4,13),(8,5),(7,31),(9,40),(10,17),(3,15),(2,41),(10,29),(1,4),(3,42),(8,5),(12,11),(2,35),(5,35),(4,4),(13,47),(10,16),(7,28),(4,31),(8,33),(2,48),(6,43),(13,47),(6,21),(7,21),(6,20),(9,48),(12,10),(6,48),(10,41),(12,11),(8,25),(5,20),(5,34),(2,24),(5,12),(1,30),(13,28),(1,7),(7,32),(1,48),(9,30),(5,48),(11,36),(2,9),(8,1),(8,42),(2,22),(7,38),(7,21),(6,49),(2,7),(12,44),(3,33),(5,40),(2,49),(10,45),(10,11),(8,23),(11,13),(3,45),(6,38),(9,14),(6,33),(6,40),(1,2),(12,13),(12,24),(11,5),(10,32),(4,5),(12,38),(13,26),(10,13),(1,11),(10,2),(4,10),(8,47),(6,36),(10,39),(2,2),(4,2),(9,20),(2,40),(11,27);

INSERT INTO `diagnosis` (`description`) VALUES ("nibh. Phasellus"),("ac facilisis"),("velit. Cras"),("ut eros"),("neque venenatis"),("amet, consectetuer"),("semper pretium"),("lobortis quis,"),("magna a"),("mauris. Suspendisse"),("semper. Nam"),("Proin velit."),("amet ante."),("lectus, a"),("Mauris blandit"),("parturient montes,"),("nisi. Cum"),("purus. Maecenas"),("neque vitae"),("turpis non"),("semper tellus"),("tellus. Nunc"),("mi. Duis"),("id, erat."),("Aliquam nisl."),("amet, dapibus"),("vulputate, lacus."),("porttitor scelerisque"),("facilisis. Suspendisse"),("tortor. Integer"),("eu, odio."),("ultrices a,"),("egestas lacinia."),("semper et,"),("nisl. Maecenas"),("Nullam velit"),("magna. Praesent"),("Morbi sit"),("mauris, aliquam"),("placerat, augue."),("commodo auctor"),("habitant morbi"),("iaculis quis,"),("blandit at,"),("nibh. Aliquam"),("mi lacinia"),("fringilla ornare"),("Vestibulum ut"),("tempor, est"),("Suspendisse aliquet,");

INSERT INTO `medical_services` (`price`, `descripton`) VALUES (96.55,"nisi a odio"),(44.86,"risus. Duis a"),(63.46,"metus. Aenean sed"),(63.59,"ridiculus mus. Proin"),(24.94,"odio. Nam interdum"),(26.27,"convallis est, vitae"),(32.91,"facilisi. Sed neque."),(26.36,"Cras dictum ultricies"),(84.16,"ornare, facilisis eget,"),(76.83,"erat vel pede"),(14.46,"Quisque nonummy ipsum"),(16.34,"arcu vel quam"),(85.79,"orci, adipiscing non,"),(85.46,"risus varius orci,"),(46.01,"in faucibus orci"),(62.11,"felis. Donec tempor,"),(90.43,"Vestibulum ante ipsum"),(64.80,"ac nulla. In"),(62.49,"placerat, orci lacus"),(29.90,"Pellentesque ultricies dignissim"),(76.92,"metus. Aenean sed"),(63.85,"ac arcu. Nunc"),(34.50,"eget lacus. Mauris"),(87.51,"Suspendisse aliquet molestie"),(97.15,"quis lectus. Nullam"),(33.83,"est mauris, rhoncus"),(36.08,"lorem ac risus."),(3.38,"ut, pharetra sed,"),(97.04,"odio, auctor vitae,"),(35.32,"dui augue eu"),(3.70,"sollicitudin a, malesuada"),(46.59,"nec, mollis vitae,"),(89.81,"dis parturient montes,"),(44.63,"Nulla eget metus"),(8.25,"molestie. Sed id"),(16.74,"enim mi tempor"),(76.10,"Curabitur vel lectus."),(3.77,"Vestibulum ante ipsum"),(71.80,"venenatis a, magna."),(72.49,"amet, consectetuer adipiscing"),(96.69,"eleifend vitae, erat."),(9.07,"vel est tempor"),(17.24,"tincidunt dui augue"),(60.90,"Nam ac nulla."),(8.88,"luctus ut, pellentesque"),(77.34,"Mauris vestibulum, neque"),(2.79,"erat. Sed nunc"),(39.36,"mollis lectus pede"),(20.05,"amet ante. Vivamus"),(92.95,"tincidunt. Donec vitae"),(18.52,"ante, iaculis nec,"),(76.98,"Aliquam ornare, libero"),(59.91,"a, arcu. Sed"),(55.25,"In at pede."),(54.43,"ac mattis velit"),(99.27,"in faucibus orci"),(87.75,"Cum sociis natoque"),(13.70,"mi eleifend egestas."),(67.36,"tellus faucibus leo,"),(66.60,"tellus faucibus leo,"),(98.44,"purus mauris a"),(90.52,"pede. Praesent eu"),(20.47,"Class aptent taciti"),(0.80,"et netus et"),(12.10,"Nulla eget metus"),(37.12,"diam luctus lobortis."),(26.16,"lobortis tellus justo"),(60.59,"vitae aliquam eros"),(92.01,"Nunc ullamcorper, velit"),(31.83,"felis ullamcorper viverra."),(22.21,"magna a tortor."),(26.12,"ac mattis velit"),(14.11,"enim, condimentum eget,"),(21.03,"tristique neque venenatis"),(88.47,"sodales at, velit."),(27.35,"mi, ac mattis"),(4.07,"eget metus. In"),(13.03,"vulputate eu, odio."),(75.85,"facilisis vitae, orci."),(15.74,"eros non enim"),(2.04,"at pretium aliquet,"),(2.17,"Morbi non sapien"),(44.30,"sapien. Aenean massa."),(52.17,"eget tincidunt dui"),(97.65,"est. Nunc ullamcorper,"),(24.43,"dignissim tempor arcu."),(18.86,"augue ut lacus."),(2.05,"accumsan sed, facilisis"),(29.23,"Nunc commodo auctor"),(23.37,"lorem ipsum sodales"),(56.07,"neque et nunc."),(18.36,"tristique pellentesque, tellus"),(87.60,"arcu eu odio"),(46.37,"Donec vitae erat"),(36.90,"Donec tempus, lorem"),(59.44,"nunc id enim."),(81.83,"eu nibh vulputate"),(84.12,"justo eu arcu."),(4.02,"Morbi neque tellus,"),(50.38,"Curabitur egestas nunc");

INSERT INTO `test_results` (`description`, `status`) VALUES ("a, magna.","positive"),("dignissim tempor","negative"),("ornare, lectus","positive"),("neque. Morbi","positive"),("fermentum convallis","undefined"),("Nunc mauris.","positive"),("eget nisi","undefined"),("non sapien","positive"),("a, malesuada","negative"),("lacus. Cras","undefined"),("ipsum dolor","positive"),("vitae purus","undefined"),("Suspendisse dui.","positive"),("mi fringilla","undefined"),("neque venenatis","undefined"),("Curabitur egestas","undefined"),("facilisis, magna","positive"),("dui nec","undefined"),("mi pede,","negative"),("libero et","negative"),("felis ullamcorper","undefined"),("cursus. Integer","negative"),("amet orci.","negative"),("sed dictum","positive"),("vestibulum lorem,","negative"),("montes, nascetur","positive"),("euismod ac,","positive"),("nunc sed","positive"),("non justo.","positive"),("neque. In","undefined"),("Sed congue,","negative"),("ultrices. Vivamus","negative"),("Fusce mollis.","negative"),("lobortis ultrices.","negative"),("tempor erat","negative"),("Cras interdum.","undefined"),("tempus mauris","negative"),("Aenean euismod","undefined"),("In condimentum.","positive"),("Nullam suscipit,","undefined"),("rhoncus. Proin","negative"),("sit amet,","negative"),("convallis, ante","undefined"),("tellus. Suspendisse","positive"),("a felis","undefined"),("adipiscing elit.","positive"),("convallis ligula.","positive"),("Fusce mollis.","undefined"),("molestie sodales.","undefined"),("rutrum, justo.","negative"),("dignissim. Maecenas","positive"),("cubilia Curae;","undefined"),("Sed id","undefined"),("libero. Integer","undefined"),("erat volutpat.","negative"),("metus. In","positive"),("est, vitae","positive"),("nunc, ullamcorper","undefined"),("nulla ante,","negative"),("Quisque purus","undefined"),("neque. In","undefined"),("dui lectus","undefined"),("porta elit,","negative"),("facilisis vitae,","negative"),("vel arcu.","positive"),("eu erat","undefined"),("Curabitur ut","undefined"),("Nam consequat","negative"),("nisl. Quisque","positive"),("lacus. Nulla","positive"),("Sed molestie.","negative"),("Cum sociis","undefined"),("Quisque imperdiet,","negative"),("vel quam","undefined"),("Mauris ut","undefined"),("neque. Sed","undefined"),("neque vitae","negative"),("nibh. Quisque","negative"),("ornare, libero","negative"),("penatibus et","positive"),("arcu. Sed","undefined"),("mauris. Morbi","negative"),("Aenean massa.","negative"),("odio. Etiam","negative"),("urna. Nullam","positive"),("sem eget","undefined"),("In tincidunt","negative"),("porta elit,","undefined"),("eleifend, nunc","positive"),("ultrices, mauris","undefined"),("Proin velit.","negative"),("Aliquam auctor,","negative"),("ipsum nunc","undefined"),("Duis a","undefined"),("non, luctus","positive"),("tellus. Aenean","positive"),("malesuada vel,","positive"),("malesuada ut,","undefined"),("non nisi.","undefined"),("arcu. Sed","undefined");

INSERT INTO `rooms` (`room_number`, `desccription`, `specialty_id`) VALUES (7,"tempor",5),(10,"sagittis",1),(8,"aliquam,",9),(9,"nisl",8),(3,"metus.",13),(10,"sem",6),(10,"natoque",5),(5,"tristique",1),(5,"nec,",9),(6,"consequat",12),(7,"Praesent",12),(6,"sed",1),(10,"congue",10),(5,"porttitor",7),(10,"Etiam",2),(6,"elit.",9),(7,"nunc,",5),(7,"et",10),(1,"Fusce",10),(7,"interdum",5),(5,"Fusce",6),(4,"enim",2),(6,"tellus.",11),(10,"ac",6),(7,"Curabitur",10),(7,"Integer",6),(7,"dui.",8),(2,"quis",5),(1,"eu",2),(8,"Nam",4);

INSERT INTO `visits` (`appointment_time`, `patients_id`, `doctors_id`, `medical_services_id`, `rooms_id`) VALUES ("2020-09-26 17:26:42",86,33,71,2),("2020-02-12 22:09:18",34,40,6,2),("2012-05-24 04:00:45",69,8,88,2),("2020-08-06 20:39:09",58,16,31,5),("2012-06-09 17:35:47",90,34,84,3),("2010-03-23 04:53:00",81,50,56,8),("2018-08-18 08:34:28",52,19,89,8),("2020-02-29 11:10:11",29,50,42,2),("2019-06-11 01:01:56",94,44,89,7),("2017-07-18 21:36:24",88,5,74,4),("2013-03-15 10:52:57",58,39,65,2),("2016-03-22 02:07:57",90,9,79,5),("2020-05-26 12:14:28",16,11,97,3),("2020-05-24 12:14:18",26,7,53,8),("2021-04-12 17:41:16",13,1,27,8),("2015-06-25 22:38:42",61,38,14,9),("2019-11-07 12:35:55",62,1,88,3),("2021-06-14 01:18:47",49,29,70,1),("2015-11-22 05:29:45",17,34,78,8),("2020-09-07 20:54:11",49,26,46,8),("2018-10-29 02:10:43",65,39,12,6),("2020-11-28 22:04:52",46,10,97,5),("2021-04-28 16:27:49",1,39,86,5),("2013-01-15 21:16:15",21,43,9,8),("2015-09-11 20:01:12",14,18,20,10),("2020-01-29 22:22:24",10,36,51,9),("2021-05-28 07:17:20",8,18,87,3),("2016-12-12 04:16:32",100,25,40,9),("2020-11-16 00:23:58",96,7,50,2),("2010-08-15 12:54:36",36,12,91,9),("2014-11-17 12:26:46",100,9,100,10),("2015-12-23 05:00:49",33,6,42,8),("2017-07-31 18:41:06",97,27,79,8),("2016-06-08 22:24:45",45,18,96,2),("2014-08-31 21:54:24",78,21,25,3),("2019-06-25 08:11:09",30,37,2,10),("2011-07-08 22:20:16",78,17,74,2),("2013-12-24 17:24:35",83,17,19,9),("2018-02-25 01:50:33",75,44,7,8),("2019-11-23 07:57:44",2,11,37,3),("2013-11-30 20:34:24",57,22,35,7),("2019-11-06 06:26:54",44,31,50,3),("2014-03-14 13:04:26",84,50,64,3),("2010-04-21 17:28:03",57,1,2,8),("2015-04-27 07:52:17",89,29,69,1),("2013-03-19 20:26:20",27,29,4,2),("2022-02-21 17:37:14",30,40,75,5),("2011-07-30 02:57:21",57,10,62,1),("2019-06-07 09:57:11",90,12,52,3),("2018-07-05 21:01:03",54,11,92,1),("2014-11-09 21:30:53",58,23,22,2),("2020-01-09 00:19:14",57,45,56,9),("2011-02-23 02:05:53",30,8,34,3),("2021-09-18 05:27:22",33,29,61,9),("2015-03-14 20:59:08",27,42,25,4),("2018-07-08 23:54:40",26,29,61,6),("2014-12-16 10:22:57",39,35,13,9),("2020-01-08 03:37:52",95,45,71,7),("2013-05-02 20:31:16",86,16,14,6),("2021-05-09 10:39:23",73,48,83,3),("2018-04-16 04:45:45",27,29,76,10),("2011-06-26 04:05:23",7,50,11,2),("2013-12-26 15:01:49",44,5,49,10),("2015-02-11 07:57:32",7,11,96,3),("2021-06-15 00:53:19",97,19,52,8),("2018-09-10 17:30:46",13,14,26,6),("2021-12-09 01:20:23",82,18,8,9),("2010-07-21 12:40:04",7,30,74,6),("2022-03-08 12:38:12",73,31,62,5),("2021-07-15 15:35:11",3,26,57,8),("2015-05-08 10:29:09",63,42,40,4),("2020-01-16 16:57:29",55,37,25,2),("2017-10-06 06:18:03",17,10,44,2),("2020-08-13 02:52:31",37,29,65,6),("2018-12-23 12:12:57",100,43,10,10),("2011-03-14 08:55:51",93,39,12,1),("2020-05-12 16:53:42",99,12,18,7),("2017-01-15 22:35:51",94,36,2,4),("2019-03-23 06:52:05",51,45,69,10),("2016-07-18 17:04:53",69,5,19,5),("2017-06-29 05:52:05",37,15,89,2),("2013-12-05 20:46:30",17,23,10,3),("2021-05-20 19:36:56",8,5,85,5),("2014-01-13 01:07:14",76,21,86,6),("2010-12-09 00:38:56",45,12,20,7),("2010-07-03 20:02:58",72,33,47,3),("2021-05-03 13:10:21",86,19,2,4),("2012-01-29 00:46:43",42,20,97,5),("2010-07-10 11:07:43",65,10,21,3),("2019-03-02 08:39:28",48,31,59,8),("2010-05-09 09:04:42",97,10,51,6),("2013-07-16 05:25:29",33,35,38,10),("2014-04-02 03:07:50",15,32,16,5),("2017-07-08 05:14:44",79,17,91,10),("2018-04-15 07:55:06",46,34,32,4),("2020-11-24 12:40:31",33,3,92,8),("2019-04-20 11:52:58",82,46,37,6),("2010-12-06 22:24:16",20,12,92,1),("2017-02-05 13:46:13",47,48,15,4),("2020-10-14 12:03:36",33,27,62,1);

INSERT INTO `prescriptions` (`description`) VALUES ("Aenean sed pede nec ante blandit viverra. Donec tempus, lorem"),("et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat,"),("felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla."),("Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor"),("mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a,"),("dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales"),("fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit."),("magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu"),("in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus"),("cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut"),("porttitor tellus non magna. Nam ligula elit, pretium et, rutrum"),("dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus"),("ut erat. Sed nunc est, mollis non, cursus non, egestas"),("Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi"),("mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam"),("eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam"),("eu tellus eu augue porttitor interdum. Sed auctor odio a"),("sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam"),("Donec feugiat metus sit amet ante. Vivamus non lorem vitae"),("Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus"),("Class aptent taciti sociosqu ad litora torquent per conubia nostra,"),("aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in"),("Fusce aliquet magna a neque. Nullam ut nisi a odio"),("dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada"),("risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non"),("enim, sit amet ornare lectus justo eu arcu. Morbi sit"),("augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed,"),("ac mattis ornare, lectus ante dictum mi, ac mattis velit"),("congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum"),("luctus sit amet, faucibus ut, nulla. Cras eu tellus eu"),("Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque"),("tempor, est ac mattis semper, dui lectus rutrum urna, nec"),("parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla"),("lectus. Cum sociis natoque penatibus et magnis dis parturient montes,"),("id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus"),("Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi"),("faucibus orci luctus et ultrices posuere cubilia Curae; Donec tincidunt."),("enim. Nunc ut erat. Sed nunc est, mollis non, cursus"),("volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean"),("amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing"),("mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a,"),("interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt"),("rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed"),("iaculis, lacus pede sagittis augue, eu tempor erat neque non"),("risus. In mi pede, nonummy ut, molestie in, tempus eu,"),("ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper"),("commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa"),("augue porttitor interdum. Sed auctor odio a purus. Duis elementum,"),("massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero."),("orci. Ut semper pretium neque. Morbi quis urna. Nunc quis"),("dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor"),("vel lectus. Cum sociis natoque penatibus et magnis dis parturient"),("sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem"),("ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus"),("ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem"),("egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est,"),("et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus."),("enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin"),("Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum"),("ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit,"),("congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit"),("et netus et malesuada fames ac turpis egestas. Fusce aliquet"),("eget mollis lectus pede et risus. Quisque libero lacus, varius"),("non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris"),("sem magna nec quam. Curabitur vel lectus. Cum sociis natoque"),("dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu"),("vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur"),("enim consequat purus. Maecenas libero est, congue a, aliquet vel,"),("nunc ac mattis ornare, lectus ante dictum mi, ac mattis"),("lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis"),("venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec"),("et ultrices posuere cubilia Curae; Phasellus ornare. Fusce mollis. Duis"),("nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam"),("sit amet, faucibus ut, nulla. Cras eu tellus eu augue"),("diam vel arcu. Curabitur ut odio vel est tempor bibendum."),("eget mollis lectus pede et risus. Quisque libero lacus, varius"),("ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet"),("felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit"),("cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum"),("dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu"),("nibh enim, gravida sit amet, dapibus id, blandit at, nisi."),("id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque"),("arcu. Vestibulum ante ipsum primis in faucibus orci luctus et"),("eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc"),("et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget"),("sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed"),("dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec,"),("ipsum primis in faucibus orci luctus et ultrices posuere cubilia"),("luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget,"),("turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus."),("eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit"),("eget varius ultrices, mauris ipsum porta elit, a feugiat tellus"),("nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse"),("Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus,"),("elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu"),("augue. Sed molestie. Sed id risus quis diam luctus lobortis."),("Phasellus at augue id ante dictum cursus. Nunc mauris elit,"),("Cum sociis natoque penatibus et magnis dis parturient montes, nascetur"),("ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula."),("erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus");

INSERT INTO `medical_card` (`visit_id`, `patients_id`, `diagnosis_id`, `prescription_id`, `test_results_id`) VALUES (109,93,40,16,23),(57,79,16,62,74),(17,68,26,84,47),(102,37,36,29,13),(36,41,13,59,46),(150,27,14,98,70),(115,70,12,83,93),(106,71,21,24,25),(143,59,1,90,86),(195,6,6,54,37),(80,33,1,34,79),(106,64,19,100,92),(122,53,35,47,67),(96,44,20,99,23),(9,43,15,14,33),(167,81,13,27,61),(29,73,11,32,4),(132,64,45,38,24),(111,3,29,13,35),(68,89,17,91,12),(166,6,31,25,78),(111,2,27,41,93),(152,16,50,89,52),(105,45,38,57,44),(16,19,33,10,82),(9,40,27,97,15),(34,58,30,50,39),(119,11,21,14,26),(156,56,41,22,100),(135,30,34,46,13),(154,100,29,15,2),(178,70,29,23,10),(3,93,4,44,52),(55,81,15,95,27),(4,71,27,52,54),(184,97,25,58,34),(176,54,35,99,100),(20,37,38,8,89),(199,56,40,1,100),(54,92,13,57,78),(111,2,40,22,76),(164,27,47,78,89),(157,63,8,57,39),(177,33,17,91,46),(85,92,11,43,11),(27,73,48,87,94),(71,39,1,12,72),(13,66,12,56,83),(129,70,16,9,30),(7,9,35,68,20),(100,1,16,99,26),(175,59,40,65,99),(186,16,41,83,12),(84,62,43,31,89),(150,69,33,76,22),(125,75,27,48,93),(21,70,3,72,30),(163,6,22,59,100),(200,68,15,5,17),(183,67,13,30,9),(37,59,6,64,6),(77,82,14,38,9),(154,98,33,26,72),(18,61,21,13,34),(7,52,8,82,99),(126,37,12,58,9),(158,59,7,99,94),(162,38,28,83,67),(172,60,4,40,28),(119,77,30,7,42),(193,5,18,77,77),(148,16,8,96,33),(121,8,20,92,18),(191,94,22,100,69),(143,38,9,54,8),(133,27,30,66,37),(155,72,5,93,85),(125,83,15,63,27),(101,32,13,4,75),(135,96,43,43,77),(17,87,33,78,7),(34,93,11,59,59),(130,81,32,53,70),(157,16,46,76,61),(136,34,8,83,91),(54,6,4,10,87),(162,64,12,10,27),(90,53,39,88,39),(102,78,50,83,85),(138,85,6,61,93),(150,20,34,31,91),(137,15,6,96,65),(49,26,48,23,85),(136,35,4,84,40),(163,6,31,93,4),(51,56,42,32,34),(46,15,47,24,52),(139,63,34,12,80),(136,82,7,60,84),(136,41,43,32,85);

CREATE or REPLACE view appointments_for_tomorrow as
select patients.firstname as patient_name, patients.lastname as patient_lastname, appointment_time, doctors.lastname as doctor, rooms.room_number from patients
join visits on patients.id = visits.patients_id
join doctors on visits.doctors_id = doctors.id
join rooms on rooms.id = visits.rooms_id 
WHERE date(appointment_time) = DATE_ADD(CURDATE(), INTERVAL 1 DAY);

CREATE or REPLACE view invite_with_bad_tests as
select patients.firstname as patient_name, patients.lastname as patient_lastname, test_results.status from patients
join medical_card on patients.id = medical_card.patients_id 
join test_results on medical_card.test_results_id = test_results.id
where test_results.status in ('positive' , 'undefined');

CREATE or REPLACE view income_per_day as
(select doctors.lastname, sum(price) as summ from medical_services
join visits on visits.medical_services_id = medical_services.id
join doctors on visits.doctors_id = doctors.id 
WHERE date(appointment_time) = CURDATE()
GROUP by doctors.lastname)
union all
(select 'total', sum(price) as su from medical_services
join visits on visits.medical_services_id = medical_services.id
join doctors on visits.doctors_id = doctors.id 
WHERE date(appointment_time) = CURDATE());


drop TRIGGER if exists check_user_age_before_insert;

DELIMITER //

CREATE TRIGGER check_user_age_before_insert BEFORE INSERT ON patients
FOR EACH ROW
begin
    IF NEW.birthday > CURRENT_DATE() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Birthday must be in the past!';
    END IF;
END//


drop TRIGGER if exists check_new_visit//

CREATE TRIGGER check_new_visit BEFORE INSERT ON visits
FOR EACH ROW
begin
    IF NEW.appointment_time > CURRENT_DATE() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Visit must be in the future!';
    END IF;
END//

drop TRIGGER if exists check_new_patient//

CREATE TRIGGER check_new_patient BEFORE INSERT ON patients
FOR EACH ROW
begin
    IF NEW.created_at > CURRENT_DATE() THEN
        SET NEW.created_at = CURRENT_DATE();
    END IF;
END//

DELIMITER ;

