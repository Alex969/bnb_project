require 'pg'

task :setup do
  p 'Creating Databases'

  %w[bnb bnb_test].each do |db|
    connection = PG.connect
    begin
      connection.exec("CREATE DATABASE #{db};")
    rescue StandardError => e
      p 'Database with a same name already exists' # Implement overwritting past versions
    else
      connection = PG.connect(dbname: db)
      connection.exec('CREATE TABLE users(id SERIAL PRIMARY KEY, username varchar(60), email varchar(60), password varchar(60));')
      connection.exec('CREATE TABLE listings(id SERIAL PRIMARY KEY, title varchar(60), description varchar(300), price_per_night DECIMAL(10,2), user_id int REFERENCES users(id));')
      connection.exec('CREATE TABLE bookings(id SERIAL PRIMARY KEY, user_id int REFERENCES users(id), listing_id int REFERENCES listings(id), date date);')
      connection.exec('CREATE TABLE requests(id SERIAL PRIMARY KEY, booking_id int REFERENCES bookings(id), user_id int REFERENCES users(id));')
    end
  end
end

task :drop_dbs do
  %w[bnb bnb_test].each do |db|
    connection = PG.connect
    connection.exec("DROP DATABASE #{db};")
  rescue StandardError => e
    p "#{db} doesn't exist, nothing to drop"
  end
end

# task :fill_dbs do
#   connection = PG.connect(dbname: 'bnb')
#   # connection.exec()
#   username = 'Test' 
#   email = 'test@example.com'
#   password = 'password123'
#   title = 'Cottage Heaven',
#   description = 'My cottage in the woods'
#   price_per_night = 50
  

# end
