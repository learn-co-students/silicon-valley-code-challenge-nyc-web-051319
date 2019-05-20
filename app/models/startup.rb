class Startup

    attr_accessor :name, :domain
    attr_reader :founder

    @@all = []
    
    def initialize(name, founder, domain)
        @name, @founder, @domain = name, founder, domain
        self.class.all << self
    end

    def pivot(domain, name)
       @domain, @name = domain, name 
    end

    def sign_contract(vc, type, amount)
        FundingRound.new(self, vc, type, amount)
    end

    def funding_rounds
        FundingRound.all.select {|fr| fr.startup == self}
    end

    def num_funding_rounds
        funding_rounds.count
    end

    def total_funds
        funding_rounds.inject(0) {|sum, fr| sum + fr.investment}
    end

    def investors
        funding_rounds.map {|fr| fr.venture_capitalist}.uniq
    end

    def big_investors
        investors & VentureCapitalist.tres_commas_club
    end
    
    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        self.all.find {|startup| startup.founder == founder_name}.name
    end

    def self.domains
        self.all.map {|startup| startup.domain}.uniq
    end
end
