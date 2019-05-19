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
    self.all.select {|a| a.total_worth > 1000000000}
  end

  def offer_contract(startup, type, amount)
    FundingRound.new(startup, self, type, amount)
  end

  def funding_rounds
    FundingRound.all.select {|a| a.venture_capitalist == self}
  end

  def portfolio
    funding_rounds.map {|a| a.startup}.uniq
  end

  def biggest_investment
    funding_rounds.max_by {|a| a.amount}
  end

  def invested(domain)
    domains = funding_rounds.select do |a|
      a.startup.domain == domain
    end
    total = domains.inject(0) {|sum, a| sum + a.amount}
  end

end
