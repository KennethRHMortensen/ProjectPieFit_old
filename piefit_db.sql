/* Piefit Database */

-- Create piefit database
drop database if exists piefit;
create database piefit;
use piefit;

-- Create user table
drop table if exists user;
create table user (
	username varchar(20) not null,
	email varchar(65) not null unique,
	password varchar(30) not null,
	role boolean not null default false,
	primary key(username),
);

-- Create setting table
drop table if exists setting;
create table setting (
	settingid serial,
	theme enum('Standard', 'Accessibility') not null default 'Standard', -- Needs Theme names
	primary key(settingid)
);

-- Create personal table
drop table if exists personal;
create table personal (
	username varchar(20) not null,
	personalid serial,
	realname varchar(65) not null,
	gender enum('Male', 'Female', 'Non-binary', 'Other') not null,
	bio varchar(200) not null,
	primary key(personalid),
	foreign key(username) references user(username) on delete cascade
);

-- Create image table
drop table if exists image;
create table image (
	username varchar(20) not null,
	imageid serial,
	image binary not null, -- Unsure about syntax for images
	primary key(imageid),
	foreign key(username) references user(username) on delete cascade
);

-- Create payment table
drop table if exists payment;
create table payment (
	username varchar(20) not null,
	creditcardinfo int not null,
	cardholder varchar(65) not null,
	primary key(creditcardinfo),
	foreign key(username) references user(username) on delete cascade
);

-- Create box table
drop table if exists box;
create table box (
	boxid serial,
	edition varchar(20) not null,
	difficultylevel int not null,
	isdraft boolean not null default true,
	primary key(edition)
);

-- Insert data into box table
insert into box values('HOME EDITION', 2.8, false);
insert into box values('HIIT EDITION', 2.5, false);
insert into box values('POWER EDITION', 3.6, false);

-- Create collection table
drop table if exists collection;
create table collection (
	collectionid serial,
	edition varchar(20) not null,
	musclecategory varchar(20) not null,
	difficultylevel int not null,
	isdraft boolean not null default true,
	primary key(edition, musclecategory),
	foreign key(edition) references box(edition)
);

-- Insert data into collection table
insert into collection values('HOME EDITION', 'CORE', 5, false);
insert into collection values('HOME EDITION', 'LOWERBODY', 5, false);
insert into collection values('HOME EDITION', 'UPPERBODY', 5, false);
insert into collection values('HOME EDITION', 'FULLBODY', 5, false);
insert into collection values('HIIT EDITION', 'CORE', 5, false);
insert into collection values('HIIT EDITION', 'LOWERBODY', 5, false);
insert into collection values('HIIT EDITION', 'UPPERBODY', 5, false);
insert into collection values('HIIT EDITION', 'FULLBODY', 5, false);
insert into collection values('HIIT EDITION', 'CORE', 5, false);
insert into collection values('HIIT EDITION', 'LOWERBODY', 5, false);
insert into collection values('HIIT EDITION', 'UPPERBODY', 5, false);
insert into collection values('HIIT EDITION', 'FULLBODY', 5, false);

-- Create card table
drop table if exists card;
create table card (
	cardid serial,
	edition varchar(20) not null,
	musclecategory varchar(20) not null,
	hashtag varchar(20) not null,
	method varchar(20) not null,
	logo binary not null, -- Unsure about syntax for images
	instagramicon binary not null, -- Unsure about syntax for images
	exercisename not null default 'Exercises',
	worktypeheading varchar(20) not null,
	difficultyheading not null default 'Difficulty Level',
	difficultylevel int not null,
	backheading varchar(20) not null,
	backsubheading varchar(30) not null,
	isdraft boolean not null default true,
	primary key(hashtag),
	foreign key(edition, musclecategory) references collection(edition, musclecategory)
);

-- Insert data into card table
insert into card values(
	'HOME EDITION',
	'CORE',
	'#PiefitWashingtonDC',
	'WORK/REST',
	-- logo
	-- instagramicon
	'25/10 SEC',
	1,
	'REFERENCES',
	'BEGINNER - WARM UP - FINISHER',
	false
);

insert into card values(
	'HOME EDITION',
	'CORE',
	'#PiefitSanJose',
	'REPS/ROUNDS',
	-- logo
	-- instagramicon
	'REPS',
	2,
	'BENCHMARK',
	'BEGINNER - WARM UP - FINISHER',
	false
);

insert into card values(
	'HOME EDITION',
	'CORE',
	'#PiefitHavana',
	'AMRAP 14',
	-- logo
	-- instagramicon
	'REPS',
	2,
	'BENCHMARK',
	'BEGINNER - WARM UP - FINISHER',
	false
);

insert into card values(
	'HOME EDITION',
	'LOWERBODY',
	'#PiefitBangkok',
	'WORK/REST',
	-- logo
	-- instagramicon
	'25/10 SEC',
	1,
	'REFERENCES',
	'BEGINNER - WARM UP - FINISHER',
	false
);

