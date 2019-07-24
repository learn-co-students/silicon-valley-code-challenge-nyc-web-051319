require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

tesla = Startup.new("Tesla", "Elon Musk", "Automotive")
apple = Startup.new("Apple", "Steve Jobs", "Computing")
flatiron = Startup.new("Flatiron School", "Avi Flobaum", "Education")
microsoft = Startup.new("Microsoft", "Bill Gates", "Computing")
oculus = Startup.new("Oculus", "Palmer Luckey", "Virtual Reality")
ford = Startup.new("Ford", "Henry Ford", "Automotive")
steam = Startup.new("Steam", "Gabe Newell", "Gaming")

dean = VentureCapitalist.new("Dean", 10000000000.00)
stephen = VentureCapitalist.new("Stephen", 4400000.00)
david = VentureCapitalist.new("David", 999999999.00)
april = VentureCapitalist.new("April", 59734546573.00)
rishi = VentureCapitalist.new("Rishi", 8953.00)
charlie = VentureCapitalist.new("Charlie", 947346.00)

fund1 = FundingRound.new(apple, april, "Alpha", 999.7)
fund2 = FundingRound.new(tesla, dean, "Beta", 73453.4)
fund3 = FundingRound.new(apple, stephen, "DDD", 9922.5)
fund4 = FundingRound.new(apple, rishi, "type c", 9974.1)
fund5 = FundingRound.new(apple, charlie, "beta", 99943.9)



binding.pry
0 #leave this here to ensure binding.pry isn't the last line