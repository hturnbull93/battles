feature 'Enter names' do
  scenario 'enter names and see them displayed' do
    sign_in_and_play
    expect(page).to have_content 'John vs Pete!'
  end
end
