class FundingRound

  @@all = []

  attr_accessor :type, :investment
  attr_reader :startup, :venture_capitalist

  def initialize(startup, venture_capitalist, type, investment)
    @startup = startup
    @venture_capitalist = venture_capitalist
    @type = type
    @investment = investment_checker(investment)
    @@all << self
  end

  def investment_checker(investment)
    if investment.class == Float && investment > 0
      investment
    else
      "This is an invalid investment"
    end
  end

  def self.all
    @@all
  end

end
