class FundingRound
    attr_accessor :type, :investment
    attr_reader :startup, :venture_capitalist, :domain

    @@all = []

    def initialize(startup, venture_capitalist, type, investment=0.0)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @investment = investment
        @domain = startup.domain

        @@all << self
    end
    
    def self.all
        @@all
    end

end