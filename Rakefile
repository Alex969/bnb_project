require 'pg'

task :setup do
  p "Creating Databases"

  ["bnb", "bnb_test"].each do |db|
    connection = PG.connect
    begin
      connection.exec("CREATE DATABASE #{db};")
    rescue => exception
      p "Database with a same name already exists" # Implement overwritting past versions
    else
      connection = PG.connect(dbname: db)
      connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, username varchar(60), email varchar(60), password varchar(60));")
      connection.exec("CREATE TABLE listings(id SERIAL PRIMARY KEY, title varchar(60), description varchar(300), price_per_night DECIMAL(10,2), user_id int REFERENCES users(id));")
      connection.exec('CREATE TABLE bookings(id SERIAL PRIMARY KEY, user_id int REFERENCES users(id), listing_id int REFERENCES listings(id), date date);')
    end    
  end
end


task :drop_dbs do 
  ['bnb', 'bnb_test'].each do |db| 

    begin
      connection = PG.connect
      connection.exec("DROP DATABASE #{db};")
    rescue => exception
      p "#{db} doesn't exist, nothing to drop"
    end
  end
end 