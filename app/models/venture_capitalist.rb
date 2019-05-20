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
    self.all.select {|vc| vc.total_worth > 1000000000}
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select {|round| round.venturecapitalist == self}
  end

  def portfolio
    companies = []
    funding_rounds.each {|round| companies << round.startup}
    companies.uniq
  end

  def biggest_investment
    largest_funding = 0
    largest_round = nil
    funding_rounds.each do |round|
      if round.investment > largest_funding
        largest_funding = round.investment
      end
    end
    funding_rounds.each do |round|
      if largest_funding == round.investment
        largest_round = round
      end
    end
    largest_round
  end

  def invested(domain)
    total = 0
    funding_rounds.each do |round|
      if round.startup.domain == domain
        total += round.investment
      end
    end
    total
  end

end
