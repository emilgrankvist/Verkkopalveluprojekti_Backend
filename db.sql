drop database if exists webshop;
create database webshop;
use webshop;

create table category (
    id int primary key auto_increment,
    name varchar(255) not null
);

create table product (
    id int PRIMARY key AUTO_INCREMENT,
    name varchar(100) not null,
    price double (10,2) not null,
    image varchar(50),
    category_id int not null,
    index category_id(category_id),
    FOREIGN KEY (category_id) REFERENCES category(id)
    on delete restrict
);

/* 

TESTIARVOJA

insert into category (name) values ('Tietokoneet');
insert into category (name) values ('Komponentit');
insert into category (name) values ('Oheislaitteet');

insert into product (name, price, category_id) values ('Test computer 1',10,1);
insert into product (name, price, category_id) values ('Test computer 2',20,1);

*/