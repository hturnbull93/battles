feature 'Attack players' do
  scenario 'p1 attacks p2, gets confirmation' do
    sign_in_and_play
    click_button('Attack')
    expect(page).to have_content 'Dave attacked Jim!'
  end

  scenario 'p1 attacks p2 and reduces p2 hp' do
    sign_in_and_play
    allow_any_instance_of(Object).to receive(:rand).and_return(5)
    click_button('Attack')
    expect(page).to have_content 'Jim HP: 90'
  end

  scenario 'p2 attacks p1 and reduces p1 hp' do
    sign_in_and_play
    allow_any_instance_of(Object).to receive(:rand).and_return(5)
    click_button('Attack')
    click_button('Attack')
    expect(page).to have_content 'Jim HP: 90'
  end

  scenario 'p1 attacks p2 and reduces p2 hp by a fixed amount plus random bonus damage' do
    sign_in_and_play
    allow_any_instance_of(Object).to receive(:rand).and_return(5)
    click_button('Attack')
    expect(page).to have_content 'Jim HP: 90'
  end
end
