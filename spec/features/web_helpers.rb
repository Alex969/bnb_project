def sign_up
  visit('/')
  fill_in 'email', with: "test@test.com"
  fill_in 'username', with: "Mr. Test"
  fill_in 'password', with: "test123"
  click_button 'Submit'
end

def log_in
  visit('/login')
  fill_in 'email', with: 'test@test.com'
  fill_in 'password', with: 'test123'
  click_button 'Submit'
end

def create_test_listing
  visit('/listings')
  click_link 'Post a new Listing!'
  fill_in 'name', with: 'Test Listing'
  fill_in 'description', with: 'This is a test space - really lovely.'
  fill_in 'price', with: 100.00
  fill_in 'datefrom', with: '19/10/2021'
  fill_in 'dateto', with: '20/10/2021'
  click_button 'Submit'
end
