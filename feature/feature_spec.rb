require './lib/oystercard.rb'

card = Oystercard.new
card.balance

#User Story 1
# In order to use public transport
# As a customer
# I want money on my card

card = Oystercard.new
card.balance
card.top_up(10)
card.balance

#User Story 2
# In order to keep using public transport
# As a customer
# I want to add money to my card

card = Oystercard.new
card.balance
card.top_up(10)
card.balance
card.top_up(81)
card.balance

#User Story 3
# In order to protect my money from theft or loss
# As a customer
# I want a maximum limit (of £90) on my car

card = Oystercard.new
card.balance
card.top_up(10)
card.balance
card.top_up(81)
card.balance
card.deduct(20)
card.balance

#User Story 4
# In order to pay for my journey
# As a customer
# I need my fare deducted from my card
