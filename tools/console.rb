require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

amazon = Startup.new("Amazon", "Jeff Bezos", "amazon.com")
tesla = Startup.new("Tesla", "Elon Musk", "tesla.com")
facebook = Startup.new("Facebook", "Mark Zuckerburg", "facebook.com")
michael = VentureCapitalist.new("Michael Bloomberg", 1000000)
warren = VentureCapitalist.new("Warren Buffet", 50000000000000)
richard = VentureCapitalist.new("Richard Branson", 10000000000000)
FundingRound.new(tesla, michael, "Seed", 50000)
FundingRound.new(tesla, warren, "Pre-Seed", 300000)
FundingRound.new(amazon, richard, "Angel", 100000)
FundingRound.new(facebook, warren, "Series B", 2000000)
FundingRound.new(amazon, warren, "Series A", 500000)
binding.pry
0 #leave this here to ensure binding.pry isn't the last line
