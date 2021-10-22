feature 'Register' do
  scenario 'allows a user to register' do
    visit('/')
    click_button 'Click to Register'
    fill_in 'email', with: 'test@test.com'
    fill_in 'username', with: 'Mr. Test'
    fill_in 'password', with: 'password'
    click_button 'Submit'

    expect(page).to have_content 'Welcome Mr. Test'
  end

  scenario 'prevents users registering with the same email' do
    sign_up
    visit('/')
    fill_in 'email', with: 'test@test.com'
    fill_in 'username', with: 'Mr. Test'
    fill_in 'password', with: 'password'
    click_button 'Submit'

    expect(page).to have_content "Error: Email already exists"

  end
end
