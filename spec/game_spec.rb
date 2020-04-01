require 'game'



describe Game do
  
  # Player instance double
  let(:dave) { double(:player) }
  let(:jim) { double(:player) }

  describe '#attack' do
    it 'attack a player' do
      expect(jim).to receive :take_damage
      subject.attack(jim)
    end
  end
end
