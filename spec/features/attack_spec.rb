feature 'Attack players' do
  scenario 'gives confirmation of attack' do
    sign_in_and_play
    click_button('Attack')
    expect(page).to have_content 'Attack made!'
  end

  scenario 'gives confirmation of attack' do
    sign_in_and_play
    click_button('Attack')
    expect(page).to have_content '90'
  end

end
