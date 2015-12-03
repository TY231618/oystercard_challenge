require_relative 'oystercard'
class Journey

attr_reader :journey_log, :current_journeys, :complete
PENALTY_FARE = 6

  def initialize
    @current_journeys = []
    @journey_log = {}
    @counter = 0
  end

  def start(entry_station)
    @entry_station = entry_station
    tracking
    @current_journeys << @entry_station
  end

  def end(exit_station)
    @exit_station = exit_station
    @current_journeys << @exit_station
    journey_logger
  end

  def complete
    @current_journeys.size == 1 ? false : true

  end

  def fare
    return PENALTY_FARE if penalty?
    Oystercard::MIN_LIMIT
  end

  def clear_journey
    @current_journeys = []
  end

private

  def penalty?
    true unless @current_journeys.size == 2 || @current_journeys.size == 0
  end

  def journey_logger
    @journey_log[@counter] = @current_journeys
  end


  def tracking
    @counter += 1
  end

end
