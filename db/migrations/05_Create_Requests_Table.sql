CREATE TABLE requests(id SERIAL PRIMARY KEY, booking_id int REFERENCES bookings(id), user_id int REFERENCES users(id));