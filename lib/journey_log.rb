require_relative 'oystercard'

class JourneyLog
attr_reader :journeys
  def initialize(journey_klass = Journey)
    @journey_klass = journey_klass
    @journeys = {}
  end

  def start_journey
    journey.update_entry
  end

  def exit_journey
    jounrney.update_exit
  end

  def current_journey
    incomplete_journey || journey_klass.new
  end

  def outstanding_charges
    journey.penalty?
  end

  def journeys
    @journeys
  end

  def incomplete_journey
    journey.complete? == false
  end

end
