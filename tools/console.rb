require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#Startups
a = Startup.new("1", "Bob", "www.1.com")
b = Startup.new("2", "Adam", "www.2.com")
c = Startup.new("3", "Jones", "www.3.com")
d = Startup.new("4", "Kim", "www.3.com")
e = Startup.new("5", "Fred", "www.5.com")

#VCs
ted = VentureCapitalist.new("Teddy", 10000000000)
jones = VentureCapitalist.new("Jones", 10000000)
tony = VentureCapitalist.new("Tony", 540000000)
broke = VentureCapitalist.new("Broke Boy", 54000)
carl = VentureCapitalist.new("Carl", 20000000)



binding.pry
0 #leave this here to ensure binding.pry isn't the last line
