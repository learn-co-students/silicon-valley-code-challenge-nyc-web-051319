require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
s1 = Startup.new("We", "Charlie","we.com")
s2 = Startup.new("Google", "Mike","google.com")
s3 = Startup.new("Apple", "Steve","apple.com")

vc1 = VentureCapitalist.new("Gabe", 1000000000)
vc2 = VentureCapitalist.new("Nev", 2000000000)
vc3 = VentureCapitalist.new("Mom", 30)

fr1 = FundingRound.new(s1, vc1, "Series A", 100.00)
fr2 = FundingRound.new(s2, vc2, "Series B", 200.00)
fr3 = FundingRound.new(s3, vc3, "Series C", 300.00)

s1.sign_contract(vc2,"series C",400.0)

vc1.offer_contract(s3, "Angel", 200.0)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
