CREATE TABLE listings(id SERIAL PRIMARY KEY, title varchar(60), description varchar(300), price_per_night DECIMAL(10,2), user_id int REFERENCES users(id));
