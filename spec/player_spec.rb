require 'player'

describe Player do

  subject = described_class.new('Barbara')

  it 'has a name attr' do
    expect(subject).to have_attributes(name: 'Barbara')
  end
end