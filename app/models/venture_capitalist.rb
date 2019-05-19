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
    self.all.select do |instance|
      instance.total_worth > 1000000000
    end
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.map do |funding_round|
      if funding_round.venture_capitalist == self
        funding_round
      end
    end
  end

  def portfolio
    FundingRound.all.select do |funding_round|
      if funding_round.venture_capitalist == self
        funding_round.startup
      end
    end.uniq
  end

  def biggest_investment
    max_investment = 0
    FundingRound.all.each do |funding_round|
      if funding_round.venture_capitalist == self && funding_round.investment > max_investment
        max_investment = funding_round.investment
      end
    end
    max_investment
  end

  def invested(domain)
    total = 0
    FundingRound.all.each do |funding_round|
      if funding_round.startup.domain == domain && funding_round.venture_capitalist == self
        total += funding_round.investment
      end
    end
    total
  end
end
