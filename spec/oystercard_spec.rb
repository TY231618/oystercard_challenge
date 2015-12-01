require 'oystercard'

describe Oystercard do
subject(:oystercard) { described_class.new }

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

  describe '#deduct' do
    #it { is_expected.to respond_to(:deduct).with(1).argument }

    it 'allows funds to be deducted' do
      #oystercard.top_up(1)
      expect{ oystercard.deduct(1)}.to change { oystercard.balance }.by(-1)
    end
  end

  describe '#in_journey?' do
    it 'is initially not in a journey' do
      expect(oystercard).not_to be_in_journey
    end
  end

  describe '#touch_in' do
    it 'can touch in' do
      oystercard.top_up(20)
      oystercard.touch_in
      expect(oystercard).to be_in_journey
    end
  end

  describe '#touch_out' do
    it 'can touch out' do
      oystercard.touch_in
      oystercard.touch_out
      expect(oystercard).not_to be_in_journey
    end
  end

end
