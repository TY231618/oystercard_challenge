class Oystercard

CARD_LIMIT = 90
MIN_LIMIT = 1
  attr_reader :balance, :in_use

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    fail "card limit of #{CARD_LIMIT} exceeded" if over_limit(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_use
  end

  def touch_in
    fail 'not enough money on card' if min_limit
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

  private

  def over_limit(amount)
    balance + amount > CARD_LIMIT
  end

  def min_limit
    @balance < MIN_LIMIT
  end
end
