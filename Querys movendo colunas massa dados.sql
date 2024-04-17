select * from aluno;
desc aluno;

show create table aluno;

CREATE TABLE `aluno` (
   `nome` varchar(25) DEFAULT NULL,
   `email` varchar(150) DEFAULT NULL,
   `sexo` char(1) DEFAULT NULL,
   `ativo_sn` int(11) DEFAULT '1',
   `cpf` varchar(14) DEFAULT NULL,
   `idaluno` int(11) NOT NULL AUTO_INCREMENT,
   `data_nascimento` date DEFAULT NULL,
   PRIMARY KEY (`idaluno`),
   UNIQUE KEY `uc_aluno_cpf` (`cpf`),
   UNIQUE KEY `uc_aluno_email` (`email`)
 ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

alter table aluno modify `idaluno` int(11) NOT NULL AUTO_INCREMENT first;

-- after
alter table aluno modify `ativo_sn` int(11) DEFAULT '1' after data_nascimento;

select * from professor;
desc professor;

INSERT INTO `professor` (`nome`,`email`) VALUES ("Leila","nascetur.ridiculus@ornare.net"),("Mark","hendrerit.Donec@cursusluctusipsum.ca");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Melodie","amet@metusfacilisis.org"),("Bernard","sit.amet@aauctor.net");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Rachel","dolor.vitae.dolor@tinciduntcongue.ca"),("Jackson","dui@orci.co.uk");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Donovan","Aenean.eget.magna@semmolestie.edu"),("Hayes","Cras.sed.leo@non.ca");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Cade","lacinia@interdum.co.uk"),("Henry","euismod@felis.edu");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Colleen","a@lectusCum.co.uk"),("Lillith","Donec.egestas.Aliquam@etlaciniavitae.com");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Thomas","Aliquam.erat.volutpat@diam.co.uk"),("Garrett","quis.tristique.ac@feugiatnonlobortis.com");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Cameron","risus.quis@etmagnis.net"),("Jeremy","Nullam@Sedpharetrafelis.org");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Halee","neque@sem.edu"),("Fleur","consequat@tempusrisusDonec.net");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Jana","dis.parturient.montes@sitamet.org"),("Cecilia","convallis.in.cursus@malesuada.org");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Naida","Nulla.dignissim.Maecenas@hendrerit.net"),("Tad","eu.odio@non.edu");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Gary","dolor.sit.amet@eleifendnecmalesuada.ca"),("Rooney","non@eleifendnunc.edu");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Adena","aliquam.iaculis.lacus@sit.org"),("Ahmed","Cras.pellentesque@ut.org");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Griffin","feugiat@nislMaecenasmalesuada.ca"),("Leroy","at.augue.id@Donecconsectetuer.edu");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Haley","egestas@eratinconsectetuer.ca"),("Ashely","accumsan.convallis@eleifend.edu");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Nola","parturient@cursusvestibulum.co.uk"),("Michelle","tempor.lorem.eget@Crasdictum.ca");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Leroy","Donec@aliquetsem.co.uk"),("Sheila","mollis.dui@vitae.co.uk");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Melvin","Fusce.dolor@blandit.co.uk"),("Megan","et.tristique@ridiculusmusProin.org");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Haley","ipsum.Suspendisse.non@magnatellusfaucibus.edu"),("Callie","tempus.risus@montes.co.uk");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Nathan","Aliquam.ultrices.iaculis@fringilla.net"),("Karleigh","a.tortor.Nunc@Nullamutnisi.co.uk");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Danielle","imperdiet@egestas.org"),("Lee","Quisque.fringilla@lorem.edu");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Vaughan","elit.pellentesque.a@accumsan.ca"),("Noble","adipiscing.Mauris@nuncac.co.uk");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Ella","et.commodo.at@necligula.org"),("Axel","ante.Vivamus.non@duiquis.co.uk");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Shad","Pellentesque.habitant.morbi@tincidunt.ca"),("Drew","magna@Mauris.co.uk");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Gavin","semper@luctuset.co.uk"),("Shoshana","interdum@quamdignissim.net");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Minerva","facilisis@elit.com"),("Uta","sit@Crasdolor.com");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Jarrod","auctor.quis.tristique@et.co.uk"),("Illana","convallis@justoPraesentluctus.edu");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Fulton","consequat@egetvarius.net"),("McKenzie","a.aliquet@Suspendisse.edu");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Madeline","a.mi.fringilla@miAliquam.org"),("Jacob","est@porttitor.org");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Kareem","mollis.non@ornarefacilisiseget.com"),("Leigh","at.auctor.ullamcorper@inaliquet.edu");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Chancellor","Vivamus.euismod.urna@ante.ca"),("Lars","mi@eratnonummyultricies.edu");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Zelenia","nec.tellus.Nunc@temporarcu.net"),("Justin","malesuada@Loremipsumdolor.edu");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Zachary","dui.Fusce@molestieorci.ca"),("Allegra","erat.Sed@NullaaliquetProin.com");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Donna","In@Nuncac.co.uk"),("Evan","a.tortor@magnaCrasconvallis.edu");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Shelly","ligula.Aenean.gravida@Nulla.org"),("Martina","Duis@velarcuCurabitur.org");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Talon","faucibus.orci@tempusnonlacinia.co.uk"),("Kyle","nec.tellus@pedeCras.net");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Hamilton","viverra.Maecenas.iaculis@lorem.co.uk"),("Christian","nonummy@vestibulumneque.com");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Jacqueline","malesuada.fames@ametdiameu.org"),("Brandon","ultrices.mauris.ipsum@euligula.ca");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Xaviera","mattis@pedeNunc.edu"),("Tamekah","tincidunt.pede@lectusante.org");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Sylvia","aliquam@nullaDonecnon.org"),("Hedley","mauris.sapien.cursus@ligulaAliquamerat.edu");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Chaney","lobortis.quam@semPellentesqueut.net"),("Armand","Ut@rutrum.org");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Giselle","eleifend@Sed.co.uk"),("Eaton","purus.gravida.sagittis@Sedmalesuada.co.uk");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Quail","ac@turpis.org"),("Cherokee","felis.purus.ac@Donecelementum.ca");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Daniel","Quisque.ornare.tortor@dolornonummy.edu"),("Francis","Proin.sed.turpis@laoreetipsumCurabitur.net");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Carolyn","Pellentesque.ultricies.dignissim@liberoet.org"),("Alma","Fusce.aliquet.magna@ridiculusmusProin.com");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Camden","ipsum.sodales.purus@hendreritidante.net"),("Pandora","Aliquam.adipiscing@Morbiaccumsanlaoreet.org");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Patricia","Fusce.diam.nunc@neque.org"),("Medge","ipsum@egetmagna.org");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Shellie","massa@consectetuercursuset.com"),("Adele","per@Fusce.net");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Russell","Integer@Suspendisse.com"),("Doris","vel.arcu@ornaresagittis.ca");
INSERT INTO `professor` (`nome`,`email`) VALUES ("Malik","Mauris.blandit.enim@Phasellus.org"),("Darius","eu@maurisanunc.net");
