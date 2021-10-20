feature 'Requesting booking' do
  scenario 'click on an available date' do
    visit '/listings/view'
    click_button('Request Booking', match: :first)

  end
end