class Startup
    attr_accessor :name
    attr_reader :founder, :domain

    @@all = []
    

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain

        @@all << self
    end

    def pivot(domain, name)
        #change name & domain of startup
        @domain = domain
        @name  = name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(name)
        #type in founder name, search all startups for that founder & return
        self.all.find do |company|
            company.founder == name
        end
    end

    def self.domains
        #search through all startups and collect each startup's domain
        self.all.collect do |company|
            company.domain
        end
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
        
    end

    def num_funding_rounds
        #Returns the total number of funding rounds that the startup has gotten
        FundingRound.all.select {|round| round.startup == self}.count
    end

    def startup_self
        FundingRound.all.select {|round| round.startup == self}
    end

    def total_funds
        #Returns the total sum of investments that the startup has gotten
        self.startup_self.map do |startup|
            startup.investment
        end.inject(0){|sum,x| sum + x }
    end
    # Helper Method
    def all_investors
        FundingRound.all.select do |funding|
            funding.startup == self 
        end
    end

    def investors
      all_investors.map do |round|
        round.venture_capitalist
      end
    end

    def big_investors
        #Returns a **unique** array of all the venture capitalists that have invested in this company and are in the Trés Commas club
        # GOTTA be a way to write it like this?! 
        # investors.select do |investor|
        #     investor.include?(VentureCapitalist.tres_commas_club)
        # end
        investors.select do |investor|
            # binding.pry
            investor.total_worth > 1000000000.0
        end
    end

end
