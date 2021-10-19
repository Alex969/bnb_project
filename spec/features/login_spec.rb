feature 'Logs in' do
  scenario 'Logs in successfully' do
    visit('/login')
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'password'
    click_button 'Submit'

    expect(page).to have_content 'Welcome'
  end
end
