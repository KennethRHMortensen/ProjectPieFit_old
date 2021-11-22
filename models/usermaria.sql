drop database if exists nodecontacts;
create database nodecontacts;
use nodecontacts

create table user (
    name varchar(16) not null,
    email varchar(64) not null,
    phone varchar(16) not null,
    primary key(email)
);

grant all on nodecontacts.* to nobody@localhost;

insert into user values('nml', 'nmla@iba.dk', '1234');
insert into user values('john', 'johndoe@doe.com', '1235');
insert into user values('jane', 'jane@doe.com', '1236');