feature 'View Individual Listing' do
  scenario 'Clicks individual listing to see listing page' do
    sign_up
    log_in
    create_test_listing

    visit('/listings')
    click_link 'Test Listing'

    expect(page).to have_content 'This is a test space - really lovely.'
  end
end
