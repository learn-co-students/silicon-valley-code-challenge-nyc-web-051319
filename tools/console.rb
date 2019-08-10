require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

casper = Startup.new("Casper", "Duncan", "casper.com")
billie = Startup.new("Billie", "Michelle", "billie.com")

willem = VentureCapitalist.new("Willem", 1000000)
betsy = VentureCapitalist.new("Betsy", 90000)
jessica = VentureCapitalist.new("Jessica", 2000000000)
emi = VentureCapitalist.new("Emi", 1100000000)

funding_round1 = FundingRound.new(casper, willem, "Seed", 5000)
funding_round2 = FundingRound.new(billie, betsy, "Angel", 1000)
funding_round3 = FundingRound.new(casper, jessica, "Series A", 20000)
funding_round4 = FundingRound.new(casper, willem, "Series B", 1000)
funding_round5 = FundingRound.new(casper, emi, "Seed", 100)
funding_round6 = FundingRound.new(casper, jessica, "Angel", 200)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
