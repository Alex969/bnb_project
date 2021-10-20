feature 'Requesting booking' do
<<<<<<< HEAD
  xscenario 'click on an available date' do
    visit '/listings/view'
    click_button('Request Booking', match: :first)

    expect(current_path)
=======
  scenario 'click on an available date' do
    visit '/listings/view'
    click_button('Request Booking', match: :first)

>>>>>>> dc8555b1892c82870774a867c5f27d1ec799bd21
  end
end