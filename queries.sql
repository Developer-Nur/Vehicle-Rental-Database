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


-- Bookings 
create table bookings(
  booking_id serial primary key,
  user_id int references users(user_id),
  vehicle_id int references vehicles(vehicle_id),
  start_date date,
  end_date date,
  booking_status varchar(50),
  total_cost int
);




select * from users;
select * from vehicles;
select * from bookings;