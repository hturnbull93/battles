require 'player'

describe Player do

  subject = described_class.new('Barbara')
  let(:dave) { described_class.new('Dave') }
  let(:jim) { described_class.new("Jim") }

  it 'has a name' do
    expect(subject).to have_attributes(name: 'Barbara')
  end

  describe '#take_damage' do
    it 'reduces players HP' do
      expect { subject.take_damage }.to change { subject.hp }.by(-Player::STANDARD_DAMAGE )
    end
  end

  describe '#attack' do
    it 'attack a player' do
      expect { dave.attack(jim) }.to change { jim.hp }.by(-Player::STANDARD_DAMAGE )
    end
  end
end
