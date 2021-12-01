/*** Piefit Database ***/

/********** Create Piefit Database  **********/
drop database if exists piefit;
create database piefit;
use piefit;

/********** Create tables in Piefit Database  **********/

/* Tables about user */
drop table if exists user;
create table user (
	username varchar(20) not null,
	email varchar(65) not null unique,
	password varchar(30) not null,
	role boolean not null default false,
	primary key(username),
);

drop table if exists setting;
create table setting (
	settingid serial,
	theme enum('Standard', 'Accessibility') not null default 'Standard', /* Needs Theme names */
	primary key(settingid)
);

drop table if exists personal;
create table personal (
	personalid serial,
	realname varchar(65) not null,
	gender enum('Male', 'Female', 'Non-binary', 'Other') not null,
	bio varchar(200) not null,
	primary key(personalid),
	foreign key(personalid) references user(username) on delete cascade
);

drop table if exists image;
create table image (
	imageid serial,
	image binary not null, /* Unsure about syntax for images */
	primary key(imageid),
	foreign key(imageid) references user(username) on delete cascade
);

drop table if exists payment;
create table payment (
	creditcardinfo int not null,
	cardholder varchar(65) not null,
	primary key(creditcardinfo),
	foreign key(creditcardinfo) references user(username) on delete cascade
);

/* Tables about products */
drop table if exists box;
create table box (
	boxid serial,
	edition varchar(20) not null,
	difficultylevel int not null,
	isdraft boolean not null default true,
	primary key(boxid)
);

drop table if exists collection;
create table collection (
	collectionid serial,
	musclecategory varchar(20) not null,
	difficultylevel int not null,
	isdraft boolean not null default true,
	primary key(collectionid),
	foreign key(collectionid) references box(boxid)
);

drop table if exists card;
create table card (
	cardid serial,
	hashtag varchar(20) not null unique,
	method varchar(20) not null,
	logo binary not null, /* Unsure about syntax for images */
	instagramicon binary not null, /* Unsure about syntax for images */
	exercisename not null default 'Exercises',
	worktypeheading varchar(20) not null,
	difficultyheading not null default 'Difficulty Level',
	difficultylevel int not null,
	backheading varchar(20) not null,
	backsubheading varchar(30) not null,
	isdraft boolean not null default true,
	primary key(cardid),
	foreign key(cardid) references collection(collectionid)
);

drop table if exists exercise;
create table exercise (
	exerciseid serial,
	name varchar(20) not null unique,
	description varchar(65) not null,
	difficultylevel int not null,
	video binary not null, /* Unsure about syntax for videos */
	primary key(exerciseid),
	foreign key(exerciseid) references card(cardid)
);

drop table if exists text;
create table text (
	textid serial,
	frontsubheading varchar(30) not null,
	primary key(textid),
	foreign key(textid) references card(cardid) on delete cascade
);

drop table if exists workrest;
create table workrest (
	workrestid serial,
	worktime int not null,
	resttime int not null,
	referencetime int not null,
	primary key(workrestid),
	foreign key(workrestid) references card(cardid) on delete cascade
);

drop table if exists amrap;
create table amrap(
	amrapid serial,
	reps int not null,
	rounds int not null,
	level enum('Beginner', 'Intermediate', 'Advanced', 'Elite') not null default 'Beginner',
	primary key(amrapid),
	foreign key(amrapid) references card(cardid) on delete cascade
);

drop table if exists repsrounds;
create table repsrounds (
	repsroundsid serial,
	reps int not null,
	time int not null,
	level enum('Beginner', 'Intermediate', 'Advanced', 'Elite') not null default 'Beginner',
	primary key(repsroundsid),
	foreign key(repsroundsid) references card(cardid) on delete cascade
);

/* Tables about statistics */
drop table if exists statistic;
create table statistic (
	statisticid serial,
	point int not null default 0,
	completedcard boolean not null default false,
	primary key(statisticid)
);

drop table if exists workreststat;
create table workreststat (
	workreststatid serial,
	referencetimestat int not null,
	primary key(workreststatid)
);

drop table if exists amrapstat;
create table amrapstat (
	amrapstatid serial,
	levelstat enum('Beginner', 'Intermediate', 'Advanced', 'Elite') not null default 'Beginner',
	roundsstat int not null,
	primary key(amrapstatid)
);

drop table if exists repsroundsstat;
create table repsroundsstat (
	repsroundsstatid serial,
	levelstat enum('Beginner', 'Intermediate', 'Advanced', 'Elite') not null default 'Beginner',
	timestat int not null,
	primary key(repsroundsstatid)
);

/********** Enter data in Piefit Database Tables **********/

/* Data for Box table */
insert into box values('Home Edition', 2.8);
insert into box values('Hiit Edition', 2.5);
insert into box values('Power Edition', 3.6);
