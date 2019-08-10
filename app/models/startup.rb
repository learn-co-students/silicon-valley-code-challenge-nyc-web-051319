class Startup
  attr_accessor :name
  attr_reader :founder, :domain

  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def pivot(domain, name)
    @domain = domain
    self.name = name
  end

  def self.all
    @@all
  end

  def self.find_by_founder(name)
    self.all.find do |startup|
      startup.founder == name
    end
  end

  def self.domains
    self.all.map do |startup|
      startup.domain
    end
  end

  def sign_contract(venture_capitalist, type, investment)
    round = FundingRound.new(self, venture_capitalist, type, investment)
  end

  def find_funding_round
    FundingRound.all.select do |funding|
      funding.this_startup.name == self.name
    end
  end

  def num_funding_rounds
    self.find_funding_round.length
  end

  def total_funds
    sum = 0
    self.find_funding_round.each do |funding|
        sum += funding.investment
    end
    sum
  end

  def investors
    self.find_funding_round.map do |funding|
      funding.this_venture_capitalist.name
    end.uniq
  end

  def big_investors
    trescommas = self.find_funding_round.select do |funding|
        funding.this_venture_capitalist.total_worth > 1000000000
    end
    trescommas.map do |trescomma|
      trescomma.this_venture_capitalist
    end.uniq
  end

end
