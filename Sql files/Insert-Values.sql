USE MI6AgencyDB
SET DateFormat DMY


INSERT INTO AgencyChief VALUES
(1,'ACE','Anti-Terrorism',100),
(2,'XAVIER','Hitman Agency',104),
(4,'MAGNUS','Security Service',204),
(10,'X','Cyber Crime',311);


INSERT INTO FieldAgent VALUES
(32,'Jason Bourne', 80000, geography::Point(50.4974159,13.081725, 4326), 0.92, '~/fingerprints/13.jpg', 'infiltrating organisations'),
(23,'Ahmad Alkhalifa', 60000, geography::Point(36.5376013,34.711659, 4326), 0.79, '~/fingerprints/101.jpg', 'informant'),
(53,'Johnny English', 90000, geography::Point(51.218287,-2.0692717, 4326) , 0.85, '~/fingerprints/67.jpg', 'hitman'),
(40,'Jason Statham', 40000, geography::Point(40.649710, -73.553354, 4326), 0.8, '~/fingerprints/89.jpg', 'international relationships') ,
(78,'Edward Snowden', 70000, geography::Point(55.748517,37.0720855, 4326), 0.95, '~/fingerprints/12.jpg', 'hacking'),
(189,'Jacques Clouseau',65000,geography::Point(43.5066008,6.7089222,4326),0.68,'~/fingerprints/129.jpg','detective'),
(788,'Dwayne Johnson',55000,geography::Point(33.7577384,-118.0091837,4326),0.84,'~/fingerprints/440.jpg','infiltrating organisations'),
(987,'James Bond',85000,geography::Point(51.5319388,-0.6963807,4326),0.9,'~/fingerprints/490.jpg','hitman');


INSERT INTO Secretary VALUES
(100, 'Pepper Potts', 30000,'Chief Executive Officer of Stark Industries','~/fingerprints/43.jpg'),
(104, 'Denzel Washington',70000,'Secretary -Investigator','~/fingerprints/178.jpg'),
(204, 'Alex  Mahone',55000,' Secretary of Homeland Security','~/fingerprints/132.jpg'),
(222, 'Kevin Spacey',60000,'Diplomat and Political scientist','~/fingerprints/243.jpg'),
(311, 'Gottfrid Svartholm',35000,'co-owner of Pirate Bay','~/fingerprints/193.jpg'); 



INSERT INTO Mission VALUES
(234,'Assassinate  Kim Jong-un','2/2/2020',300000,'inprogr',9,144,2,104,1230),
(658,'Extract info for ISIS next attack','1/5/2017',100000,'stopped',8,180,1,100,2441),
(405,'Hack Trump s personal data','4/10/2022',400000,'inprogr',8,190,10,311,3459),
(551,'Retrieve  stolen Mona Lisa','12/12/2018',780000,'done',9,555,4,204,7890), 
(783,' Recover nuclear launch codes','15/5/2019',600000,'done',7,180,4,204,8940),
(829,'Cope with increased religious extremism','7/6/2018',500000,'inprogr',8,888,1,222,9777);

INSERT INTO Client VALUES   
(144,'Park Geun-hye'),
(180,'Donald Trump'),
(190,'Hilary Clinton'),
(655,'Francois Hollande'),
(888,'Peter Thomson');

INSERT INTO Gadget  VALUES
(43,'Beretta Bobcat 22','gun',25),
(56,'yamaha mt 07','bike',7),
(64,'audi Q7','car',15),
(72,'BMW 750i','car',16),
(85,'apple watch','gear',50),
(96,'bulletproof vest','gear',60),
(199,'Multi- Tool Pen','gear',300);

INSERT INTO  Informant VALUES
(450,'Dennis Rodman',geography::Point(40.1957386,-74.8235691, 4326),6),
(569,'Bashar Mohammad',geography::Point(36.1438198,36.2375537, 4326),9),
(738,'Usher',geography::Point(33.8107522,-84.8077468,4326),7),
(983,'Pink Panther',geography::Point(51.4628303,-0.0876827,4326),9),
(647,'Kevin Hart',geography::Point(35.9012133,-114.7352483,4326),9),
(309,'Angela Merkel',geography::Point(50.4974158,13.081728, 4326),7);


INSERT INTO Information VALUES
(1230,'Kim is flying to Sofia for diplomatic reasons',7,450),
(2441,'ISIS have announced plans for attacking Ohio',9,569),
(3459,'Trump will appear in  2017 music awards with his usb',7,738),
(7864,'La Joconde is being transferred to London',9,983),
(8940,'the buyer and the Black Badger are meeting in Boston',8,647),
(9777,'neonazis are trying to rebel',8,309);

INSERT INTO Executee VALUES
(53,234,'1/1/2017',NULL),
(23,658,'2/3/2016','12/6/2016'),
(40,405,'5/5/2016',NULL),
(189,551,'7/8/2016','11/1/2017'),
(788,783,'10/10/2014','17/6/2016'),
(987,829,'2/1/2017',NULL);

INSERT INTO Transmit VALUES
(104 ,53),
(311 ,23),
(204 ,40),
(204 ,189),
(204,788),
(222,987);
 
INSERT INTO Need VALUES
(53,43),
(53,96),
(53,72),
(23,96),
(40,56),
(189,199),
(788,72),
(987,64);

INSERT INTO Question VALUES  
(53,450),
(23,569),
(40,738),
(189,983),
(788,647),
(987,309);

INSERT INTO GiveOut VALUES
(450,1230),
(569,2441),
(738,3459),
(983,7864),
(647,8940),
(309,9777);

INSERT INTO Require VALUES
(234,43),
(234,96),
(234,72),
(658,96),
(405,56),
(551,199),
(783,72),
(829,64);