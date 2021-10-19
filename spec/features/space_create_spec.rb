feature 'Create a new space' do
  scenario 'Creates a new space and displays on all' do
    visit('/spaces')
    click_link 'Post a new Space!'
    fill_in 'name', with: 'Test Space'
    fill_in 'description', with: 'This is a test space - really lovely.'
    fill_in 'price', with: 100.00
    fill_in 'datefrom', with: '19/10/2021'
    fill_in 'dateto', with: '20/10/2021'
    click_button 'Submit'

    expect(page).to have_content 'Test Space'
  end
end
