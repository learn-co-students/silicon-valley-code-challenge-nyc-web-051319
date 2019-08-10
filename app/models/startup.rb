class Startup
  attr_accessor :name
  attr_reader :founder, :domain

  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @domain = domain
    @founder = founder
    @@all << self
  end

  def pivot(name, domain)
    @name = name
    @domain = domain
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder)
    self.all.find do |instance|
      instance.founder == founder
    end
  end

  def self.domains
    self.all.map do |instance|
      instance.domain
    end
  end

  def sign_contract(vc, type, investment)
    FundingRound.new(self, vc, type, investment)
  end

  def num_funding_rounds
    counter = 0
    FundingRound.all.each do |funding_round|
      if funding_round.startup == self
        counter += 1
      end
    end
    counter
  end

  def total_funds
    investments = 0
    FundingRound.all.each do |funding_round|
      if funding_round.startup == self
        investments += funding_round.investment
      end
    end
    investments
  end

  def investors
    FundingRound.all.map do |funding_round|
      if funding_round.startup == self
        funding_round.venture_capitalist
      end
    end.uniq
  end

  def big_investors
    FundingRound.all.map do |funding_round|
      if funding_round.startup == self && VentureCapitalist.tres_commas_club.include?(funding_round.venture_capitalist)
        funding_round.venture_capitalist
      end
    end.uniq
  end
end
