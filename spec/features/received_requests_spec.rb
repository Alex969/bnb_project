feature "receive requests" do
  scenario "user who is hosting can see requests for their listings" do
    sign_up
    log_in
    create_test_listing
    sign_up_john
    log_in_john
    visit ("/listings")
    click_link("Test Listing")
    click_button('Request Booking', match: :first)
    log_in
    visit("/requests")
    expect(page).to have_content("2021-10-19")
    expect(page).to have_content("John")
    expect(page).to have_content("Test Listing")
  end

  scenario "user who is hosting can approve requests for their listings" do
    sign_up
    log_in
    create_test_listing
    sign_up_john
    log_in_john
    visit ("/listings")
    click_link("Test Listing")
    click_button('Request Booking', match: :first)
    log_in
    visit("/requests")
    click_button('Approve', match: :first)
    expect(page).to have_content('Booking approved')
  
    # we also expect any other requests to be cancelled
    # we also expect pending booking to now be approved

  end
end




 