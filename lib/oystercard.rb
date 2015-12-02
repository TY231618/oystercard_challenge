class Oystercard

CARD_LIMIT = 90
MIN_LIMIT = 1
FARE = 1

  attr_reader :balance, :entry_station, :current_journeys, :journey_hist

  def initialize
    @balance = 0
    @current_journeys = []
    @journey_hist = {}
    @counter = 0
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
    tracking
    @in_use = true
    @entry_station = entry_station
    @current_journeys << @entry_station
  end

  def touch_out(exit_station)
    deduct(FARE)
    @in_use = false
    @exit_station = exit_station
    @current_journeys << @exit_station
    journey_log
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

  def journey_log
    @journey_hist[@counter] = @current_journeys
    @current_journeys = []
  end

  def tracking
    @counter += 1
  end

end
