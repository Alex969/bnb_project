feature 'Create a new Listing' do
  scenario 'Creates a new listing and displays on all' do
    sign_up
    log_in
    visit('/listings')
    click_link 'Post a new Listing!'
    fill_in 'name', with: 'Test Listing'
    fill_in 'description', with: 'This is a test space - really lovely.'
    fill_in 'price', with: 100.00
    fill_in 'datefrom', with: '19/10/2021'
    fill_in 'dateto', with: '20/10/2021'
    click_button 'Submit'

    expect(page).to have_content 'Test Listing'
  end
end
