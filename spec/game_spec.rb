require 'game'

describe Game do
  
  # Player instance double
  let(:dave) { double(:dave, take_damage: 'Ow', hp: 100) }
  let(:jim) { double(:jim, take_damage: 'Ow', hp: 100) }
  let(:weakened) { double(:weakened, take_damage: 'Ow', hp: 0) }

  # Player class double
  let(:player_class) do
    player_class = double(:player_class)
    allow(player_class).to receive(:new).with('Dave').and_return(dave)
    allow(player_class).to receive(:new).with('Jim').and_return(jim)
    allow(player_class).to receive(:new).with('Weakened').and_return(weakened)
    player_class
  end

  # Isolated game scenarios
  subject { described_class.new('Dave', 'Jim', player_class) }
  let(:one_sided_1) { described_class.new('Dave', 'Weakened', player_class) }
  let(:one_sided_2) { described_class.new('Weakened', 'Jim', player_class) }

  describe 'Players stored' do
    it '#p1 returns the player instance' do
      expect(subject.p1).to eq dave
    end
    it '#p2 returns the player instance' do
      expect(subject.p2).to eq jim
    end
  end

  describe 'Player switching' do
    it 'initially player one is the active player' do
      expect(subject.active).to eq dave
    end
    it 'after an action player two is the active player' do
      subject.attack
      expect(subject.active).to eq jim
    end
  end

  describe '#attack' do
    it 'attack a player' do
      expect(jim).to receive :take_damage
      subject.attack
    end
  end

  describe '#winner' do
    it 'if a player 2 hp <= 0, winner is player 1' do
      one_sided_1.attack
      expect(one_sided_1.winner).to eq dave
    end
    it 'if a player 1 hp <= 0, winner is player 2' do
      one_sided_2.attack
      expect(one_sided_2.winner).to eq jim
    end
  end
  describe '#loser' do
    it 'if a player 2 hp <= 0, loser is player 2' do
      one_sided_1.attack
      expect(one_sided_1.loser).to eq weakened
    end
    it 'if a player 1 hp <= 0, loser is player 1' do
      one_sided_2.attack
      expect(one_sided_2.loser).to eq weakened
    end
  end
end
