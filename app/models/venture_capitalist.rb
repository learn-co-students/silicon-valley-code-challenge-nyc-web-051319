class VentureCapitalist

  attr_accessor :name, :total_worth
  attr_reader

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
    self.all.select do |vc|
      vc.total_worth >= 1000000000
    end
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    funding_rounds = FundingRound.all.select do |round|
      round.venture_capitalist == self
    end
  end

  def portfolio
    rounds = FundingRound.all.select do |round|
      round.venture_capitalist == self
    end
    startups = rounds.map do |round|
      round.startup
    end
    startups.uniq
  end

  def biggest_investment
    rounds = self.funding_rounds
    rounds.sort_by do |round|
      round.investment
    end
    rounds.last
  end

  def invested(domain)
    rounds = FundingRound.all.find do |round|
      round.startup.domain == domain
    end
    rounds.investment
  end

end
