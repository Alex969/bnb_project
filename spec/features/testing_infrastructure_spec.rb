feature 'Testing Infrastructure' do
  scenario 'shows test message' do
    visit('/')
    expect(page).to have_content 'Makers BnB'
  end
end
