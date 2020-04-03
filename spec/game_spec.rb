require 'game'



describe Game do
  
  # Player instance double
  let(:dave) { double(:player) }
  let(:jim) { double(:player) }

  # Player class double
  let(:player_class) do
    player_class = double(:player_class)
    allow(player_class).to receive(:new).with('Dave').and_return(dave)
    allow(player_class).to receive(:new).with('Jim').and_return(jim)
    player_class
  end

  subject { described_class.new('Dave', 'Jim', player_class) }

  describe 'Players stored' do
    it '#p1 returns the player instance' do
      expect(subject.p1).to eq dave
    end
    it '#p2 returns the player instance' do
      expect(subject.p2).to eq jim
    end
  end

  describe '#attack' do
    it 'attack a player' do
      expect(jim).to receive :take_damage
      subject.attack(subject.p2)
    end
  end
end
