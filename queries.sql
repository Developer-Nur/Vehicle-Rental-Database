-- users table
CREATE TABLE users (
  user_id serial PRIMARY KEY,
  name varchar(20) NOT NULL,
  email varchar(50) UNIQUE NOT NULL,
  password text NOT NULL,
  phone int,
  role varchar(20) NOT NULL
);

-- vehicle table
CREATE TABLE vehicles (
  vehicle_id serial PRIMARY KEY,
  name varchar(50) NOT NULL,
  type varchar(50) NOT NULL,
  registration_number varchar(50) UNIQUE NOT NULL,
  model varchar(30),
  price_per_day int NOT NULL,
  available_status varchar(30) DEFAULT 'available'
);

-- bookings table
CREATE TABLE bookings (
  booking_id serial PRIMARY KEY,
  user_id int REFERENCES users (user_id),
  vehicle_id int REFERENCES vehicles (vehicle_id),
  start_date date,
  end_date date,
  booking_status varchar(50),
  total_cost int
);

-- Retrieve booking information along with Customer name and Vehicle name.
select
  b.booking_id,
  u.name as customer_name,
  v.name as vehicle_name,
  b.start_date,
  b.end_date,
  b.booking_status
from
  bookings as b
  inner join users as u on u.user_id = b.user_id
  inner join vehicles as v on v.vehicle_id = b.vehicle_id
  order by b.booking_id;

-- Find all vehicles that have never been booked.
SELECT
  v.vehicle_id,
  v.name,
  v.type,
  v.model,
  v.registration_number,
  v.price_per_day AS rental_price,
  v.available_status AS status
FROM
  vehicles AS v
WHERE
  NOT EXISTS (
    SELECT
      b.vehicle_id
    FROM
      bookings AS b
    WHERE
      b.vehicle_id = v.vehicle_id
  )
ORDER BY
  vehicle_id;

-- Retrieve all available vehicles of a specific type.
SELECT
  *
FROM
  vehicles
WHERE
  available_status = 'available'
  AND type = 'car';