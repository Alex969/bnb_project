feature 'Register' do
  scenario 'allows a user to register' do
    visit('/')
    fill_in 'email', with: 'test@test.com'
    fill_in 'name', with: 'Mr. Test'
    fill_in 'password', with: 'password'
    click_button 'Submit'

    expect(page).to have_content 'Please sign in to continue'
  end
end
