class VentureCapitalist
    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth

        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select do |person|
            person.total_worth > 1000000000.00
        end
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        #return array of funding rounds for given VC
        FundingRound.all.select do |round|
            round.venture_capitalist == self
        end
    end

    def portfolio
        #unique list of all startups a VC has funded
        funding_rounds.map do |round|
            round.startup
        end
    end

    def biggest_investment
        #returns largest fundinground given by VC
        arr = []
        funding_rounds.select do |round|
            arr << round.investment
        end
        arr.sort.last
    end

    def invested(domain)
        total = 0
        funding_rounds.each do |round|
            # binding.pry
            if round.domain == domain
                total += round.investment
            end
        end
        total
    end

end