select bookings.date, users.username, listings.title from requests 
inner join bookings 
on requests.booking_id = bookings.id
inner join listings
on bookings.listing_id = listings.id
inner join users 
on requests.user_id = users.id 
where listings.id = 1;