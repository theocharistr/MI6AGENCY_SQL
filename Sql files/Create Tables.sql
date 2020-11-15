USE MI6AgencyDB

CREATE TABLE AgencyChief (
	agencyChiefID	char(6) NOT NULL PRIMARY KEY,
	classifiedName varchar(30) NOT NULL UNIQUE,
	department varchar(30) NOT NULL UNIQUE,
	secretaryID char(6) NOT NULL
);

CREATE TABLE FieldAgent (
	fieldAgentID char(6) NOT NULL PRIMARY KEY,
	name varchar(30) NOT NULL,
	income money NOT NULL, 
	location geography,
	successRatio decimal(9,8) NOT NULL,
	fingerprints varchar(500) NOT NULL UNIQUE,
	speciality varchar(200),
	CONSTRAINT chk_Income CHECK (income > 0),
	CONSTRAINT chk_SuccessRatio CHECK (successRatio BETWEEN 0 AND 1)
);

CREATE TABLE Mission (
	missionID char(6) NOT NULL PRIMARY KEY,
	description varchar(400) UNIQUE,
	deadline date,
	reward money,
	status char(8) NOT NULL,
	difficulty tinyint,
	clientID char(6),
	agencyChiefID char(6),
	secretaryID char(6),
	informationID char(6),
	CONSTRAINT chk_Reward CHECK (reward >= 0),
	CONSTRAINT chk_Difficulty CHECK (difficulty BETWEEN 0 AND 10),
	CONSTRAINT chk_Status CHECK (status IN ('done', 'canceled', 'inprogr', 'stopped', 'loading'))
);

CREATE TABLE Secretary (
	secretaryID char(6) NOT NULL PRIMARY KEY,
	name varchar(30) NOT NULL,
	income money, 
	workHistory varchar(500),
	fingerprints varchar(500) NOT NULL UNIQUE,
	CONSTRAINT chk_Income2 CHECK (income > 0)
);

CREATE TABLE Gadget (
	gadgetID char(6) NOT NULL PRIMARY KEY,
	gadgetName char(50) NOT NULL UNIQUE,
	gadgetType char(50) NOT NULL,
	quantity int,
	CONSTRAINT chk_Quantity CHECK (quantity >= 0),
	CONSTRAINT chk_GadgetType CHECK (gadgetType IN ('car', 'bike', 'gun', 'ammo', 'gear'))
);

CREATE TABLE Informant (
	informantID char(6) NOT NULL PRIMARY KEY,
	name varchar(30) NOT NULL UNIQUE,
	location geography,
	trustLevel tinyint,	
	CONSTRAINT chk_TrustLevel CHECK (trustLevel BETWEEN 1 AND 10)
);

CREATE TABLE Information (
	informationID char(6) NOT NULL PRIMARY KEY,
	text varchar(500) NOT NULL,
	reliability tinyint,
	CONSTRAINT chk_Reliability CHECK (reliability BETWEEN 1 AND 10),
	informantID char(6) UNIQUE FOREIGN KEY REFERENCES Informant(informantID)
);

CREATE TABLE Client (
	clientID char(6)  NOT NULL  PRIMARY KEY,
	name varchar(30) NOT NULL UNIQUE	
);

CREATE TABLE Executee (
	fieldAgentID char(6) NOT NULL,
	missionID char(6) NOT NULL,
	fromDate date NOT NULL,
	toDate date,
	CONSTRAINT PK_Execute PRIMARY KEY (fieldAgentID, missionID),
	CONSTRAINT FK_Execute1 FOREIGN KEY (fieldAgentID) REFERENCES FieldAgent(fieldAgentID),
	CONSTRAINT FK_Execute2 FOREIGN KEY (missionID) REFERENCES  Mission(missionID)
);

CREATE TABLE Transmit (
	secretaryID char(6) NOT NULL,
	fieldAgentID char(6) NOT NULL,
	CONSTRAINT PK_Transmit PRIMARY KEY (secretaryID, fieldAgentID),
	CONSTRAINT FK_Transmit1 FOREIGN KEY (secretaryID) REFERENCES Secretary(secretaryID),
	CONSTRAINT FK_Transmit2 FOREIGN KEY (fieldAgentID) REFERENCES  FieldAgent(fieldAgentID)
);

CREATE TABLE Need (
	fieldAgentID char(6) NOT NULL,
	gadgetID char(6) NOT NULL,
	CONSTRAINT PK_Need PRIMARY KEY (fieldAgentID, gadgetID),
	CONSTRAINT FK_Need1 FOREIGN KEY (fieldAgentID) REFERENCES  FieldAgent(fieldAgentID),
	CONSTRAINT FK_Need2 FOREIGN KEY (gadgetID) REFERENCES  Gadget(gadgetID)
);

CREATE TABLE Question (
	fieldAgentID char(6) NOT NULL,
	informantID char(6) NOT NULL,
	CONSTRAINT PK_Question PRIMARY KEY (fieldAgentID, informantID),
	CONSTRAINT FK_Question1 FOREIGN KEY (fieldAgentID) REFERENCES FieldAgent(fieldAgentID),
	CONSTRAINT FK_Question2 FOREIGN KEY (informantID) REFERENCES  Informant(informantID)
);

CREATE TABLE GiveOut (
	informantID char(6) NOT NULL,
	informationID char(6) NOT NULL,
	CONSTRAINT PK_GiveOut PRIMARY KEY (informantID, informationID),
	CONSTRAINT FK_GiveOut1 FOREIGN KEY (informantID) REFERENCES Informant(informantID),
	CONSTRAINT FK_GiveOut2 FOREIGN KEY (informationID) REFERENCES  Information(informationID)
);

CREATE TABLE Require  (
	missionID char(6) NOT NULL,
	gadgetID char(6) NOT NULL,
	CONSTRAINT PK_Require PRIMARY KEY (missionID, gadgetID),
	CONSTRAINT FK_Require1 FOREIGN KEY (missionID) REFERENCES  Mission(missionID),
	CONSTRAINT FK_Require2 FOREIGN KEY (gadgetID) REFERENCES Gadget(gadgetID)
);
