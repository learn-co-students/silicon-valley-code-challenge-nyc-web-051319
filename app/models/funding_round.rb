class FundingRound
    attr_accessor :type, :investment
    attr_reader :startup, :venture_capitalist, :domain

    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @investment = investment.to_f
        @domain = startup.domain

        @@all << self
    end
    
    def self.all
        @@all
    end

end