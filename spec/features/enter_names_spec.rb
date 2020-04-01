feature 'Enter names' do
  scenario 'enter names and see them displayed' do
    visit '/'
    fill_in('p1name', with: 'John')
    fill_in('p2name', with: 'Pete')
    click_button('Go!')
    expect(page).to have_content 'John vs Pete!'
  end
end
