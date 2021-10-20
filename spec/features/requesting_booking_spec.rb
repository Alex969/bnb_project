feature 'Requesting booking' do
  xscenario 'click on an available date' do
    visit '/listings/view'
    click_button('Request Booking', match: :first)

    expect(current_path)
  end
end