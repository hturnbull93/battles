feature 'Switch turns' do
  scenario 'Player 1 goes first' do
    sign_in_and_play
    expect(page).to have_content "Dave's turn"
  end
  scenario 'after player 1 attacks, player 2 turn' do
    sign_in_and_play
    click_button('Attack')
    expect(page).to have_content "Jim's turn"
  end
end
