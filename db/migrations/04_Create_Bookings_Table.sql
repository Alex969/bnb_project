CREATE TABLE bookings(id SERIAL PRIMARY KEY, user_id int REFERENCES users(id), listing_id int REFERENCES listings(id), date date);
