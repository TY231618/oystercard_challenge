require_relative 'journey'
class Oystercard

CARD_LIMIT = 90
MIN_LIMIT = 1


  attr_reader :balance, :entry_station, :journey #:journey_hist

  def initialize
    @balance = 0
    @journey = Journey.new
    @in_use = false
    # @current_journeys = []
    # @journey_hist = {}
    # @counter = 0
  end

  def top_up(amount)
    fail "card limit of #{CARD_LIMIT} exceeded" if over_limit(amount)
    @balance += amount
  end

  def in_journey?
    @in_use
  end

  def touch_in(entry_station)
    fail 'not enough money on card' if min_limit
    # tracking

    @in_use = true
    @entry_station = entry_station
    @journey.start(@entry_station)

    # @current_journeys << @entry_station
  end

  def touch_out(exit_station)
    @in_use = false
    @exit_station = exit_station
    @journey.end(@exit_station)
    deduct(journey.fare)
    journey.clear_journey
    # @current_journeys << @exit_station
    # journey_log
  end

private

  def deduct(amount)
    @balance -= amount
  end

  def over_limit(amount)
    balance + amount > CARD_LIMIT
  end

  def min_limit
    @balance < MIN_LIMIT
  end

  # def journey_log
  #   @journey_hist[@counter] = @current_journeys
  #   @current_journeys = []
  # end

  # def tracking
  #   @counter += 1
  # end

end
