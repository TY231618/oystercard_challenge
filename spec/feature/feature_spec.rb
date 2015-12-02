

# describe 'user stories' do
#
#   # In order to know where I have been
#   # As a customer
#   # I want to see to all my previous trips
#
#   it 'logs journeys' do
#     card = Oystercard.new
#     card.top_up(20)
#     card.touch_in('Victoria')
#     card.touch_out('Camden')
#     card.touch_in('Oxford Street')
#     card.touch_out('Bond Street')
#     expect(card.journeys['entry']).to eq 'Oxford Street'
#
#   end
# end
describe 'User stories' do
it 'returns the zone of given station ' do
  station = Station.new
  expect(station.zone('Balham')).to eq 3

end

it 'returns history log' do
      journey = Journey.new
      journey.start("Victoria")
      journey.end("Camden")
      expect(journey.journey_log[1]).to eq ["Victoria", "Camden"]
    end
end
