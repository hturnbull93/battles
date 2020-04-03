feature 'Winning a match' do
  scenario 'p1 and p2 attack until one of them wins, winner displayed' do
    sign_in_and_play
    19.times { click_button('Attack') }
    expect(page).to have_content 'Dave has defeated Jim!'
  end
end
