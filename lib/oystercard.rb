class Oystercard

CARD_LIMIT = 90
MIN_LIMIT = 1
FARE = 1

  attr_reader :balance, :in_use, :entry_station

  def initialize
    @balance = 0
    @in_use = false
    @entry_station = entry_station
  end

  def top_up(amount)
    fail "card limit of #{CARD_LIMIT} exceeded" if over_limit(amount)
    @balance += amount
  end

  def in_journey?
    @in_use
  end

  def touch_in(station)
    fail 'not enough money on card' if min_limit
    @in_use = true
    @entry_station = station
  end

  def touch_out
    deduct(FARE)
    @in_use = false
    @entry_station = nil
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
end
