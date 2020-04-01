require 'player'

describe Player do

  subject = described_class.new('Barbara')

  it 'has a name' do
    expect(subject).to have_attributes(name: 'Barbara')
  end
end