insert into card values(
	'HOME EDITION',
	'LOWERBODY',
	'#PiefitTokyo',
	'REPS/ROUNDS',
	-- logo
	-- instagramicon
	'REPS',
	3,
	'BENCHMARK',
	'BEGINNER - WARM UP - FINISHER',
	false
);

insert into card values(
	'HOME EDITION',
	'LOWERBODY',
	'#PiefitJakarta',
	'AMRAP 12',
	-- logo
	-- instagramicon
	'REPS',
	3,
	'BENCHMARK',
	'BEGINNER - WARM UP - FINISHER',
	false
);

insert into card values(
	'HOME EDITION',
	'UPPERBODY',
	'#PiefitOslo',
	'WORK/REST',
	-- logo
	-- instagramicon
	'30/10 SEC',
	2,
	'REFERENCES',
	'BEGINNER - WARM UP - FINISHER',
	false
);

insert into card values(
	'HOME EDITION',
	'UPPERBODY',
	'#PiefitBucharest',
	'REPS/ROUNDS',
	-- logo
	-- instagramicon
	'REPS',
	4,
	'BENCHMARK',
	'BEGINNER - WARM UP - FINISHER',
	false
);

insert into card values(
	'HOME EDITION',
	'UPPERBODY',
	'#PiefitAmsterdam',
	'AMRAP 12',
	-- logo
	-- instagramicon
	'REPS',
	3,
	'BENCHMARK',
	'BEGINNER - WARM UP - FINISHER',
	false
);

insert into card values(
	'HOME EDITION',
	'FULLBODY',
	'#PiefitGuyana',
	'WORK/REST',
	-- logo
	-- instagramicon
	'20/5 SEC',
	4,
	'REFERENCES',
	'BEGINNER - WARM UP - FINISHER',
	false
);

insert into card values(
	'HOME EDITION',
	'FULLBODY',
	'#PiefitSweden',
	'REPS/ROUNDS',
	-- logo
	-- instagramicon
	'REPS',
	2,
	'BENCHMARK',
	'BEGINNER - WARM UP - FINISHER',
	false
);

insert into card values(
	'HOME EDITION',
	'FULLBODY',
	'#PiefitNetherlands',
	'AMRAP 12',
	-- logo
	-- instagramicon
	'REPS',
	3,
	'BENCHMARK',
	'BEGINNER - WARM UP - FINISHER',
	false
);

-- Create exercise table
drop table if exists exercise;
create table exercise (
	exerciseid serial,
	name varchar(20) not null unique,
	description varchar(65) not null,
	difficultylevel int not null,
	video binary not null, -- Unsure about syntax for videos
	primary key(exerciseid),
	foreign key(exerciseid) references card(cardid)
);

-- Create text table
drop table if exists text;
create table text (
	textid serial,
	frontsubheading varchar(30) not null,
	primary key(textid),
	foreign key(textid) references card(cardid) on delete cascade
);

-- Create workrest table
drop table if exists workrest;
create table workrest (
	workrestid serial,
	worktime int not null,
	resttime int not null,
	referencetime int not null,
	primary key(workrestid),
	foreign key(workrestid) references card(cardid) on delete cascade
);

-- Create amrap table
drop table if exists amrap;
create table amrap(
	amrapid serial,
	reps int not null,
	rounds int not null,
	level enum('Beginner', 'Intermediate', 'Advanced', 'Elite') not null default 'Beginner',
	primary key(amrapid),
	foreign key(amrapid) references card(cardid) on delete cascade
);

-- Create repsrounds table
drop table if exists repsrounds;
create table repsrounds (
	repsroundsid serial,
	reps int not null,
	time int not null,
	level enum('Beginner', 'Intermediate', 'Advanced', 'Elite') not null default 'Beginner',
	primary key(repsroundsid),
	foreign key(repsroundsid) references card(cardid) on delete cascade
);

-- Create statistic table
drop table if exists statistic;
create table statistic (
	statisticid serial,
	point int not null default 0,
	completedcard boolean not null default false,
	primary key(statisticid)
);

-- Create workreststat table
drop table if exists workreststat;
create table workreststat (
	workreststatid serial,
	referencetimestat int not null,
	primary key(workreststatid)
);

-- Create amrapstat table
drop table if exists amrapstat;
create table amrapstat (
	amrapstatid serial,
	levelstat enum('Beginner', 'Intermediate', 'Advanced', 'Elite') not null default 'Beginner',
	roundsstat int not null,
	primary key(amrapstatid)
);

-- Create repsroundsstat table
drop table if exists repsroundsstat;
create table repsroundsstat (
	repsroundsstatid serial,
	levelstat enum('Beginner', 'Intermediate', 'Advanced', 'Elite') not null default 'Beginner',
	timestat int not null,
	primary key(repsroundsstatid)
);
