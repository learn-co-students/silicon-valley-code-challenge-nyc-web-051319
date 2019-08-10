class FundingRound
  attr_accessor :type, :investment
  attr_reader :funding_round, :this_startup, :this_venture_capitalist

  @@all = []

  def initialize(startup, venture_capitalist, type, investment)
    @this_startup = startup
    @this_venture_capitalist = venture_capitalist
    @type = type
    @investment = investment
    @@all << self
  end

  def self.all
    @@all
  end

  def startup
    self.this_startup
  end

  def venture_capitalist
    self.this_venture_capitalist
  end

end
