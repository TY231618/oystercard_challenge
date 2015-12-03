require 'journey'

describe Journey do


   subject(:journey) {described_class.new}
   let(:entry_station) {double :station}
   let(:exit_station) {double :station}

   describe '#journey_history' do

     it 'returns log history' do
       journey.start(entry_station)
       journey.end(exit_station)
       expect(journey.journey_log[1]).to eq [entry_station, exit_station]
     end
   end

   it 'calculates penalty fare' do
     journey.start(entry_station)
     expect(journey.fare).to eq 6
   end

   it 'knows when a journy is not complete' do
     journey.start(entry_station)
     expect(journey.complete).to eq false
   end

   it 'knows when a journy is complete' do
     journey.start(entry_station)
     journey.start(exit_station)
     expect(journey.complete).to eq true
   end

   it 'completes journey if exit with no station given' do
    journey.start(entry_station)
    journey.start(entry_station)
    expect(journey.complete).to eq true
  end



end
