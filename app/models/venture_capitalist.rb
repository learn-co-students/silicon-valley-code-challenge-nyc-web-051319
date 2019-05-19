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
    self.all.select do |venture_capitalist|
      venture_capitalist.total_worth > 1000000000
    end
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select do |funding|
      funding.this_venture_capitalist.name == self.name
    end
  end

  def portfolio
    self.funding_rounds.map do |funding|
      funding.this_startup
    end.uniq
  end

  def biggest_investment
    largest_amount = 0
    largest_funding_round = nil
    self.funding_rounds.each do |funding|
      if funding.investment > largest_amount
        largest_amount = funding.investment
        largest_funding_round = funding
      end
    end
    largest_funding_round
  end

  def invested(domain)
    total = 0
    self.funding_rounds.each do |funding|
      if funding.this_startup.domain == domain
        total += funding.investment
      end
    end
    total
  end


end
