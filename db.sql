    /*tietokannan luonti*/
    drop database if exists webshop;
    create database webshop;
    use webshop;
    /*asiakas taulun luonti*/
    drop table if exists customer;
    create table customer (
    id int primary key AUTO_INCREMENT,
    firstname varchar(100) not null,
    lastname varchar(100) not null,
    address varchar(100) not null,
    zip varchar(20) not null,
    city varchar(50) not null
    );
    /*tilaus taulun luonti*/
    drop table if exists `order`;

    create table `order` (
        id int primary key AUTO_INCREMENT,
        order_date timestamp default CURRENT_TIMESTAMP,
        customer_id int not null,
        index customer_id(customer_id),
        foreign key (customer_id) references customer(id)
        on delete restrict
    );


    /* Feedback taulun luonti */
    create table feedback (
    id int primary key AUTO_INCREMENT,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    phone VARCHAR(15),
    email VARCHAR(50),
    message VARCHAR(255)
)

    /*Kategoria taulun luonti */
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

    /*Tuote taulun luonti*/
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

    /*tilausrivi taulun luonti*/
    drop table if exists order_row;

    create table order_row(
    order_id int not null,
    index order_id(order_id),
    foreign key (order_id) REFERENCES `order`(id),
    product_id int not null,
    index product_id(product_id),
    foreign key (product_id) references product(id),
    amount INTEGER
    );


    /*komponentteja tauluun */
    insert into product (name, price, image, category_id) values ('Nvidia GeForce RTX 2080Ti',999,'RTX 2080TI.png',2);
    insert into product (name, price, image, category_id) values ('Nvidia GeForce RTX 2080',699,'RTX 2080.jpg',2);
    insert into product (name, price, image, category_id) values ('Nvidia GeForce GTX 1080Ti',699,'GTX 1080TI.jpg',2);
    insert into product (name, price, image, category_id) values ('Nvidia GeForce RTX 2080 AORUS',1500,'aorus gtx 3080.jpg',2);
    insert into product (name, price, image, category_id) values ('AMD Ryzen 5 3600',240,'AMD Ryzen 5 3600.jpg',2);
    insert into product (name, price, image, category_id) values ('Intel i5-9400F',150,'INTEL i5-9400F.jpg',2);

    /*oheislaitteita tauluun */
    insert into product (name, price, image, category_id) values ('Playstation 5 ohjain',70,'ps5 ohjain.jpg',3);
    insert into product (name, price, image, category_id) values ('Playstation 4 ohjain',55,'PS4 Ohjain.jpg',3);
    insert into product (name, price, image, category_id) values ('Xbox Series X/One ohjain',63,'xbox one ohjain.jpg',3);
    insert into product (name, price, image, category_id) values ('razer kraken kuulokkeet',80,'razer kraken.jpg',3);
    insert into product (name, price, image, category_id) values ('Langaton toimistohiiri',30,'toimistohiiri.png',3);
    insert into product (name, price, image, category_id) values ('Pelihiiri',80,'pelihiiri.png',3);
    insert into product (name, price, image, category_id) values ('Langaton näppäimistö',89,'nappaimisto.png',3);
    insert into product (name, price, image, category_id) values ('Pelihiiri ja pelinäppäimistö',170,'hiiri+nappaimisto.png',3);
    
    /*Konsoleita tauluun */
    insert into product (name, price, image, category_id) values ('Sony Playstation 5 + ohjain',530,'PS5 + ohjain.jpg',4);
    insert into product (name, price, image, category_id) values ('Sony Playstation 4 + ohjain',330,'ps4.jpg',4);
    insert into product (name, price, image, category_id) values ('Microsoft Xbox One + ohjain',330,'xbox ONE + ohjain.jpg',4);
    insert into product (name, price, image, category_id) values ('Microsoft Xbox Series X + ohjain',510,'xbox series X.jpg',4);
    
    /*Tietokoneita tauluun*/
    insert into product (name, price, image, category_id) values ('Jomssin kasaama pelitietokone',1500,'Placeholder.png',1);
    insert into product (name, price, image, category_id) values ('Jomssin kasaama pelitietokone',2000,'Placeholder.png',1);
    insert into product (name, price, image, category_id) values ('Jomssin kasaama pelitietokone',3000,'Placeholder.png',1);
    insert into product (name, price, image, category_id) values ('ACER pelitietokone',1500,'Placeholder.png',1);