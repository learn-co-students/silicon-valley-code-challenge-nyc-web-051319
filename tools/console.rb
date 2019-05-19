require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

stilercorp = Startup.new('Stiler Corp', 'Mendel Stillerman', 'Stiler.com')
facebook = Startup.new('Facebook','Mark Zuckerberg', 'Facebook.com')
apple = Startup.new('Apple', 'Steve Jobs', 'Apple.com')

john = VentureCapitalist.new('John', 1000000001)
sam = VentureCapitalist.new('Sam', 100000000001)
tom = VentureCapitalist.new('Tom', 10000)

VentureCapitalist.tres_commas_club

round_1 = FundingRound.new(stilercorp, john, 'Angel', 125)

stilercorp.sign_contract(john, 'Angel', 745)
stilercorp.sign_contract(tom, 'Angel', 145)
stilercorp.sign_contract(sam, 'Angel', 145)
sam.offer_contract(facebook, 'Angel', 200)
sam.offer_contract(apple, 'Angel', 700)
sam.offer_contract(apple, 'Angel', 700)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line
