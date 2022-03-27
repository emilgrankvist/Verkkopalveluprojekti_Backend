drop database if exists webshop;
create database webshop;
use webshop;

create table category (
    id int primary key auto_increment,
    name varchar(255) not null
);

/* 

insert into category (name) values ('Tietokoneet');
insert into category (name) values ('Komponentit');
insert into category (name) values ('Oheislaitteet');


*/