require 'pry'
class VentureCapitalist

    attr_reader :name
    attr_accessor :total_worth

    @@all = []
    
    def initialize(name, total_worth)
        @name, @total_worth = name, total_worth
        self.class.all << self
    end

    def offer_contract(startup, type, amount)
        FundingRound.new(startup, self, type, amount)
    end

    def funding_rounds
        FundingRound.all.select {|fr| fr.venture_capitalist == self}
    end

    def portfolios
        funding_rounds.map {|fr| fr.startup}.uniq
    end

    def biggest_investment
        funding_rounds.sort_by{|fr| fr.investment}.reverse.first
    end

    def startups_invested
        funding_rounds.map {|fr| fr.startup}.uniq
    end

    def invested(domain)
        startups_invested.inject(0) {|sum, su| su.domain == domain ? sum + su.total_funds : sum}
    end
    
    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select {|vc| vc.total_worth >= 1000000000}
    end
end
