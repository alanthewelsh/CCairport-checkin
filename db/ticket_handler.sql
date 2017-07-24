DROP TABLE tickets;
DROP TABLE passengers;


CREATE TABLE passengers (
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  nationality VARCHAR(255),
  date_of_purchase DATE,
  arrived VARCHAR(255)
);

CREATE TABLE tickets (
  id SERIAL8 PRIMARY KEY,
  destination VARCHAR(255),
  flight_date DATE,
  cost NUMERIC,
  ticket_type VARCHAR(255),
  passenger_id INT8 REFERENCES passengers(id)
);