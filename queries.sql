-- Retrieve booking information along with Customer name and Vehicle name.
SELECT
  b.booking_id,
  u.name AS customer_name,
  v.name AS vehicle_name,
  b.start_date,
  b.end_date,
  b.booking_status
FROM
  bookings AS b
  INNER JOIN users AS u ON u.user_id = b.user_id
  INNER JOIN vehicles AS v ON v.vehicle_id = b.vehicle_id
ORDER BY
  b.booking_id;


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
  vehicle_id,
  name,
  type,
  model,
  registration_number,
  price_per_day AS rental_price,
  available_status AS status
FROM
  vehicles
WHERE
  available_status = 'available'
  AND type = 'car';


-- Find the total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings.
SELECT
  v.name AS vehicle_name,
  count(*) AS total_bookings
FROM
  vehicles AS v
  INNER JOIN bookings AS b ON v.vehicle_id = b.vehicle_id
GROUP BY
  v.name,
  v.vehicle_id
HAVING
  count(*) > 2;