feature 'View Hit Points' do
  scenario 'see player 1 hp displayed' do
    sign_in_and_play
    expect(page).to have_content 'Jim HP: 100'
  end
  scenario 'see player 2 hp displayed' do
    sign_in_and_play
    expect(page).to have_content 'Dave HP: 100'
  end
end
