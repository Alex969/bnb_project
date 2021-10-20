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
