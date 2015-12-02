class Journey

attr_reader :journey_log


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


private

  def journey_logger
    @journey_log[@counter] = @current_journeys
    @current_journeys = []
  end

  def tracking
    @counter += 1
  end

end
