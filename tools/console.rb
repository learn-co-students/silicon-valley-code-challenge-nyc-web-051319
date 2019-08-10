require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#binding.pry

s1 = Startup.new("my startUP", "jim", "tech")
s2 = Startup.new("your startUP", "jess", "food")
s3 = Startup.new("her startUP", "jess", "health")
s4 = Startup.new("new her startUP", "jess", "health")

#puts Startup.find_by_founder("jess")
#puts Startup.domains
#s2.pivot("health","your 2nd su")
#puts Startup.domains

v1 = VentureCapitalist.new("rim", 9999999)
v2 = VentureCapitalist.new("ress", 2000000000)
v3 = VentureCapitalist.new("rones", 2000000000)

f1 = FundingRound.new(s1,v2,"FIRST",10000)
f2 = FundingRound.new(s1,v2,"SECOND",20000)
f3 = FundingRound.new(s1,v3,"SECOND",30000)
f4 = FundingRound.new(s3,v3,"THIRD",40000)
f5 = FundingRound.new(s4,v3,"THIRD",40000)

#puts VentureCapitalist.tres_commas_club
#s1.sign_contract(v3,"THIRD",200)
#puts s1.num_funding_rounds
#puts s1.total_funds
#puts s1.investors
#puts s1.big_investors

v3.offer_contract(s2, "ANGEL",1000)
#puts v3.funding_rounds
#puts v2.portfolios
#puts v3.biggest_investment.investment
puts v3.invested("health")