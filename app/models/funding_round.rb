class FundingRound
  attr_reader :startup, :venture_capitalist, :type, :amount

  @@all = []

  def initialize(startup, venture_capitalist, type, amount)
    @startup = startup
    @venture_capitalist = venture_capitalist
    @type = type
    @amount = amount
    @@all << self
  end

  def investment
    @amount.to_f
  end

  def self.all
    @@all
  end

end
