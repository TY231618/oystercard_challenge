require_relative 'oystercard'

class Journey
  # extend Fowardable

  attr_accessor :current_journey

  def initialize(journey_klass = Journey)
    @current_journey = {}
  end

  def update_entry(station)
    @current_journey[:entry_station] = station
  end

  def update_exit(station)
    @current_journey[:exit_station] = station
  end

  def penalty?
    (current_journey[:entry_station] == nil || current_journey[:exit_station] == nil)
  end

  def complete?
    current_journey.empty? == true
  end
end
