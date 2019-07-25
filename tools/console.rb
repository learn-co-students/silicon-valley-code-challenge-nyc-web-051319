require_relative '../config/environment.rb'
# require_relative '../funding_round.rb'
# require_relative '../startup.rb'
# require_relative '../venture_capitalist.rb'

def reload
  load 'config/environment.rb'
end
#startups
casper = Startup.new("Casper", "Philip", "www.casper.com")
careof = Startup.new("Care/of", "Craig", "www.takecareof.com")
uber = Startup.new("Uber", "Travis", "www.uber.com")
lisa = Startup.new("Lisa", "Lady Lisa", "www.lisa.com")
#venture_caps
vc1 = VentureCapitalist.new("Joe", 2000000000)
vc2 = VentureCapitalist.new("Jaimie", 100)
vc3 = VentureCapitalist.new("Mom", 4000000000)
vc4 = VentureCapitalist.new("Pete", 250)
#funding_rounds
round1 = FundingRound.new(casper, vc1, "round1", 700)
round2 = FundingRound.new(careof, vc2, "round2", 400)
round3 = FundingRound.new(uber, vc3, "round3", 100)
round4 = FundingRound.new(careof, vc1, "round4", 500)
round5 = FundingRound.new(lisa, vc1, "round1", 1000)
round6 = FundingRound.new(casper, vc3, "round6", 1000)
round7 = FundingRound.new(casper, vc2, "round7", 3000)
#test methods here with puts and method, test with console.#!/usr/bin/env ruby

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#offer_contract example
vc1.offer_contract(careof, "Health", 500)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
