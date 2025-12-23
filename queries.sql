-- users
create table users(
  user_id serial primary key,
  name varchar(20) not null,
  email varchar(50) unique not null,
  password text not null,
  phone int,
  role varchar(20) not null
);


-- Vehicle 

create table vehicles(
  vehicle_id serial primary key,
  name varchar(50) not null,
  type varchar(50) not null,
  registration_number varchar(50) unique not null,
  model varchar(30),
  price_per_day int not null,
  available_status varchar(30) default 'available'
);


select * from users;
select * from vehicles;

