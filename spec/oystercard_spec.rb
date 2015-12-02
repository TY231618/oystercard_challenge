require 'oystercard'



describe Oystercard do
subject(:oystercard) { described_class.new }
let(:entry_station) {double :station}
let(:exit_station) {double :station}
let(:entry_station2) {double :station}
let(:exit_station2) {double :station}


  describe '#balance' do
    it 'shows the card balance' do
      expect(oystercard.balance).to eq 0
    end
  end

  describe '#top_up' do
    #it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'allows funds to be added' do
      expect{ oystercard.top_up(1) }.to change { oystercard.balance }.by(1)
    end

    it 'prevents top up from exceeding card limit' do
      max = described_class::CARD_LIMIT
      oystercard.top_up(max)
      expect { oystercard.top_up(1) }.to raise_error "card limit of #{max} exceeded"
    end
  end

  # describe '#deduct' do
  #   #it { is_expected.to respond_to(:deduct).with(1).argument }
  #   #
  #   # it 'allows funds to be deducted' do
  #   #   #oystercard.top_up(10)
  #   #   #expect{ oystercard.deduct(1) }.to change { oystercard.balance }.by(-1)
  #   # end
  # end

  describe '#in_journey?' do
    it 'is initially not in a journey' do
      expect(oystercard).not_to be_in_journey
    end
  end

  describe '#touch_in' do
    it 'can touch in' do
      oystercard.top_up(20)
      oystercard.touch_in(entry_station)
      expect(oystercard).to be_in_journey
    end

    it 'prevents tap in when funds are too low' do
      expect { oystercard.touch_in(entry_station) }.to raise_error 'not enough money on card'
    end

    it 'takes off fare on touch out' do
      expect{ oystercard.touch_out(exit_station) }.to change{ oystercard.balance }.by(-Oystercard::FARE)
    end

    it 'stores the entry station' do
      oystercard.top_up(20)
      oystercard.touch_in(entry_station)
      expect(oystercard.entry_station).to eq entry_station
    end
  end

  describe '#touch_out' do
    it 'can touch out' do
      oystercard.top_up(20)
      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station)
      expect(oystercard).not_to be_in_journey
    end

  end
  describe '#journeys_log' do

    it 'logs journeys' do
      oystercard.top_up(20)
      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station)
      oystercard.touch_in(entry_station2)
      oystercard.touch_out(exit_station2)
      expect(oystercard.journeys['entry']).to eq entry_station2
    end
  end
end
