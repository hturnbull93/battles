feature 'View Hit Points' do
  scenario 'see the polayers hitpoints displayed' do
    sign_in_and_play
    expect(page).to have_content 'Player 2 HP: 100'
  end
end
