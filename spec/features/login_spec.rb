feature 'Logs in' do
  scenario 'Logs in successfully' do
    sign_up
    visit('/login')
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'test123'
    click_button 'Submit'

    expect(page).to have_content 'Welcome Mr. Test'
  end

  scenario 'Refuses incorrect login' do
    visit('/login')
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'password'
    click_button 'Submit'

    expect(page).not_to have_content 'Welcome Mr. Test'
  end
end
