CREATE DATABASE `cookzilla`;
USE `cookzilla`;

CREATE TABLE IF NOT EXISTS User (
   uname varchar(40)not null,   oname varchar(40)not null,   upassword varchar(60)not null,/* need to change varchar(15)  */
   uemail varchar(100)not null,
   PRIMARY KEY(uname) , 
   UNIQUE KEY (uemail)
) ENGINE=MyISAM ;
CREATE TABLE UProfile (   uname varchar(40)not null,   profile text(150) DEFAULT NULL,   primary key (uname),   foreign key (uname) references User(uname)) ENGINE=MyISAM ;


CREATE TABLE Recipe (   rid    MEDIUMINT not null AUTO_INCREMENT,   
   uname  varchar(40),
   rtitle varchar(100)not null,
   rServNum int default null,
   rCookTime int default null,  /*for minutes*/
   rSteps  varchar(1200),
   rtime  datetime,   
   primary key (rid), 
   foreign key (uname) references User(uname)
)ENGINE=MyISAM ;

CREATE TABLE RecipeImg (
   rimId MEDIUMINT not null AUTO_INCREMENT, 
   rid int(10) not null,     RecipeImgDir varchar(100) not null, 
   primary key (rimId),   foreign key (rid) references Recipe (rid)
)ENGINE=MyISAM ;


CREATE TABLE readRecipe (   
   rid int(10) not null,     rname varchar(40) not null, 
   logtime  datetime,  
    primary key (logtime),   foreign key (rid) references Recipe (rid),   foreign key (rname) references User(uname))ENGINE=MyISAM ;

CREATE TABLE readTag (   
   tid int(10) not null,     rname varchar(40) not null, 
   logtime  datetime,  
    primary key (logtime),   foreign key (tid) references Tag (tid),   foreign key (rname) references User(uname))ENGINE=MyISAM ;

CREATE TABLE favRecipe (   
   favNum  MEDIUMINT not null AUTO_INCREMENT,  
   rid     MEDIUMINT  not null, 
   fname    varchar(40) not null,
   primary key (favNum),   
   foreign key (rid) references Recipe(rid),   
   foreign key (fname) references User(uname))ENGINE=MyISAM;

CREATE TABLE UnitConversion (   Unit   varchar(100)not null,   Amount  float not null,   UnitTrans2 varchar(100)not null,   primary key (Unit))ENGINE=MyISAM;

CREATE TABLE Ingredient (
   iid MEDIUMINT not null AUTO_INCREMENT,   rid MEDIUMINT  not null,   Iname varchar(100),   Iqty float,   Unit  varchar(100),   primary key (iid),   foreign key (rid) references Recipe(rid),   foreign key (Unit) references UnitConversion(Unit))ENGINE= MyISAM; 

CREATE TABLE RecipeAdvice (   
   adId MEDIUMINT not null AUTO_INCREMENT, 
   rid int(10) not null,     uname varchar(40) not null, 
   advice varchar(300) not null,
   atime  datetime,   
   primary key (adId),   foreign key (rid) references Recipe (rid),   foreign key (uname) references User(uname))ENGINE=MyISAM;

create table Tag ( tid  INT UNSIGNED NOT NULL AUTO_INCREMENT, tname VARCHAR(255) NOT NULL, primary key (tid),
 UNIQUE(tname));create table RecipeTag ( rid int(10) not null,  tid int(10) not null, primary key (rid,tid), foreign key (rid) references Recipe(rid), foreign key (tid) references Tag(tid)) ENGINE = MyISAM; CREATE TABLE Review ( 
   reviewID MEDIUMINT not null AUTO_INCREMENT,    rid int(10) not null,
   rrname varchar(40) not null,     reviewTitlle varchar(100) not null,      reviewText varchar(1200) not null,      rate float not null,      reviewTime datetime,      primary key (reviewID),   foreign key (rid) references Recipe(rid),      foreign key (uname) references User(uname))ENGINE = MyISAM;
create table ReviewImg ( 
   reviewImgID  MEDIUMINT not null AUTO_INCREMENT, 
   rid int(10) not null,
   uname varchar(40) not null,     ReviewImgDir varchar(100) not null, 
   primary key (reviewImgID),
   foreign key (rid) references Recipe(rid),      foreign key (uname) references User(uname))ENGINE=MyISAMCREATE TABLE CookingGroup (       gid    MEDIUMINT not null AUTO_INCREMENT,    
    gname varchar(100) not null,    gManager varchar(40) not null,
    gDesc  varchar(1200) not null,       primary key (gid),       foreign key (gManager) references User(uname))ENGINE=MyISAM;CREATE TABLE Member (   gid    MEDIUMINT not null,  
   uname    varchar(40) not null,   joinTime  datetime,      primary key (gid,uname),   
   foreign key (gid) references CookingGroup(gid),      foreign key (uname) references User(uname)) ENGINE=MyISAM;
CREATE TABLE Meeting 
   mid    MEDIUMINT not null AUTO_INCREMENT,   
   pname    varchar(40) not null,   mname  varchar(100),   
   mDesc  varchar(1250),   
   mTime  datetime,  
   mPlace  varchar(250),    primary key (mid) ,
   foreign key (pname) references User(uname) 
)ENGINE=MyISAM;CREATE TABLE holdMeeting (   gid    MEDIUMINT not null,   
   mid   MEDIUMINT not null,   primary key (gid,mid),   
   foreign key (gid) references CookingGroup(gid),      foreign key (mid) references Meeting (mid)) ENGINE=MyISAM;
CREATE TABLE JoinRSVP (   
   RSVPNum  MEDIUMINT not null AUTO_INCREMENT,  
   mid     MEDIUMINT  not null, 
   uname    varchar(40) not null,
   primary key (RSVPNum),   
   foreign key (mid) references Meeting(mid),   
   foreign key (uname) references User(uname))ENGINE=MyISAM;

CREATE TABLE MeetingReports (
   mrpID  MEDIUMINT not null AUTO_INCREMENT,     mid     MEDIUMINT  not null, 
   rpname varchar(40) not null,   report varchar(1200) default null,
   primary key (mrpID),      foreign key (mid) references Meeting (mid),
   foreign key (rpname) references User(uname))ENGINE=MyISAM;
CREATE TABLE MeetingImg (
   mIpID  MEDIUMINT not null AUTO_INCREMENT,     mid    int(10) not null,
   ipname varchar(40) not null,   IDir varchar(1200) default null,
   primary key (mIpID),  
      foreign key (ipname) references User(uname) ,   foreign key (mid) references Meeting (mid))ENGINE=MyISAM;

