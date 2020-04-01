feature 'View Hit Points' do
  scenario 'see the polayers hitpoints displayed' do
    visit '/'
    fill_in('p1name', with: 'John')
    fill_in('p2name', with: 'Pete')
    click_button('Go!')
    expect(page).to have_content 'Player 2 HP: 100'
  end
end
