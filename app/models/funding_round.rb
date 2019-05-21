class FundingRound

  attr_accessor :investment, :venture_capitalist
  attr_reader :startup, :type

  @@all = []

  def initialize(startup, venture_capitalist, type, investment)
    @startup = startup
    @venture_capitalist = venture_capitalist
    @type = type
    @investment = investment.to_f
    #eturns a number that is the amount invested during this funding round. This should be a float that is not a negative number.
    @@all << self
  end

  def self.all
    @@all
  end

end #end FundingRound Class
