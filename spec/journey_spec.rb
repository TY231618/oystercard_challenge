require 'journey'
describe Journey do
  subject(:journey) { described_class.new }

  it 'should, on touch_out, reset the entry station to nil' do
    oyster = Oystercard.new
    oyster.top_up(20)
    oyster.touch_in('Brixton')
    oyster.touch_out('Aldgate')
    expect(oyster.journey.current_journey[:entry_station]).to eq nil
  end

  it 'returns correct entry station' do
    oyster = Oystercard.new
    oyster.top_up(20)
    oyster.touch_in('Brixton')
    expect(oyster.journey.current_journey[:entry_station]).to eq 'Brixton'
  end

  describe '#penalty_fare' do
    it 'returns true if only an entry or exit station is given' do
      expect(journey.penalty?).to eq true
    end
  end
end
