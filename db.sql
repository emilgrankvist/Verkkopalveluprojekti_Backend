drop database if exists webshop;
create database webshop;
use webshop;

drop table if exists category;
create table category (
    id int primary key auto_increment,
    name varchar(255) not null
);

/*Arvoja kategoria tauluun*/
insert into category (name) values ('Tietokoneet');
insert into category (name) values ('Komponentit');
insert into category (name) values ('Oheislaitteet');
insert into category (name) values ('Konsolit');

drop table if exists product;
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

/*komponentteja tauluun */
insert into product (name, price, image, category_id) values ('Nviadia GeForce RTX 2080Ti',999,'RTX 2080TI.png',2);
insert into product (name, price, image, category_id) values ('Nviadia GeForce RTX 2080',699,'RTX 2080.jpg',2);
insert into product (name, price, image, category_id) values ('Nviadia GeForce GTX 1080Ti',699,'GTX 1080TI.jpg',2);
insert into product (name, price, image, category_id) values ('Nvidia GeForce RTX 2080 AORUS',1500,'aorus gtx 3080.jpg',2);
insert into product (name, price, image, category_id) values ('AMD Ryzen 5 3600',240,'AMD Ryzen 5 3600.jpg',2);
insert into product (name, price, image, category_id) values ('Intel i5-9400F',150,'INTEL i5-9400F.jpg',2);

/*oheislaitteita tauluun */
insert into product (name, price, image, category_id) values ('Playstation 5 ohjain',70,'ps5 ohjain.jpg',3);
insert into product (name, price, image, category_id) values ('Playstation 4 ohjain',55,'PS4 Ohjain.jpg',3);
insert into product (name, price, image, category_id) values ('Xbox Series X/One ohjain',63,'xbox one ohjain.jpg',3);

/*Konsoleita tauluun */
insert into product (name, price, image, category_id) values ('Sony Playstation 5 + ohjain',530,'PS5 + ohjain.jpg',4);
insert into product (name, price, image, category_id) values ('Sony Playstation 4 + ohjain',330,'ps4.jpg',4);
insert into product (name, price, image, category_id) values ('Microsoft Xbox One + ohjain',330,'xbox ONE + ohjain.jpg',4);
insert into product (name, price, image, category_id) values ('Microsoft Xbox Series X + ohjain',510,'xbox series X.jpg',4);
/* 

TESTIARVOJA

insert into category (name) values ('Tietokoneet');
insert into category (name) values ('Komponentit');
insert into category (name) values ('Oheislaitteet');

insert into product (name, price, category_id) values ('Test computer 1',10,1);
insert into product (name, price, category_id) values ('Test computer 2',20,1);

*/