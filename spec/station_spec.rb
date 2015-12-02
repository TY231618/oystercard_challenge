require 'station'



describe Station do

  let(:station) {described_class.new}

  describe '#zone' do
    it 'returns the zone of given station' do
      expect(station.zone('Balham')).to eq 3
    end
  end
end
