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
    self.all.select do |worth|
      worth.total_worth >= 1000000000
    end
    #returns an array of VCs that have more than 1,000,000,000 net_worth
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
    #given a startup object, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
  end

  def funding_rounds
    FundingRound.all.select do |fundinground|
      fundinground.venture_capitalist == self
    end
    ##LINK##
    #returns an array of all funding rounds for that venture capitalist
    ##do this first
  end

  def portfolio
    funding_rounds.map do |vc|
      vc.startup
    end.uniq
    #Returns a unique list of all startups this venture capitalist has funded
  end

  def biggest_investment
    funding_rounds.max_by do |rounds|
      rounds.investment
    end
    #returns the largest funding round given by this venture capitalist
  end

  def invested(domain)
    total = 0
    funding_rounds.map do |all_money|
      all_money.startup.domain == domain
      total =+ all_money.investment
    end
    #end
    total
  end
    #given a domain string, returns the total amount invested in that domain

end #end VC Class
