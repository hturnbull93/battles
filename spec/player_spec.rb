require 'player'

describe Player do

  subject = described_class.new('Barbara')
  let(:dave) { described_class.new('Dave') }
  let(:jim) { described_class.new("Jim") }

  it 'has a name' do
    expect(subject).to have_attributes(name: 'Barbara')
  end

  describe '#take_damage' do
    it 'reduces players HP by fixed amount plus random bonus damage' do
      allow_any_instance_of(Object).to receive(:rand).and_return(5)
      expect { subject.take_damage }.to change { subject.hp }.by(-(Player::STANDARD_DAMAGE + 5))
    end
  end
end
