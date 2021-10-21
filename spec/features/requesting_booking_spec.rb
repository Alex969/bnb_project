feature 'Requesting booking' do
  scenario 'click on an available date' do
    sign_up
    log_in
    create_test_listing

    visit '/listings'
    click_link 'Test Listing'
    click_button('Request Booking', match: :first)
    expect(page).to have_content 'Your booking has been requested'
  end

  scenario 'clicked listing shows on view all requests page under requests made (pending)' do
    sign_up
    log_in
    create_test_listing

    visit '/listings'
    click_link 'Test Listing'
    click_button('Request Booking', match: :first)

    visit '/requests'
    expect(page).to have_content 'Test Listing'
  end
end