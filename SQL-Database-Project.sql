create database store;

create table countries(
    code          int primary key,
    name          varchar(20) unique ,
    continent_name varchar(20) not null

);

create table users(
    id          int primary key,
    full_name   varchar(20)  ,
    email varchar(20) unique,
    gender char(1) check ( gender='m'or gender='f' ),
    date_of_birth varchar(15),
    created_at datetime ,
    country_code int ,
    foreign key (country_code) references countries (code)
    );

create table orders(
    id          int primary key,
    user_id   int  ,
    status varchar(6) check ( status='start'or status='finish' ),
    created_it datetime ,
    foreign key (user_id) references users (id)
    );


create table products(
    id          int primary key,
    name   varchar(10) not null ,
    price int default 0,
    status varchar(10) check ( status='valid'or status='expired' ),
    created_it datetime
);


create table order_products(
    order_id     int  primary key ,
    product_id   int,
    quantity int default 0,
    foreign key (order_id) references orders (id) ,
    foreign key (product_id) references products (id)
    );

insert into countries values (1 ,'saudi arabia' , 'Asia');

insert into users values (1 ,'Reem Alharbi' , 'Reemabdull@gmail.com','f','1997-9-19','2022-4-17 13:4:17',1);

insert into orders values (1 ,1 , 'start','2022-4-17 20:4:17');

insert into products values (1 ,'iPhone 12', 3000, 'valid','2020-10-23 10:04:17');
insert into products values (2 ,'iPhone 11', 2400, 'valid','2019-09-20 08:04:17');

insert into order_products values (1 ,1, 2);

update countries set name='KSA' where code=1;

delete from countries where code= 2;








