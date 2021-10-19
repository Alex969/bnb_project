feature 'Logs in' do
  scenario 'Logs in successfully' do
    User.sign_up(username: "Dajox", email: "test@test.com", password: "test123")

    visit('/login')
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'test123'
    click_button 'Submit'

    expect(page).to have_content 'Welcome, Dajox'
  end

  scenario 'Refuses incorrect login' do
    visit('/login')
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'password'
    click_button 'Submit'

    expect(page).not_to have_content 'Welcome Dajox'
  end
end
