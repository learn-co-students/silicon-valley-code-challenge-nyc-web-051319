class FundingRound

  attr_accessor :type, :investment
  attr_reader :startup, :venture_capitalist

  @@all = []

  def initialize(startup, venture_capitalist,type, investment)
    @startup = startup
    @venture_capitalist = venture_capitalist
    @type = type
    if investment < 0
      @investment = 0
    else
      @investment = investment.to_f

    @@all << self
    end

    def self.all
      @@all
    end



end
